using BuyerMicroservice.Context;
using BuyerMicroservice.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BuyerMicroservice.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ShoppingCartController : ControllerBase
    {
        private readonly DataContext _context;
        public ShoppingCartController(DataContext context)
        {
            _context = context;
        }
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<ShoppingCart>> Get(Guid id)
        {
            var products = _context.ShoppingCarts.Where(cart => cart.UserId == id).ToList();
            return Ok(products);
        }

        [HttpGet]
        public ActionResult<IEnumerable<ShoppingCart>> Get()
        {
            return Ok(_context.ShoppingCarts);
        }
        [HttpPost]
        public async Task<ActionResult> Add(ShoppingCart cart)
        {
            await _context.AddAsync(cart);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { id = cart.Id }, cart);
        }
        [HttpDelete("{id}")]
        public async Task<ActionResult> Delete(Guid id)
        {
            var products = _context.ShoppingCarts.Where(cart => cart.UserId == id);
            _context.ShoppingCarts.RemoveRange(products);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}

