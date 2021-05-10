using Application.Interfaces;
using Domain.Dtos;
using MediatR;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.JoinShopIngredientFeature.Queries
{
    public class GetIngredientsFromShopQueryHandler : IRequestHandler<GetIngredientsFromShopQuery, IEnumerable<IngredientsFromShopDto>>
    {
        private readonly IApplicationContext context;
        public GetIngredientsFromShopQueryHandler(IApplicationContext context)
        {
            this.context = context;
        }

        public async Task<IEnumerable<IngredientsFromShopDto>> Handle(GetIngredientsFromShopQuery request, CancellationToken cancellationToken)
        {
            var relations = await context.JoinIngredientShop.ToListAsync(cancellationToken);

            var result = new List<IngredientsFromShopDto>();
            foreach (var relation in relations)
            {
                if(relation.Quantity == 0)
                {
                    result.Add(new IngredientsFromShopDto()
                    {
                        IngrdientId = relation.IngredientsId,
                        ShopId = relation.ShopsId,
                        Quantity = relation.Quantity
                    }); 
                }
            }

            return result;
        }
    }
}
