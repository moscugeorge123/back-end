using Domain.Dtos;
using MediatR;

namespace Application.Features.IngredientFeature.Queries
{
    public class GetIngredientByIdQuery:IRequest<GetIngredientDto>
    {
        public int Id { get; set; }
    }
}
