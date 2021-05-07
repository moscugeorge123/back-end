//using Application.Features.ProductFeatures.Commands;
using Application.Features.ProductFeatures.Commands;
using Application.Features.ProductFeatures.Queries;
using MediatR;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using WebAPI.Model;
using System.Net.Http;
using System.Net;

namespace WebAPI.Controllers.v1
{
    [ApiVersion("1.0")]
    public class ProductsController : BaseApiController
    {
        public ProductsController(IMediator mediator) : base(mediator)
        {
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateProductCommand command)
        {
            return Ok(await mediator.Send(command));
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await mediator.Send(new GetProductsQuery()));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id) => Ok(await mediator.Send(new GetProductByIdQuery { Id = id }));

       
       

        [HttpPost]
        [Route("getByArray")]
        public async Task<IActionResult> GetByArray([FromBody] GetProductsByArray query)
        {
            return Ok(await mediator.Send(query));
        }

        [HttpPut]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateProductCommand command)
        {
            if (id != command.Id)
            {
                return BadRequest();
            }
            return Ok(await mediator.Send(command));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            return Ok(await mediator.Send(new DeleteProductCommand { Id = id }));
        }
      
    }
}
