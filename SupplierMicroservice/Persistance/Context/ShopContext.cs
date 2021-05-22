using Application.Interfaces;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Persistance.Context
{
    public partial class ShopContext : DbContext, IApplicationContext
    {
        public ShopContext()
        {
        }

        public ShopContext(DbContextOptions<ShopContext> options)
            : base(options)
        {
        }


        public virtual DbSet<IngredientFromShopShop> JoinIngredientShop { get; set; }

        public async Task<int> SaveChangesAsync()
        {
            return await base.SaveChangesAsync();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlite("Data Source=..\\..\\BuyerMicroservice\\BuyerMicroservice\\hotdogapp.db");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            modelBuilder.Entity<IngredientFromShopShop>(entity =>
            {
                entity.HasKey(e => new { e.IngredientsId, e.ShopsId });

                entity.ToTable("IngredientFromShopShop");

                entity.HasIndex(e => e.ShopsId, "IX_IngredientFromShopShop_ShopsId");
            });



        }

    }
}
