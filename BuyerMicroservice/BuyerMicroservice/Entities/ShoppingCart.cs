using System;

namespace BuyerMicroservice.Entities
{
    public class ShoppingCart
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }      
    }
}
