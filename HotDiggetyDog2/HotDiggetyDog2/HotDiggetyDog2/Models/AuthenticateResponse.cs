using HotDiggetyDog.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HotDiggetyDog.Models
{
    public class AuthenticateResponse
    {
        public Guid Id { get; set; }
        public string Username { get; set; }
        public string Token { get; set; }
        public AuthenticateResponse(User user, string token)
        {
            Id = user.Id;
            Username = user.Username;
            Token = token;
        }
    }
}
