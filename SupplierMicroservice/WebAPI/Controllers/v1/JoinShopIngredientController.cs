﻿using Application.Features.JoinShopIngredientFeature.Commands;
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

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateJoinShopIngredient command)
        {
            return Ok(await mediator.Send(command));
        }

        [HttpGet]
        public async Task<IActionResult> GetById()
        {
            return Ok(await mediator.Send(new GetIngredientsFromShopQuery()));
        }
    }
}
