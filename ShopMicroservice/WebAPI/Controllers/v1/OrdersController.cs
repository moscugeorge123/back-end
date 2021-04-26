using Application.Features.OrderFeature.Commands;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace WebAPI.Controllers.v1
{
    [ApiVersion("1.0")]
    public class OrdersController : BaseApiController
    {
        public OrdersController(IMediator mediator) : base(mediator)
        {
        }
        [HttpPost]
        public async Task<IActionResult>Add(CreateOrderCommand command)
        {
            return Ok(mediator.Send(command));
        }
    }
}
