using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Entities
{
    public class ProductIngredient
    {
       /* [Key]
        [Column(Order=0)]
        [ForeignKey("IngredientFromProduct")]*/
        public int IngredientId { get; set; }
     
        /*[Key]
        [Column(Order =1)]
        [ForeignKey("Product")]*/
        public int ProductId { get; set; }
       

        public virtual IngredientFromProduct Ingredient { get; set; }
        public virtual Product Product { get; set; }

    }
}
