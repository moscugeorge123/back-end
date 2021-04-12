using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/products")]
    public class ProductController : ControllerBase
    {
        private readonly IProductRepository _productRepository;
        public ProductController(IProductRepository productRepository)
        {
            _productRepository = productRepository;

        }
        [HttpGet("{Id}")]
        public async Task<ActionResult<GetProductDto>> Get(int Id)
        {
            Product product = await _productRepository.GetById(Id);
            return Ok(product);
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<GetProductDto>>> Get()
        {

            var getProductsDtos = await _productRepository.GetAll();
            return Ok(getProductsDtos);
        }
        [HttpPost]
        public async Task<ActionResult> Add(Product product)
        {

            bool existsProduct = await _productRepository.CreateProduct(product);
            if (existsProduct)
            {

                return CreatedAtAction("Get", new { Id = product.Id }, product);

            }
            return UnprocessableEntity("Product already exists");
        }

    }
    [ApiController]
    [Route("api/products/ingredients")]
    public class IngredientsController : ControllerBase
    {
        private readonly IIngredientFromProductRepository _ingredientFromProductRepository;
        public IngredientsController(IIngredientFromProductRepository ingredientFromProductRepository)
        {

            _ingredientFromProductRepository = ingredientFromProductRepository;

        }
        [HttpGet]
        public async Task<ActionResult<GetIngredientDto>> Get(int id)
        {
            var ingredient = _ingredientFromProductRepository.GetById(id);
            return await ingredient;
        }

        [HttpPost]
        public async Task<ActionResult> Add(IngredientsFromProduct ingredient)
        {
            bool existsIngredient = await _ingredientFromProductRepository.CreateIngredient(ingredient);
            if (existsIngredient)
            {

                return CreatedAtAction("Get", new { Id = ingredient.Id }, ingredient);

            }
            return UnprocessableEntity("Product already exists");

        }
    }
    [ApiController]
    [Route("api/ingredient-product")]
    public class IngredientProductController : ControllerBase
    {
        private readonly IIngredientProductRepository _repositoryIngredientProduct;
        public IngredientProductController(IIngredientProductRepository repository)
        {
            _repositoryIngredientProduct = repository;
        }


        [HttpPost]
        public async Task<ActionResult> Add(IngredientFromProductProduct relation)
        {
            bool existRelation = await _repositoryIngredientProduct.CreateRelation(relation);
            if (existRelation)
            {
                return UnprocessableEntity();
            }

            return Ok();
        }

    }

}
