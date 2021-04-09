using Data;
using Entities;
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
        private readonly hotdogappContext context;
        private IUserService _userService;
        public UsersController(hotdogappContext context,IUserService userService)
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
    [ApiController]
    [Route("api/students")]
    public class StudentsController : ControllerBase
    {
        private readonly hotdogappContext _context;
        public StudentsController(hotdogappContext context)
        {
            _context = context;
        }
        [HttpPost]
        public async Task<ActionResult>Add(Student student)
        {
            _context.Students.Add(student);
            await _context.SaveChangesAsync();
            return Ok();
            
        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Student>>> Get()
        {
            return await (_context.Students.ToListAsync());
            //return await(_context.Students.ToListAsync());
        }
    }
    [ApiController]
    [Route("api/courses")]
    public class CoursesController : ControllerBase
    {
        private readonly hotdogappContext _context;
        public CoursesController(hotdogappContext context)
        {
            _context = context;
        }
        [HttpPost]
        public async Task<ActionResult> Add(Course course)
        {
            _context.Courses.Add(course);
            await _context.SaveChangesAsync();
            return Ok();

        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Course>>> Get()
        {
            return await (_context.Courses.ToListAsync());
            //return await(_context.Students.ToListAsync());
        }
    }

    [ApiController]
    [Route("api/CourseStudents")]
    public class CourseStudentsController : ControllerBase
    {
        private readonly hotdogappContext _context;
        public CourseStudentsController(hotdogappContext context)
        {
            _context = context;
        }
        [HttpPost]
        public async Task<ActionResult> Add(CourseStudent courseStudent)
        {
            _context.CourseStudents.Add(courseStudent);
            await _context.SaveChangesAsync();
            return Ok();

        }
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CourseStudent>>> Get()
        {
            return await (_context.CourseStudents.ToListAsync());
            //return await(_context.Students.ToListAsync());
        }
    }
}
