using AutoMapper;
using HotDiggetyDog.Data;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using HotDiggetyDog.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace HotDiggetyDog.Services
{
    public class CharacterSkillService : ICharacterSkillService
    {
        private readonly DataContext _context;
        
        private readonly IMapper _mapper;

        public CharacterSkillService(DataContext context, IMapper mapper)
        {
            _mapper = mapper;
          
            _context = context;
        }
        public async Task<ServiceResponse<GetCharacterDto>> AddCharacterSkill(AddCharacterSkillDto newCharacterSkill)
        {
            ServiceResponse<GetCharacterDto> response = new ServiceResponse<GetCharacterDto>();
            try
            {
                Character character = await _context.Characters
               .Include(c => c.CharacterSkills).ThenInclude(cs => cs.Skill)
               .FirstOrDefaultAsync(c => c.Id == newCharacterSkill.CharacterId  );
            if (character == null)
                {
                    response.Success = false;
                    response.Message = "Character not found.";
                    return response;
                }
                Skill skill = await _context.Skills
                    .FirstOrDefaultAsync(s => s.Id == newCharacterSkill.SkillId);
                if (skill == null)
                {
                    response.Success = false;
                    response.Message = "Skill not found.";
                    return response;
                }
                CharacterSkill characterSkill = new CharacterSkill
                {
                    Character = character,
                    Skill = skill
                };

                await _context.CharacterSkills.AddAsync(characterSkill);
                await _context.SaveChangesAsync();
                response.Data = _mapper.Map<GetCharacterDto>(character);
            }
            catch (Exception ex)
            {
                response.Success = false;
                response.Message = ex.Message;
            }
            return response;
        }
        public async Task<ServiceResponse<GetCharacterDto>> GetCharacterById(int id)
        {
            ServiceResponse<GetCharacterDto> serviceResponse = new ServiceResponse<GetCharacterDto>();
            Character dbCharacter =
                await _context.Characters
                .Include(c => c.CharacterSkills).ThenInclude(cs => cs.Skill)
                .FirstOrDefaultAsync(c => c.Id == id);
            serviceResponse.Data = _mapper.Map<GetCharacterDto>(dbCharacter);
            return serviceResponse;
        }
        public IEnumerable<GetCharacterDto> GetAll()
        {
            var characters = _context.Characters
                .Include(c => c.CharacterSkills).ThenInclude(cs => cs.Skill).AsEnumerable();

            ServiceResponse<GetCharacterDto> serviceResponse = new ServiceResponse<GetCharacterDto>();
            List<Object> list = new List<Object>();
            foreach (var character in characters)
            {
                serviceResponse.Data = _mapper.Map<GetCharacterDto>(character);
                list.Add(serviceResponse.Data);

            }
            return (IEnumerable<GetCharacterDto>)list.AsEnumerable();
        }

        
    }
}
