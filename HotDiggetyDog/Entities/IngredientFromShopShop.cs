#nullable disable

using System.Text.Json.Serialization;

namespace HotDiggetyDog.Entities
{
    public partial class IngredientFromShopShop
    {
        public int IngredientsId { get; set; }
        public int ShopsId { get; set; }
        public int Quantity { get; set; }

        [JsonIgnore]
        public virtual IngredientsFromShop Ingredients { get; set; }
        [JsonIgnore]
        public virtual Shop Shops { get; set; }
    }
}
