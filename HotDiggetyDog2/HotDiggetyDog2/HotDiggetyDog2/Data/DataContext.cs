using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;

namespace HotDiggetyDog.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {
        }
      

        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<IngredientFromShop> IngredientsFromShop { get; set; }
        public DbSet<Shop> Shops { get; set; }
        public DbSet<IngredientFromProduct> IngredientsFromProduct { get; set; }
        
        



    }
}
