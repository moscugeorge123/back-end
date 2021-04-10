using System.Text.Json.Serialization;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class IngredientFromProductProduct
    {
        public int IngredientsId { get; set; }
        public int ProductsId { get; set; }
        [JsonIgnore]
        public virtual IngredientsFromProduct Ingredients { get; set; }
        [JsonIgnore]
        public virtual Product Products { get; set; }
    }
}
