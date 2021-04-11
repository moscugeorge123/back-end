using System.Collections.Generic;
using System.Text.Json.Serialization;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class IngredientsFromShop
    {
        public IngredientsFromShop()
        {
            IngredientFromShopShops = new HashSet<IngredientFromShopShop>();
        }
        [JsonIgnore]
        public int Id { get; set; }
        public double Price { get; set; }
        public string Name { get; set; }
        [JsonIgnore]
        public virtual ICollection<IngredientFromShopShop> IngredientFromShopShops { get; set; }
    }
}
