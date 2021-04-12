using HotDiggetyDog.Entities;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public class IngredientProductRepository : IIngredientProductRepository
    {
        private readonly DataContext _dataContext;
        public IngredientProductRepository(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task<bool> CreateRelation(IngredientFromProductProduct relation)
        {
            bool alreadyExists = _dataContext.IngredientFromProductProducts.Any(s => s.ProductsId == relation.ProductsId && s.IngredientsId == relation.IngredientsId);
            if (alreadyExists)
                return true;
            await _dataContext.IngredientFromProductProducts.AddAsync(relation);
            await _dataContext.SaveChangesAsync();
            return false;
        }
    }
}
