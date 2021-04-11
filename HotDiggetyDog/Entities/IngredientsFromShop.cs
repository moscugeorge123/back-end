using System.Collections.Generic;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class IngredientsFromShop
    {
        public IngredientsFromShop()
        {
            IngredientFromShopShops = new HashSet<IngredientFromShopShop>();
        }

        public int Id { get; set; }
        public double Price { get; set; }
        public string Name { get; set; }
        public virtual ICollection<IngredientFromShopShop> IngredientFromShopShops { get; set; }
    }
}
