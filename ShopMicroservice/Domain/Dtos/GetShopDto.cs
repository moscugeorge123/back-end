using System.Collections.Generic;

namespace Domain.Dtos
{
    public class GetShopDto
    {
        public GetShopDto()
        {
            Ingredients = new List<GetIngredientDto>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public double LocationX { get; set; }
        public double LocationY { get; set; }
        
        public List<GetIngredientDto> Ingredients { get; set; }
    }
}
