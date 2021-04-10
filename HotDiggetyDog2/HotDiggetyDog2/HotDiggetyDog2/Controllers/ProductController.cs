using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/Products")]
    public class ProductController : ControllerBase
    {
        private readonly DataContext context;
        public ProductController(DataContext context)
        {
            this.context = context;

        }
        [HttpGet("{Id}")]
        public async Task<ActionResult<Product>> Get(int Id)
        {
            var product = await context.Products.FindAsync(Id);
            if (product == null)
                return NotFound();
            return Ok(product);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> Get()
        {
            //string callingUrl = Request.GetTypedHeaders().Referer.ToString();
            //string callingUrl = HttpContext.Request.GetTypedHeaders().Referer.ToString();
            //return  Ok(callingUrl);
            return await context.Products.ToListAsync();
        }
        [HttpPost]
        public async Task<ActionResult> InsertPrduct(Product product)
        {

            bool existsProduct = this.context.Products.Any(p => p.Id == product.Id);
            if (!existsProduct)
            {
                context.Products.Add(product);
                await context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = product.Id }, product);

            }
            return UnprocessableEntity("Product already exists");



        }

    }

    [ApiController]
    [Route("api/IngredientsForProducts")]
    public class IngredientsForProductsController : ControllerBase
    {
        private readonly DataContext _dataContext;
        public IngredientsForProductsController(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IngredientsFromProduct>>> Get()
        {
            return Ok(await _dataContext.IngredientsFromProducts.ToListAsync());
        }
        [HttpPost]
        public async Task<ActionResult> Add(IngredientsFromProduct ingredient)
        {
            bool existsIngredient = _dataContext.IngredientsFromProducts.Any(p => p.Id == ingredient.Id);
            if (!existsIngredient)
            {
                _dataContext.IngredientsFromProducts.Add(ingredient);
                await _dataContext.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = ingredient.Id }, ingredient);

            }
            return UnprocessableEntity("Product already exists");

        }
    }
    [ApiController]
    [Route("api/JoinProductIngredient")]
    public class JoinProductIngredientController : ControllerBase
    {
        private readonly DataContext _dataContext;
        public JoinProductIngredientController(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IngredientFromProductProduct>>> Get()
        {
            return Ok(await _dataContext.IngredientFromProductProducts.ToListAsync());
        }
        [HttpPost]
        public async Task<ActionResult>Add(IngredientFromProductProduct relation)
        {
            bool alreadyExists = _dataContext.IngredientFromProductProducts.Any(s => s.ProductsId == relation.ProductsId && s.IngredientsId == relation.IngredientsId);
            if (alreadyExists)
                return UnprocessableEntity();
            await _dataContext.IngredientFromProductProducts.AddAsync(relation);
            await _dataContext.SaveChangesAsync();
            return CreatedAtAction("Get", new { ProductId = relation.ProductsId, IngredientId = relation.IngredientsId },relation);
        }

    }

}
