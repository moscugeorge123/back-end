using Application.Interfaces;
using Domain.DTOs;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebAPI.Controllers.v1
{
    [ApiVersion("1.0")]
    public class ExportCsvController : BaseApiController
    {
        private readonly IApplicationContext context;
        private readonly IProductRepository repository;
        public ExportCsvController(IMediator mediator, IApplicationContext context, IProductRepository repository) : base(mediator)
        {
            this.context = context;
            this.repository = repository;
        }

        [HttpGet]
        [Route("download")]
        public async Task<FileResult> Download()
        {
            StringBuilder result = new StringBuilder();
            var products = repository.GetAll();
            List<GetProductDto> listProducts = new List<GetProductDto>();
            foreach (var product in products)
            {


                List<int> ingredientsId = await context.IngredientFromProductProducts
                    .Where(p => p.ProductsId == product.Id)
                    .Select(p => p.IngredientsId)
                    .ToListAsync();
                GetProductDto productDto = new GetProductDto()
                {
                    Id = product.Id,
                    Name = product.Name,
                    Description = product.Description,
                    Price = product.Price,
                    Discount = product.Discount
                };
                foreach (int i in ingredientsId)
                {
                    IngredientsFromProduct ingredient = await context
                        .Ingredients
                        .FindAsync(i);
                    productDto.Ingredients
                        .Add(new GetIngredientDto() { Id = ingredient.Id, Name = ingredient.Name });
                }
                listProducts.Add(productDto);


            }
            result.Append("Id, Name, Description, Price, Discount\n");
            foreach (GetProductDto p in listProducts)
            {
                result.Append(String.Format("{0}, {1}, {2}, {3}, {4}\n", p.Id, p.Name, p.Description, p.Price, p.Discount));
            }

            string fileName = "Products.csv";

            byte[] fileBytes = Encoding.ASCII.GetBytes(result.ToString());

            return File(fileBytes, "text/csv", fileName); // this is the key!
        }
    }
}
