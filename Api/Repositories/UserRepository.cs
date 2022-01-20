using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Modals;

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
        public User GetByUserName(string username)
        {
            User user = _context.Users.FirstOrDefault(u => u.Username == username);
            if (user == null)
            {
                return null;
            }
            return user;
        }

        public UserLoginResponse Login(LoginModal loginModal)
        {
            User user = _context.Users.FirstOrDefault(u => u.Username == loginModal.Username);
            if (user == null)
            {
                return null;
            }
            if (user.Password == loginModal.Password)
            {
                
                return new UserLoginResponse
                {

                    Username = user.Username
                };
            }
            return null;
        }
    }
}