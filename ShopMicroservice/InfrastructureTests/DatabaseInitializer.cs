using Domain.Entities;
using Persistance.Context;
using System.Linq;

namespace InfrastructureTests
{
    public class DatabaseInitializer
    {
        public static void Initialize(ShopContext context)
        {
            if (context.Shops.Any())
            {
                return;
            }
            Seed(context);
        }

        private static void Seed(ShopContext context)
        {
            var shops = new[]
            {
                new Shop
                {
                    Id = 10,
                    LocationX = 55,
                    LocationY = 55,
                    Name = "Xunit Shop"

                },
                new Shop
                {
                    Id = 11,
                    LocationX = 66,
                    LocationY = 66,
                    Name = "Another Shop"

                },
            };
            context.Shops.AddRange(shops);
            context.SaveChanges();
        }
    }
}
