using Domain.Entities;
using Application.Interfaces;
using Persistance.Context;

namespace Persistance.Repository.v1
{
    public class ShopRepository : Repository<Shop>, IShopRepository
    {
        public ShopRepository(ShopContext shopContext) : base(shopContext)
        {
        }
    }
}
