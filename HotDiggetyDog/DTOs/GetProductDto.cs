using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.DTOs
{
    public class GetProductDto
    {
        public GetProductDto()
        {
            Ingredients = new List<GetIngredientDto>();
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public double Price { get; set; }
        public double Discount { get; set; }
        public List<GetIngredientDto> Ingredients { get; set; }

    }
}
