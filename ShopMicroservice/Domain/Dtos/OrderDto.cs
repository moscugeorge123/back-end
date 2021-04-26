using System.Collections.Generic;

namespace Domain.Dtos
{
    public class OrderDto
    {
        public int ShopId { get; set; }
        public List<GetProductDto> Products { get; set; }

    }
}
