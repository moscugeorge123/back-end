
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Controllers
{
    [ApiController]
    [Route("api/skills")]
    public class CharacterSkillController:ControllerBase
    {
        private readonly ICharacterSkillService _characterSkillService;
        public CharacterSkillController(ICharacterSkillService characterSkillService)
        {
            _characterSkillService = characterSkillService;
        }
        [HttpPost]
        public async Task<IActionResult> AddCharacterSkill(AddCharacterSkillDto newCharacterSkill)
        {
            return Ok(await _characterSkillService.AddCharacterSkill(newCharacterSkill));
        }
      /*  [HttpPost]
        publci async Task<IActionResult> AddCharacter(GetCharacterDto)*/
        
        [HttpGet("{Id}")]
        public async Task<ActionResult<GetCharacterDto>> Get(int Id)
        {
            return Ok(await _characterSkillService.GetCharacterById(Id));
        }
    }
}
