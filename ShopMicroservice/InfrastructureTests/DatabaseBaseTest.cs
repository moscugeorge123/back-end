using Microsoft.EntityFrameworkCore;
using Persistance.Context;
using System;

namespace InfrastructureTests
{
    public class DatabaseBaseTest : IDisposable
    {
        protected readonly ShopContext context;
        public DatabaseBaseTest()
        {
            var options = new DbContextOptionsBuilder<ShopContext>().UseInMemoryDatabase("Temp").Options;
            context = new ShopContext(options);
            context.Database.EnsureCreated();
            DatabaseInitializer.Initialize(context);
        }
        public void Dispose()
        {
            context.Database.EnsureDeleted();
            context.Dispose();
        }
    }
}
