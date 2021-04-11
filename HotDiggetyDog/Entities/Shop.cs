using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class Shop
    {
        public Shop()
        {
            IngredientFromShopShops = new HashSet<IngredientFromShopShop>();
        }
        [JsonIgnore]
        public int Id { get; set; }
        public double LocationX { get; set; }
        public double LocationY { get; set; }
        public string Name { get; set; }
        [JsonIgnore]
        public virtual ICollection<IngredientFromShopShop> IngredientFromShopShops { get; set; }
    }
}
