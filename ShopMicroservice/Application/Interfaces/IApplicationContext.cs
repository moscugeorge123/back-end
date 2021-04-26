using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IApplicationContext
    {
        DbSet<IngredientsFromShop> Ingredients { get; set; }
        DbSet<Shop> Shops { get; set; }
        DbSet<IngredientFromShopShop> JoinIngredientShop { get; set; }
        Task<int> SaveChangesAsync();

    }
}
