
using HotDiggetyDog.DTOs;
using HotDiggetyDog.Models;
using Microsoft.Exchange.WebServices.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Services
{
    public interface ICharacterSkillService
    {
        Task<ServiceResponse<GetCharacterDto>> AddCharacterSkill(AddCharacterSkillDto newCharacterSkill);
        Task<ServiceResponse<GetCharacterDto>> GetCharacterById(int id);
    }
}
