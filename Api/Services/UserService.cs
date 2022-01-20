using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Repositories;

namespace Api.Services
{
    public class UserService
    {
        private readonly IUserRepository<User> _repo;
        public UserService(IUserRepository<User> repo)
        {
            _repo = repo;
        }
        public async Task<User> Create(User user)
        {
            return await _repo.Create(user);
        }
        public UserLoginResponseModal Login(LoginModal loginModal)
        {
            return _repo.Login(loginModal);
        }
        public User GetByUserName(string username)
        {
            return _repo.GetByUserName(username);
        }
    }

}