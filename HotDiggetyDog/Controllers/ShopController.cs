using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog2.Controllers
{
    [ApiController]
    [Route("api/shops")]
    public class ShopController : ControllerBase
    {
        private readonly DataContext _context;
        public ShopController(DataContext context)
        {
            _context = context;

        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetShopDto>>> Get()
        {
            List<Shop> shops = await _context.Shops.ToListAsync();
            List<GetShopDto> shopDtos = new List<GetShopDto>();
            foreach (Shop shop in shops)
            {
                List<int> ingredientsId = await _context.IngredientFromShopShops
                   .Where(s => s.ShopsId == shop.Id)
                   .Select(s => s.IngredientsId)
                   .ToListAsync();
                GetShopDto shopDto = new GetShopDto()
                {
                    Id = shop.Id,
                    Name = shop.Name,
                    LocationX = shop.LocationX,
                    LocationY = shop.LocationY,

                };
                foreach (int i in ingredientsId)
                {
                    IngredientsFromShop ingredient = await _context
                        .IngredientsFromShops
                        .FindAsync(i);
                    int quantity = await _context
                        .IngredientFromShopShops
                        .Where(s => s.IngredientsId == i && s.ShopsId == shop.Id)
                        .Select(s => s.Quantity).FirstOrDefaultAsync();
                    shopDto.Ingredients
                        .Add(new GetShopIngredientDto() { Id = ingredient.Id, Name = ingredient.Name, Price = ingredient.Price, Quantity = quantity });
                }
                shopDtos.Add(shopDto);
            }
            return Ok(shopDtos);
        }

        [HttpGet("{Id}")]
        public async Task<ActionResult<IEnumerable<GetShopDto>>> Get(int Id)
        {
            Shop shop = await _context.Shops.FindAsync(Id);
            if (shop == null)
                return NotFound();
            List<int> ingredientsId = await _context.IngredientFromShopShops
                .Where(s => s.ShopsId == Id)
                .Select(s => s.IngredientsId)
                .ToListAsync();
            GetShopDto shopDto = new GetShopDto()
            {
                Id = shop.Id,
                Name = shop.Name,
                LocationX = shop.LocationX,
                LocationY = shop.LocationY,

            };
            foreach (int i in ingredientsId)
            {
                IngredientsFromShop ingredient = await _context
                    .IngredientsFromShops
                    .FindAsync(i);
                int quantity = await  _context
                    .IngredientFromShopShops
                    .Where(s => s.IngredientsId == i && s.ShopsId == Id)
                    .Select(s => s.Quantity).FirstOrDefaultAsync();
                shopDto.Ingredients
                    .Add(new GetShopIngredientDto()
                    { Id = ingredient.Id, Name = ingredient.Name, Price=ingredient.Price,Quantity=quantity });
            }
            return Ok(shopDto);
        }

        [HttpPost]
        public async Task<ActionResult> Add(Shop shop)
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
    [Route("api/shops/ingredients")]
    public class IngredientsController : ControllerBase
    {

        DataContext _context;
        public IngredientsController(DataContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<IngredientsFromShop>> Get(int id)
        {
            var ingredient = _context.IngredientsFromShops.Find(id);
            return Ok(ingredient);
        }
        [HttpPost]
        public async Task<ActionResult> Add(IngredientsFromShop ingredient)
        {
            bool alreadyExists = _context.IngredientsFromShops.Any(i => i.Id == ingredient.Id);
            if (alreadyExists)
                return UnprocessableEntity();
            await _context.IngredientsFromShops.AddAsync(ingredient);
            await _context.SaveChangesAsync();
            return CreatedAtAction("Get", new { Id = ingredient.Id }, ingredient);
        }
    }
    [ApiController]
    [Route("api/shops/ingredient-shop")]
    public class IngredientShopController : ControllerBase
    {

        DataContext _context;
        public IngredientShopController(DataContext context)
        {
            _context = context;
        }
        [HttpPost]
        public async Task<ActionResult> Add(IngredientFromShopShop relation)
        {
            bool alreadyExists = _context.IngredientFromShopShops.Any(s => s.ShopsId == relation.ShopsId && s.IngredientsId == relation.IngredientsId);
            if (alreadyExists)
                return UnprocessableEntity();
            await _context.IngredientFromShopShops.AddAsync(relation);
            await _context.SaveChangesAsync();
            var newRelation = _context.IngredientFromShopShops.Where(s => s.ShopsId == relation.ShopsId && s.IngredientsId == relation.IngredientsId);
            return Ok(newRelation);
        }
    }
}
