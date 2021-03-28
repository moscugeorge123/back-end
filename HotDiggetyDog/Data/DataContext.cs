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
    }
}
