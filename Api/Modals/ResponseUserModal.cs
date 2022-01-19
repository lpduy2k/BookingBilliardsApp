using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Modals
{
    public class ResponseUserModal
    {
        public string Username { get; set; }
        public string FullName { get; set; }
        public string PhoneNumber { get; set; }
        public string Password { get; set; }
        public string Image { get; set; }
        public Guid RoleId { get; set; }
    }
}