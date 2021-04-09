using HotDiggetyDog.Data;

using HotDiggetyDog.Entities;
using HotDiggetyDog.Models;
using HotDiggetyDog.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/products")]
    public class ProductController: ControllerBase
    {
        private readonly DataContext context;
        
        public ProductController(DataContext context)
        {
            this.context = context;
            
        }
        [HttpGet("{Id}")]
        public async Task<ActionResult<Product>> Get(Guid Id)
        {
            var product = await context.Products.FindAsync(Id);
            if (product == null)
                return NotFound();
            return Ok(product);
        }
        /*[HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> Get()
        {
            return await context.Products.ToListAsync();
        }*/
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> Get()
        {
            return await context.Products.ToListAsync();
        }
        [HttpPost]
        public async Task<ActionResult> InsertPrduct(Product product)
        {

            bool existsProduct = this.context.Products.Any(p => p.Id == product.Id);
            if(!existsProduct)
            {
                context.Products.Add(product);
                await context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = product.Id }, product);

            }
            return UnprocessableEntity("Product already exists");

            
            
        }
        
    }

    [Route("api/ingredientFromProducts")]
    public class IngredientFromProductController : ControllerBase
    {
        private readonly DataContext context;

        public IngredientFromProductController(DataContext context)
        {
            this.context = context;

        }



        
        
    }
    [Route("api/ingredientFromProductsProducts")]
    public class IngredientFromProductProductController : ControllerBase
    {
        private readonly DataContext context;

        public IngredientFromProductProductController(DataContext context)
        {
            this.context = context;

        }



       
    }

}
