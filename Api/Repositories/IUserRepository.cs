using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
        bool Login(LoginModel user);
        User GetByUserName(string username);
        Task<bool> Delete(Guid id);
        Task<bool> Update(User newUser);
    }
}