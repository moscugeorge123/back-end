using HotDiggetyDog.Entities;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public interface IIngredientProductRepository
    {
        Task<bool> CreateRelation(IngredientFromProductProduct relation);
    }
}