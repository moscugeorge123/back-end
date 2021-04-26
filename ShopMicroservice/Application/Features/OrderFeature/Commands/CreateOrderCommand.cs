using Domain.Dtos;
using MediatR;
using System.Collections.Generic;

namespace Application.Features.OrderFeature.Commands
{
    public class CreateOrderCommand : IRequest<int>
    {
        public int ShopId { get; set; }
        public List<GetProductDto> Products { get; set; }
    }
}
