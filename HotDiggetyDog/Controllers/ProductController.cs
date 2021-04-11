using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/products")]
    public class ProductController : ControllerBase
    {
        private readonly DataContext context;
        public ProductController(DataContext context)
        {
            this.context = context;

        }
        [HttpGet("{Id}")]
        public async Task<ActionResult<GetProductDto>> Get(int Id)
        {
            var product = await context.Products.FindAsync(Id);
            if (product == null)
                return NotFound();
            List<int> ingredientsId = await context.IngredientFromProductProducts
                .Where(p => p.ProductsId == Id)
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
            foreach(int i in ingredientsId)
            {
                IngredientsFromProduct ingredient = await context
                    .IngredientsFromProducts
                    .FindAsync(i);
                productDto.Ingredients
                    .Add(new GetIngredientDto() { Id = ingredient.Id, Name = ingredient.Name });
            }
            return Ok(productDto);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetProductDto>>> Get()
        {
            //string callingUrl = Request.GetTypedHeaders().Referer.ToString();
            //string callingUrl = HttpContext.Request.GetTypedHeaders().Referer.ToString();
            //return  Ok(callingUrl);
            List<Product> products = await context.Products.ToListAsync();
            List<GetProductDto> productDtos = new List<GetProductDto>();
            foreach (Product product in products)
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
                        .IngredientsFromProducts
                        .FindAsync(i);
                    productDto.Ingredients
                        .Add(new GetIngredientDto() { Id = ingredient.Id, Name = ingredient.Name });
                }
                productDtos.Add(productDto);
            }
            return Ok(productDtos);
        }
        [HttpPost]
        public async Task<ActionResult> Add(Product product)
        {

            bool existsProduct = this.context.Products.Any(p => p.Id == product.Id);
            if (!existsProduct)
            {
                context.Products.Add(product);
                await context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = product.Id }, product);

            }
            return UnprocessableEntity("Product already exists");
        }

    }
    [ApiController]
    [Route("api/products/ingredients")]
    public class IngredientsController : ControllerBase
    {
        private readonly DataContext _context;
        public IngredientsController(DataContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetIngredientDto>>> Get()
        {
            List<GetIngredientDto> ingredients = await _context
                .IngredientsFromProducts
                .Select(i => new GetIngredientDto() { Id = i.Id, Name = i.Name })
                .ToListAsync();
            return Ok(ingredients);
        }
        [HttpPost]
        public async Task<ActionResult> Add(IngredientsFromProduct ingredient)
        {
            bool existsIngredient = _context.IngredientsFromProducts.Any(i => i.Id == ingredient.Id);
            if (!existsIngredient)
            {
                _context.IngredientsFromProducts.Add(ingredient);
                await _context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = ingredient.Id }, ingredient);
            }
            return UnprocessableEntity("Product already exists");
        }
    }
    [ApiController]
    [Route("api/ingredient-product")]
    public class IngredientProductController : ControllerBase
    {
        private readonly DataContext _dataContext;
        public IngredientProductController(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IngredientFromProductProduct>>> Get()
        {
            return Ok(await _dataContext.IngredientFromProductProducts.ToListAsync());
        }
        [HttpPost]
        public async Task<ActionResult> Add(IngredientFromProductProduct relation)
        {
            bool alreadyExists = _dataContext.IngredientFromProductProducts.Any(s => s.ProductsId == relation.ProductsId && s.IngredientsId == relation.IngredientsId);
            if (alreadyExists)
                return UnprocessableEntity();
            await _dataContext.IngredientFromProductProducts.AddAsync(relation);
            await _dataContext.SaveChangesAsync();
            return CreatedAtAction("Get", new { ProductId = relation.ProductsId, IngredientId = relation.IngredientsId }, relation);
        }

    }

}
