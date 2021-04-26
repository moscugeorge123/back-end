using MediatR;

namespace Application.Features.JoinShopIngredientFeature.Commands
{
    public class CreateJoinShopIngredient:IRequest<bool>
    {
        public int ShopId { get; set; }
        public int IngrdientId { get; set; }
        public int Quantity { get; set; }

    }
}
