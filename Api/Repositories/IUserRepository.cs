using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IUserRepository<T>
    {
        Task<User> Create(User user);
    }
}