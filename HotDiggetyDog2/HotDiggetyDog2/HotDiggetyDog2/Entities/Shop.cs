using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class Shop
    {
        public Guid Id { get; set; }
        public float LocationX { get; set; }
        public float LocationY { get; set; }
        public string Name { get; set; }
        public virtual ICollection<IngredientFromShop> Ingredients { get; set; }

    }
}
