using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public class ProductRepository : IProductRepository
    {
        private readonly DataContext _context;
        public ProductRepository(DataContext dataContext)
        {
            _context = dataContext;
        }
        public async Task<Product> GetById(int Id)
        {
            var product = await _context.Products.FindAsync(Id);

            List<int> ingredientsId = await _context.IngredientFromProductProducts
                .Where(p => p.ProductsId == Id)
                .Select(p => p.IngredientsId)
                .ToListAsync();
            GetProductDto productDto = new GetProductDto()
            {
                Id = product.Id,
                Name = product.Name,
                Description = product.Description,
                Price = product.Price,
                Discount = product.Discount
            };
            foreach (int i in ingredientsId)
            {
                IngredientsFromProduct ingredient = await _context
                    .IngredientsFromProducts
                    .FindAsync(i);
                productDto.Ingredients
                    .Add(new GetIngredientDto() { Id = ingredient.Id, Name = ingredient.Name });
            }
            return product;

        }
        public async Task<IEnumerable<GetProductDto>> GetAll()
        {
            List<Product> products = await _context.Products.ToListAsync();
            List<GetProductDto> productDtos = new List<GetProductDto>();
            foreach (Product product in products)
            {
                List<int> ingredientsId = await _context.IngredientFromProductProducts
                   .Where(p => p.ProductsId == product.Id)
                   .Select(p => p.IngredientsId)
                   .ToListAsync();
                GetProductDto productDto = new GetProductDto()
                {
                    Id = product.Id,
                    Name = product.Name,
                    Description = product.Description,
                    Price = product.Price,
                    Discount = product.Discount
                };
                foreach (int i in ingredientsId)
                {
                    IngredientsFromProduct ingredient = await _context
                        .IngredientsFromProducts
                        .FindAsync(i);
                    productDto.Ingredients
                        .Add(new GetIngredientDto() { Id = ingredient.Id, Name = ingredient.Name });
                }
                productDtos.Add(productDto);
            }
            return productDtos;
        }
        public async Task<bool> CreateProduct(Product product)
        {
            bool existsProduct = _context.Products.Any(p => p.Id == product.Id);
            if (!existsProduct)
            {
                _context.Products.Add(product);
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }
    }
}
