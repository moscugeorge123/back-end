using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BuyerMicroservice.DTOs
{
    public class AcquisitionDto
    {
        public Guid UserId { get; set; }
        public int ShopId { get; set; }
    }
}
