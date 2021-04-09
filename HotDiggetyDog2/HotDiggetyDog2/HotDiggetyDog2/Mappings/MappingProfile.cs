using AutoMapper;
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Mappings
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<Skill, GetSkillDto>();
            CreateMap<Character, GetCharacterDto>()
                    .ForMember(dto => dto.Skills, c => c.MapFrom(c => c.CharacterSkills.Select(cs => cs.Skill)));
        }
    }
}
