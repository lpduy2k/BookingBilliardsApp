using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Api.Models;
using BCrypt.Net;
using Microsoft.EntityFrameworkCore;
using quiz_app_dotnet_api.Helper;

namespace Api.Repositories
{
    public class UserRepository : IUserRepository<User>
    {
        private readonly DataContext _context;
        private readonly IJwtHelper _jwtHelper;
        public UserRepository(DataContext context, IJwtHelper jwtHelper)
        {
            _context = context;
            _jwtHelper = jwtHelper;
        }
        public async Task<User> Create(User user)
        {
            user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);
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

        public string Login(LoginModel loginModal)
        {
            User user = _context.Users.FirstOrDefault(u => u.Username == loginModal.Username);
            if (user == null)
            {
                return null;
            }
            bool isValidPassword = BCrypt.Net.BCrypt.Verify(loginModal.Password, user.Password);
            if (isValidPassword)
            {
                Role role = _context.Roles.FirstOrDefault(u => u.Id == user.RoleId);
                return _jwtHelper.generateJwtToken(user, role);
            }
            return null;
        }
        public async Task<bool> Delete(Guid id)
        {
            User user = await _context.Users.FindAsync(id);
            _context.Users.Remove(user);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<bool> Update(User newUser)
        {
            User user = await _context.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newUser.Id);
            if (user == null)
            {
                return false;
            }
            _context.Users.Update(newUser);
            await _context.SaveChangesAsync();
            return true;
        }

        public async Task<bool> UpdatePassword(Guid id, ResponseUpdatePasswordModal updatePasswordModal)
        {
            User user = _context.Users.FirstOrDefault(u => u.Id == id);
            if (user == null)
            {
                return false;
            }
            bool isValidPassword = BCrypt.Net.BCrypt.Verify(updatePasswordModal.OldPassword, user.Password);
            if (!isValidPassword)
            {
                return false;
            }
            user.Password = BCrypt.Net.BCrypt.HashPassword(updatePasswordModal.NewPassword);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}