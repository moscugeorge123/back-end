
using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using HotDiggetyDog.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/characterSkill")]
    public class CharacterSkillController:ControllerBase
    {
        private readonly ICharacterSkillService _characterSkillService;
        private readonly DataContext dataContext;
        public CharacterSkillController(ICharacterSkillService characterSkillService, DataContext dataContext)
        {
            _characterSkillService = characterSkillService;
            dataContext = dataContext;
        }
        [HttpPost]
        public async Task<IActionResult> AddCharacterSkill(AddCharacterSkillDto newCharacterSkill)
        {
            return Ok(await _characterSkillService.AddCharacterSkill(newCharacterSkill));
        }

        
        [HttpGet("{Id}")]
        public async Task<ActionResult<GetCharacterDto>> Get(int Id)
        {
            return Ok(await _characterSkillService.GetCharacterById(Id));
        }
        [HttpGet]
        public IEnumerable<GetCharacterDto>Get()
        {
            return (IEnumerable<GetCharacterDto>)_characterSkillService.GetAll();
        }
        
    }

    [Route("api/character")]
    public class CharacterController : ControllerBase
    {
        private readonly DataContext dataContext;
        public CharacterController(DataContext dataContext)
        {
            this.dataContext = dataContext;
        }
        [HttpPost]
        public async Task<IActionResult> AddCharacter(Character newCharacter)
        {
            dataContext.Characters.Add(newCharacter);
            await dataContext.SaveChangesAsync();
            return Ok();
        }
        [HttpGet]
        public  IEnumerable<Character> Get()
        {
            return  dataContext.Characters.ToList();
        }
    }
    [Route("api/skill")]
    public class SkillController : ControllerBase
    {
        private readonly DataContext dataContext;
        public SkillController(DataContext dataContext)
        {
            this.dataContext = dataContext;
        }
        [HttpPost]
        public async Task<IActionResult> AddSkill(Skill newSkill)
        {
            dataContext.Skills.Add(newSkill);
            await dataContext.SaveChangesAsync();
            return Ok();
        }
        [HttpGet]
        public  IEnumerable<Skill> Get()
        {
            return  dataContext.Skills.ToList();
        }
    }

}
