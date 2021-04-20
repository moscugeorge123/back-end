using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
using HotDiggetyDog.Helpers;
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
    [Route("api/users")]
    public class UsersController : ControllerBase
    {
        private readonly DataContext context;
        private readonly IUserService _userService;
        public UsersController(DataContext context,IUserService userService)
        {
            this.context = context;
            _userService = userService;
        }
       
        [HttpPost("authenticate")]
        public IActionResult Authenticate(AuthenticateRequest model)
        {
            var response = _userService.Authenticate(model);

            if (response == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(response);
        }

        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User>>> Get()
        {
            return await context.Users.ToListAsync();
        }

        [Authorize]
        [HttpGet("{Id}")]
        public async Task<ActionResult<User>>Get(Guid Id)
        {
           var user  = await context.Users.FindAsync(Id);
            if (user == null)
                return NotFound();
           return Ok(user);
        }

        [HttpPost]
        public async Task<ActionResult>InsertUser(User newUser)
        {
            bool existsEmail = context.Users.Any(b => b.Email == newUser.Email);
            if (!existsEmail)
            {
                newUser.Password = BCrypt.Net.BCrypt.HashPassword(newUser.Password);
                newUser.Role = "customer";
                context.Users.Add(newUser);
                await context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = newUser.Id}, newUser);
            }
                return UnprocessableEntity("Email already exists");      
        }
    }
}
