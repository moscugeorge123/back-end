using Domain.Entities;
using MediatR;

namespace Application.Features.JoinShopIngredientFeature.Commands
{
    public class UpdateJoinShopIngredient:IRequest<IngredientFromShopShop>
    {
        public int ShopId { get; set; }
        public int IngrdientId { get; set; }
        public int Quantity { get; set; }

    }
}
