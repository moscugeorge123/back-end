using Domain.Dtos;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.JoinShopIngredientFeature.Queries
{
    public class GetIngredientsFromShopQuery : IRequest<IEnumerable<IngredientsFromShopDto>>
    {
    }
}
