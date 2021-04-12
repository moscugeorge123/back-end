using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public interface IProductRepository
    {
        Task<bool> CreateProduct(Product product);
        Task<IEnumerable<GetProductDto>> GetAll();
        Task<Product> GetById(int Id);
    }
}