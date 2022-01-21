using System;
namespace Api.Modals
{
    public class UpdateUserModal
    {
        public Guid Id { get; set; }
        public string Username { get; set; }
        public string FullName { get; set; }
        public string Password { get; set; }
        public string PhoneNumber { get; set; }
        public string Image { get; set; }
        public Guid RoleId { get; set; }

    }
}
