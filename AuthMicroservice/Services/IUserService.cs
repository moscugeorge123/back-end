using HotDiggetyDog.Entities;
using HotDiggetyDog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Services
{
    public interface IUserService
    {
        AuthenticateResponse Authenticate(AuthenticateRequest model);
        User GetById(Guid id);
        Guid UpdateUser(Guid id, UpdateUserModel newUserModel);
    }
}
