using Application.Interfaces;
using Domain.Entities;
using Persistance.Context;

namespace Persistance.Repository.v1
{
    public class IngredientRepository : Repository<IngredientsFromShop>, IIngredientRepository
    {
        public IngredientRepository(ShopContext shopContext) : base(shopContext)
        {
        }
    }
}
