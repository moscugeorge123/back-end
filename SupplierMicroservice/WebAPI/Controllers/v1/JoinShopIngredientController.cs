using Application.Features.JoinShopIngredientFeature.Commands;
using Application.Features.JoinShopIngredientFeature.Queries;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace WebAPI.Controllers.v1
{
    [ApiVersion("1.0")]
    public class JoinShopIngredientController:BaseApiController
    {
        public JoinShopIngredientController(IMediator mediator) : base(mediator)
        {
        }

        [HttpPut]
        public async Task<IActionResult> Update([FromBody] UpdateJoinShopIngredient command)
        {
            await mediator.Send(command);
            return NoContent();
        }

        [HttpGet]
        public async Task<IActionResult> GetById()
        {
            return Ok(await mediator.Send(new GetIngredientsFromShopQuery()));
        }
    }
}
