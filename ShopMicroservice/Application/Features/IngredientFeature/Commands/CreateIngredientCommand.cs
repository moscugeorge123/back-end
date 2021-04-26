using MediatR;

namespace Application.Features.IngredientFeature.Commands
{
    public class CreateIngredientCommand : IRequest<int>
    {
        public int Id { get; set; }
        public double Price { get; set; }
        public string Name { get; set; }
    }
}
