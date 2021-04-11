using System.Collections.Generic;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class Shop
    {
        public Shop()
        {
            IngredientFromShopShops = new HashSet<IngredientFromShopShop>();
        }

        public int Id { get; set; }
        public double LocationX { get; set; }
        public double LocationY { get; set; }
        public string Name { get; set; }
        
        public virtual ICollection<IngredientFromShopShop> IngredientFromShopShops { get; set; }
    }
}
