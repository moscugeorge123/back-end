using Microsoft.EntityFrameworkCore;
using BuyerMicroservice.Entities;
namespace BuyerMicroservice.Context
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ShoppingCart> ShoppingCarts { get; set; }
        public virtual DbSet<SalesHistory> SalesHistories { get; set; }
    }
}
