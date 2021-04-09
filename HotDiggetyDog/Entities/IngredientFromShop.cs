using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class IngredientFromShop : Ingredient
    {
        
        public int Qunatity { get; set; }
        public IList<ShopIngredient> ShopIngredient { get; set; }
    }
}
