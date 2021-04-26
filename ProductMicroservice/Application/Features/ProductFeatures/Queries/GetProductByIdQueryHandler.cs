﻿using Application.Interfaces;
using Domain.DTOs;
using Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;


namespace Application.Features.ProductFeatures.Queries
{
    public class GetProductByIdQueryHandler : IRequestHandler<GetProductByIdQuery, GetProductDto>
    {
        
        private readonly IProductRepository productRepository;
        private readonly IApplicationContext context;

        public GetProductByIdQueryHandler(IProductRepository productRepository, IApplicationContext context)
        {
            
            this.productRepository = productRepository;
            
            this.context = context;
        }
        public async Task<GetProductDto> Handle(GetProductByIdQuery request, CancellationToken cancellationToken)
        {
            var product = await productRepository.GetById(request.Id);

            if(product==null)
            {
                throw new Exception("Product doesn't exist");
            }


            List<int> ingredientsId = await context.IngredientFromProductProducts
                .Where(p => p.ProductsId == request.Id)
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
            return productDto;
        }
    }
}
