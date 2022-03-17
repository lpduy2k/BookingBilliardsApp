﻿using System;
namespace Api.Models
{
    public class CreateUserModel
    {
        public string Username { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
        public Guid RoleId { get; set; }
    }
}
