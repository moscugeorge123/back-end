using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public class IngredientFromProductRepository : IIngredientFromProductRepository
    {
        private readonly DataContext _context;
        public IngredientFromProductRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<bool> CreateIngredient(IngredientsFromProduct ingredient)
        {
            bool existsIngredient = _context.IngredientsFromProducts.Any(p => p.Id == ingredient.Id);
            if (!existsIngredient)
            {
                _context.IngredientsFromProducts.Add(ingredient);
                await _context.SaveChangesAsync();
                return true;
            }
            return false;
        }
        public async Task<GetIngredientDto> GetById(int id)
        {
            var ingredient = await _context.IngredientsFromProducts.Where(i => i.Id == id)
                                  .Select(i => new GetIngredientDto() { Id = i.Id, Name = i.Name }).FirstOrDefaultAsync();
            return ingredient;
        }
    }
}
