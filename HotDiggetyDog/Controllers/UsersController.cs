using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
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
        public UsersController(DataContext context)
        {
            this.context = context;
        }
        [HttpGet]

        public async Task<ActionResult<IEnumerable<User>>> Get()
        {
            return await context.Users.ToListAsync();
        }

        [HttpGet("{Id}")]
        public async Task<ActionResult<User>>Get(Guid Id)
        {
           var user  = await context.Users.FindAsync(Id);
            if (user == null)
                return NotFound();
           return user;
        }

        [HttpPost]
        public async Task<ActionResult>InsertUser(User newUser)
        {
            bool existsEmail = context.Users.Any(b => b.Email == newUser.Email);
            if (!existsEmail)
            {
                context.Users.Add(newUser);
                await context.SaveChangesAsync();
                return CreatedAtAction("Get", new { Id = newUser.Id }, newUser);
            }
                return UnprocessableEntity("Email already exists");      
        }
    }
}
