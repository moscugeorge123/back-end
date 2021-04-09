using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class IngredientFromProduct:Ingredient
    {
        //public virtual IList<ProductIngredient> ProductIngredient { get; set; }
        public  ICollection<Product> Products { get; set; }
    }
}
