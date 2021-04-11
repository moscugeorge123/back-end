using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.DTOs
{
    public class GetShopDto
    {
        public GetShopDto()
        {
            Ingredients = new List<GetShopIngredientDto>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public double LocationX { get; set; }
        public double LocationY { get; set; }
        public List<GetShopIngredientDto> Ingredients { get; set; }
    }
}
