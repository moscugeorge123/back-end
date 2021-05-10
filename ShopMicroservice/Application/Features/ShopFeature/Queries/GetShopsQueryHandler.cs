using Application.Interfaces;
using Domain.Dtos;
using Domain.Entities;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.ShopFeature.Queries
{
    public class GetShopsQueryHandler : IRequestHandler<GetShopsQuery, IEnumerable<GetShopDto>>
    {
        private readonly IApplicationContext context;
        private readonly IShopRepository repository;
        public GetShopsQueryHandler(IApplicationContext context, IShopRepository repository)
        {
            this.context = context;
            this.repository = repository;
        }
        public async Task<IEnumerable<GetShopDto>> Handle(GetShopsQuery request, CancellationToken cancellationToken)
        {
            var shops =  repository.GetAll();
            List<GetShopDto> listShops = new List<GetShopDto>();
            foreach (var shop in shops)
            {

                List<int> ingredientsId =  context.JoinIngredientShop
                    .Where(p => p.ShopsId == shop.Id)
                    .Select(p => p.IngredientsId)
                    .ToList();
                GetShopDto shopDto = new GetShopDto()
                {
                    Id = shop.Id,
                    Name = shop.Name,
                    LocationX = shop.LocationX,
                    LocationY = shop.LocationY,

                };
                foreach (int i in ingredientsId)
                {
                    IngredientsFromShop ingredient =  await context.Ingredients.FindAsync(i);
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
                listShops.Add(shopDto);
            }
            return  listShops;

        }

      
    }
}
