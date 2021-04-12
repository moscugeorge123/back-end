using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using System.Threading.Tasks;

namespace HotDiggetyDog.Data
{
    public interface IIngredientFromProductRepository
    {
        Task<bool> CreateIngredient(IngredientsFromProduct ingredient);
        Task<GetIngredientDto> GetById(int id);
    }
}