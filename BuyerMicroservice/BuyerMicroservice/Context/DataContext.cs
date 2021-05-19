using Microsoft.EntityFrameworkCore;
using BuyerMicroservice.Entities;
using HotDiggetyDog.Entities;
using BuyerMicroservice.Migrations;
using Domain.Entities;

namespace BuyerMicroservice.Context
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<IngredientsFromProduct> Ingredients { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }
        public virtual DbSet<SalesHistory> SalesHistories { get; set; }
        public virtual DbSet<IngredientFromProductProduct> IngredientFromProductProducts { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Domain.Entities.Shop> Shops { get; set; }
        public virtual DbSet<IngredientsFromShop> IngredientsFromShop { get; set; }
        public virtual DbSet<IngredientFromShopShop> IngredientFromShopShop { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {


            modelBuilder.Entity<IngredientFromShopShop>(entity =>
            {
                entity.HasKey(e => new { e.IngredientsId, e.ShopsId });

                entity.ToTable("IngredientFromShopShop");

                entity.HasIndex(e => e.ShopsId, "IX_IngredientFromShopShop_ShopsId");

                entity.HasOne(d => d.Ingredients)
                    .WithMany(p => p.IngredientFromShopShops)
                    .HasForeignKey(d => d.IngredientsId);

                entity.HasOne(d => d.Shops)
                    .WithMany(p => p.IngredientFromShopShops)
                    .HasForeignKey(d => d.ShopsId);
            });



            modelBuilder.Entity<IngredientsFromShop>(entity =>
            {
                entity.ToTable("IngredientsFromShop");
            });

        }
    }
}
