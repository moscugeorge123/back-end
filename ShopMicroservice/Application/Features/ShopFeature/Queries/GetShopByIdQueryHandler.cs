using Application.Interfaces;
using Domain.Dtos;
using Domain.Entities;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.ShopFeature.Queries
{

    public class GetShopByIdQueryHandler:IRequestHandler<GetShopByIdQuery,GetShopDto>
    {
        private readonly IApplicationContext context;
        private readonly IShopRepository repository;
        public GetShopByIdQueryHandler(IApplicationContext context,IShopRepository repository)
        {
            this.context = context;
            this.repository = repository;
        }
        public async Task<GetShopDto> Handle(GetShopByIdQuery request, CancellationToken cancellationToken)
        {
            var shop = await repository.GetById(request.Id);

            if (shop == null)
            {
                throw new ArgumentNullException(nameof(request));
            }


            List<int> ingredientsId = await context.JoinIngredientShop
                .Where(p => p.ShopsId == request.Id)
                .Select(p => p.IngredientsId)
                .ToListAsync(cancellationToken);
            GetShopDto shopDto = new GetShopDto()
            {
                Id = shop.Id,
                Name = shop.Name,
                LocationX = shop.LocationX,
                LocationY = shop.LocationY,
                
            };
            foreach (int i in ingredientsId)
            {
                IngredientsFromShop ingredient = await context
                    .Ingredients
                    .FindAsync(i,cancellationToken);
                GetIngredientDto getIngredientDto = new GetIngredientDto();
                getIngredientDto.Id = ingredient.Id;
                getIngredientDto.Name = ingredient.Name;
                getIngredientDto.Price = ingredient.Price;
                //voi lua si cantitatea specifica ingredientului din shopul respectiv
                int quantity = context.JoinIngredientShop
                    .Where(p => (p.IngredientsId == ingredient.Id) && (p.ShopsId == shopDto.Id))
                    .Select(p => p.Quantity)
                    .FirstOrDefault();
                getIngredientDto.Quantity = quantity;
                shopDto.Ingredients.Add(getIngredientDto);
            }
            return shopDto;
        }

        
    }
}
