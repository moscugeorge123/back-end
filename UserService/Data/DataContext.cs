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
            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
