using HotDiggetyDog.Data;
using HotDiggetyDog.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

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

        public ActionResult<IEnumerable<User>> Get()
        {
            return context.Users.ToList();
        }

        [HttpPost]
        public ActionResult Add()
        {
            User u = new User()
            {
                Email = "a",
                Username = "c"
            };
            context.Users.Add(u);
            return Ok();
        }
    }
}
