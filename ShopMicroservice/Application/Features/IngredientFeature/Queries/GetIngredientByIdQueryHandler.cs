using Application.Interfaces;
using Domain.Dtos;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.IngredientFeature.Queries
{
    public class GetIngredientByIdQueryHandler:IRequestHandler<GetIngredientByIdQuery,GetIngredientDto>
    {
        private readonly IIngredientRepository repository;
        public GetIngredientByIdQueryHandler(IIngredientRepository repository)
        {
            this.repository = repository;
        }
        public async Task<GetIngredientDto> Handle(GetIngredientByIdQuery request, CancellationToken cancellationToken)
        {
            var ingredient = await repository.GetById(request.Id);

            var getIngredientDto = new GetIngredientDto()
            {
                Id = ingredient.Id,
                Name = ingredient.Name,
                Price = ingredient.Price
            };
            return getIngredientDto;
        }
    }
}
