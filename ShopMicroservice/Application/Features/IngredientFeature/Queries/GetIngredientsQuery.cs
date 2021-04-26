using Domain.Dtos;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.IngredientFeature.Queries
{
    public class GetIngredientsQuery:IRequest<IEnumerable<GetIngredientDto>>
    {
    }
}
