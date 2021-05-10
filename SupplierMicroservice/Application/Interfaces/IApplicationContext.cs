using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IApplicationContext
    {
        DbSet<IngredientFromShopShop> JoinIngredientShop { get; set; }
        Task<int> SaveChangesAsync();
   

    }
}
