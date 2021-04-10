using System.Collections.Generic;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class IngredientsFromProduct
    {
        public IngredientsFromProduct()
        {
            IngredientFromProductProducts = new HashSet<IngredientFromProductProduct>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        
        public virtual ICollection<IngredientFromProductProduct> IngredientFromProductProducts { get; set; }
    }
}
