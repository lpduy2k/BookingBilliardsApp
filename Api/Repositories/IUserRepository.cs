using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
        UserLoginResponseModal Login(LoginModal user);
        User GetByUserName(string username);
    }

}