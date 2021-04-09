using System;
using System.Collections;
using System.Collections.Generic;

namespace HotDiggetyDog.Entities
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public float Price { get; set; }

        public string Description { get; set; }
        //public virtual IList<ProductIngredient> ProductIngredients { get; set; }
        public  ICollection<IngredientFromProduct> Ingredients { get; set; }
        public float Discount { get; set; }


        

    }
}
