using Domain.Entities;
using FakeItEasy;
using FluentAssertions;
using Persistance.Context;
using Persistance.Repository.v1;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;
namespace InfrastructureTests
{
    public class RepositoryTest //: DatabaseBaseTest
    {
        private readonly ShopContext context;
        private readonly Repository<Shop> repository;
        private readonly Shop newShop;
        public RepositoryTest()
        {
            context = A.Fake<ShopContext>();
            repository = new Repository<Shop>(context);
            newShop = new Shop
            {
                Id = 12,
                LocationX = 77,
                LocationY = 77,
                Name = "JohnDoeShop"
            };
        }
        [Fact]
        public async void Given_NewShop_When_ShopIsNotNull_Then_AddAsyncShouldReturnANewShop()
        {
            var result = await repository.AddAsync(newShop);
            result.Should().BeOfType<Shop>();
        }
        [Fact]
        public async void Given_Shop_When_ShopAlreadyExists_Then_DeleteAsyncShouldReturnTheShop()
        {
            await repository.AddAsync(newShop);
            var result = await repository.DeleteAsync(newShop);
            result.Should().BeOfType<Shop>();
        }
        [Fact]
        public async void Given_Shop_When_ShopAlreadyExists_Then_GetByIdShouldReturnTheShop()
        {
            await repository.AddAsync(newShop);
            context.SaveChanges();
            var result = repository.GetById(newShop.Id);
            result.Should().BeOfType<Task<Shop>>();
        }
       /* [Fact]
        public void Given_NoArguments_When_ThereAreShops_Then_GetAllShouldReturnIEnumberable()
        {
            repository.AddAsync(newShop);
            var result = repository.GetAll();
            result.Should().BeOfType<Castle.Proxies.DbSet>();
        }*/
    }
}
