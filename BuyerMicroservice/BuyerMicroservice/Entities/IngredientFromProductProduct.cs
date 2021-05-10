using System.Text.Json.Serialization;

namespace BuyerMicroservice.Entities
{
    public partial class IngredientFromProductProduct
    {
        public int Id { get; set; }
        public int IngredientsId { get; set; }
        public int ProductsId { get; set; }
        [JsonIgnore]
        public virtual IngredientsFromProduct Ingredients { get; set; }
        [JsonIgnore]
        public virtual Product Products { get; set; }
    }
}
