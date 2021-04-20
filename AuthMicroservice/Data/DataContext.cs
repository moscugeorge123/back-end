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
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlite("Data Source=hotdogapp.db");
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
