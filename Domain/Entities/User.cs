using System;
using System.Text.Json.Serialization;
using Domain.Common;

namespace HotDiggetyDog.Entities
{
    public class User : BaseEntity
    {
        public string Username { get; set; }

        public string Email { get; set; }

        
        public  string Password { get; set; }
        
    }
}
