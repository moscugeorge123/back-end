using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class IngredientFromShop : Ingredient
    {
        
        public int Quantity{ get; set; }
        public float Price { get; set; }
        public virtual ICollection<Shop> Shops { get; set; }
    }
}
