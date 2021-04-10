#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class IngredientFromShopShop
    {
        public int IngredientsId { get; set; }
        public int ShopsId { get; set; }

        public virtual IngredientsFromShop Ingredients { get; set; }
        public virtual Shop Shops { get; set; }
    }
}
