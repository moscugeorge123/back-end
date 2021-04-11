using System;

namespace HotDiggetyDog2.Entities
{
    public class Invoice
    {
        public Guid Id { get; set; }
        public int ShopId { get; set; }
        public float TotalPrice{ get; set; }
        public DateTime Date { get; set; }
    }
}
