using BuyerMicroservice.Context;
using BuyerMicroservice.DTOs;
using BuyerMicroservice.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BuyerMicroservice.Controllers
{
    [Route("api/[controller]")]
    public class SalesHistoryController : ControllerBase
    {
        private readonly DataContext _context;
        public SalesHistoryController(DataContext context) 
        {
            _context = context;
        }
        [HttpPost]
        public async Task<ActionResult> Add(AcquisitionDto acquisition)
        {
            var cart = _context.ShoppingCarts.Where(cart => cart.UserId == acquisition.UserId).ToList();
            _context.ShoppingCarts.RemoveRange(cart);
            foreach(var item in cart)
            {
                Product product = _context.Products.Find(item.ProductId);
                SalesHistory salesHistory = new SalesHistory
                {
                    UserId = item.UserId,
                    ProductId = item.ProductId,
                    ProductQuantity = item.Quantity,
                    ShopId = acquisition.ShopId,
                    ProductPrice = product.Price * item.Quantity,
                    Date = DateTime.Now
                };
                await _context.SalesHistories.AddAsync(salesHistory);
            }
           await  _context.SaveChangesAsync();
            return Ok();
        }
        [HttpGet("{id}")]
        public ActionResult<IEnumerable<SalesHistory>>Get(Guid id)
        {
            var history = _context.SalesHistories.Where(history => history.UserId == id).ToList();
            return Ok(history);
        }
    }
}
