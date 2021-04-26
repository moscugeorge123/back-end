using Application.Interfaces;
using Domain.Dtos;
using MediatR;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.OrderFeature.Commands
{
    public class CreateOrderCommandHandler : IRequestHandler<CreateOrderCommand,int>
    {
        private readonly IApplicationContext _context;
        public CreateOrderCommandHandler(IApplicationContext context)
        {
            _context = context;
        }
        public async Task<int>Handle(CreateOrderCommand request, CancellationToken cancellationToken)
        {
            foreach(GetProductDto product in request.Products)
            {
                List<GetIngredientDto> ingredients = product.Ingredients;
                await SubstractIngredientsFromShop(ingredients,request.ShopId);
            }
            return request.ShopId;
        }
        public async Task<bool>SubstractIngredientsFromShop(List<GetIngredientDto>ingredients,int shopId)
        {
            foreach(GetIngredientDto ingredient in ingredients)
            {
                var relation = _context.JoinIngredientShop.Find(ingredient.Id,shopId);
                relation.Quantity=relation.Quantity-1;
                _context.JoinIngredientShop.Update(relation);
                await _context.SaveChangesAsync();
            }
            return true;
        }
    }
}
