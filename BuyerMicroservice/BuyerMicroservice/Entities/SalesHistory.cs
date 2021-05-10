using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BuyerMicroservice.Entities
{
    public class SalesHistory
    {
        public int Id { get; set; }
        public Guid UserId { get; set; }
        public int ProductId { get; set; }
        public int ProductQuantity { get; set; }
        public int ShopId { get; set; }
        public double ProductPrice { get; set; }
        public DateTime Date { get; set; }
        
    }
}
