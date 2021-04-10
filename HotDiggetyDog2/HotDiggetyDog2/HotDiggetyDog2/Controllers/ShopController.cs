﻿using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog2.Controllers
{
    [ApiController]
    [Route("api/Shops")]
    public class ShopController : ControllerBase
    {
        private readonly DataContext _context;
        public ShopController(DataContext context)
        {
            _context = context; 

        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Shop>>> Get()
        {
            return Ok(await _context.Shops.ToListAsync());
        }

        [HttpGet("{Id}")]
        public async Task<ActionResult<IEnumerable<Shop>>> Get(int Id)
        {
            Shop shop = await _context.Shops.FindAsync(Id);
            if (shop == null)
                return NotFound();
            return Ok(shop);
        }

        [HttpPost]
        public async Task<ActionResult>Add(Shop shop)
        {
            bool alreadyExists = _context.Shops.Any(s => s.Id == shop.Id);
            if (alreadyExists)
                return UnprocessableEntity();
            await _context.Shops.AddAsync(shop);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { Id = shop.Id }, shop);
        }


    }
    [ApiController]
    [Route("api/IngredientsForShops")]
    public class IngredientsForShops : ControllerBase
    {
        DataContext _context;
        public IngredientsForShops(DataContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IngredientsFromShop>>> Get()
        {
            return Ok(await _context.IngredientsFromShops.ToListAsync());
        }
        [HttpGet("{id}")]
        public async Task<ActionResult<IngredientsFromShop>> Get(int Id)
        {
            IngredientsFromShop ifs = await _context.IngredientsFromShops.FindAsync(Id);
            if(ifs == null)
            {
                return NotFound();
            }
            return Ok(ifs);
        }

        [HttpPost]
        public async Task<ActionResult> Add(IngredientsFromShop ifs)
        {
            bool alreadyExists = _context.IngredientsFromShops.Any(s => s.Id == ifs.Id);
            if (alreadyExists)
                return UnprocessableEntity();
            await _context.IngredientsFromShops.AddAsync(ifs);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { Id = ifs.Id }, ifs);
        }
    }
    [ApiController]
    [Route("{api/JoinShopIngredient")]
    public class JoinShopIngredientController : ControllerBase
    {

        DataContext _context;
        public JoinShopIngredientController(DataContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IngredientFromShopShop>>> Get()
        {
            return Ok(await _context.IngredientFromShopShops.ToListAsync());
        }
        
        [HttpPost]
        public async Task<ActionResult> Add(IngredientFromShopShop relation)
        {
            bool alreadyExists = _context.IngredientFromShopShops.Any(s => s.ShopsId == relation.ShopsId && s.IngredientsId == relation.IngredientsId);
            if (alreadyExists)
                return UnprocessableEntity();
            await _context.IngredientFromShopShops.AddAsync(relation);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { ShopId = relation.ShopsId, IngredientId = relation.IngredientsId}, relation);
        }

    }
}
