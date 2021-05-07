using Domain.DTOs;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.ProductFeatures.Queries
{
    public class GetProductsByArray:IRequest<IEnumerable<GetProductDto>>
    {
        //public ProductId ListOfIds { get; set; }
        public List<int> ListofIds { get; set; }
    }
}
