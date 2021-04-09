using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;

namespace HotDiggetyDog.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions options) : base(options)
        {
        }
        /*protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
        }*/

        /* protected override void OnModelCreating(ModelBuilder modelBuilder)
         {
             modelBuilder.Entity<ShopIngredient>().HasKey(sc => new { sc.ShopId, sc.IngredientId });

             modelBuilder.Entity<ProductIngredient>().HasKey(sc => new { sc.ProductId, sc.IngredientId });



         }*/
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CharacterSkill>()
                .HasKey(cs => new { cs.CharacterId, cs.SkillId });
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Product> Products { get; set; }
       // public DbSet<IngredientFromShop> IngredientFromShops { get; set; }
     //   public DbSet<Shop> Shops { get; set; }
        public DbSet<IngredientFromProduct> IngredientFromProducts { get; set; }
        // public DbSet<ShopIngredient> ShopIngredients { get; set; }
        //public DbSet<ProductIngredient> ProductIngredients { get; set; }



        public DbSet<Skill> Skills { get; set; }
        public DbSet<Character> Characters { get; set; }
        public DbSet<CharacterSkill> CharacterSkills { get; set; }

    }
}
