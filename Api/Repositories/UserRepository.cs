using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;

namespace Api.Repositories
{
    public class UserRepository : IUserRepository<User>
    {
        private readonly DataContext _context;
        public UserRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<User> Create(User user)
        {
            // default user have role is 'User'
            var role = _context.Roles.FirstOrDefault(x => x.Name == "USER");
            user.RoleId = role.Id;
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
            return user;
        }
    }
}