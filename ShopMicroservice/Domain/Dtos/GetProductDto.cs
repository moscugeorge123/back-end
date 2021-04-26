using System.Collections.Generic;

namespace Domain.Dtos
{
    public class GetProductDto
    {
        public GetProductDto()
        {
            Ingredients = new List<GetIngredientDto>();
        }
        public int Id { get; set; }
        public List<GetIngredientDto> Ingredients { get; set; }
    }
}
