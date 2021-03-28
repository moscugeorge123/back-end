using System;

namespace HotDiggetyDog.Entities
{
    public class User
    {
        public Guid Id { get; set; }
        public string Username { get; set; }

        public string Email { get; set; }
        
        private string Password { get; set; }
    }
}
