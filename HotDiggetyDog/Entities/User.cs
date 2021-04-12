﻿using System;
using System.Text.Json.Serialization;

#nullable disable

namespace HotDiggetyDog.Entities
{
    public partial class User
    {
        public Guid Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        [JsonIgnore]
        public string Password { get; set; }
    }
}
