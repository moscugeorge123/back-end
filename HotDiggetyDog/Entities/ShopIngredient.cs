using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class ShopIngredient
    {
        public int ShopId { get; set; }
        public Shop Shop { get; set; }
        public int IngredientId { get; set; }
        public IngredientFromShop IngredientFromShop { get; set; }

    }
}
