using System;

namespace HotDiggetyDog2.Entities
{
    public class Acquisition
    {
        public Guid InvoiceId { get; set; }
        public int ShopId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
