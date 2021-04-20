using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace HotDiggetyDog.Data
{
    public partial class DataContext : DbContext
    {
        public DataContext()
        {
        }

        public DataContext(DbContextOptions<DataContext> options)
            : base(options)
        {
        }

        public virtual DbSet<IngredientFromProductProduct> IngredientFromProductProducts { get; set; }
        public virtual DbSet<IngredientFromShopShop> IngredientFromShopShops { get; set; }
        public virtual DbSet<IngredientsFromProduct> IngredientsFromProducts { get; set; }
        public virtual DbSet<IngredientsFromShop> IngredientsFromShops { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Shop> Shops { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseNpgsql("Host=ec2-176-34-123-50.eu-west-1.compute.amazonaws.com;Database=d86382kqsqn974;Username=yyerfypaztckdd;Password=f15cc1cbf9526a84a52cf3542198edb1619877e894034c6e4b821cecb1a5728d;sslmode=Require;Trust Server Certificate=true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<IngredientFromProductProduct>(entity =>
            {
                entity.HasKey(e => new { e.IngredientsId, e.ProductsId });

                entity.ToTable("IngredientFromProductProduct");

                entity.HasIndex(e => e.ProductsId, "IX_IngredientFromProductProduct_ProductsId");

                entity.HasOne(d => d.Ingredients)
                    .WithMany(p => p.IngredientFromProductProducts)
                    .HasForeignKey(d => d.IngredientsId);

                entity.HasOne(d => d.Products)
                    .WithMany(p => p.IngredientFromProductProducts)
                    .HasForeignKey(d => d.ProductsId);
            });

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

            modelBuilder.Entity<IngredientsFromProduct>(entity =>
            {
                entity.ToTable("IngredientsFromProduct");
            });

            modelBuilder.Entity<IngredientsFromShop>(entity =>
            {
                entity.ToTable("IngredientsFromShop");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
