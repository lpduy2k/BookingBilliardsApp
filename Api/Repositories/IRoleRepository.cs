using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IRoleRepository<T>
    {
        Task<Role> Create(Role role);
        Task<bool> Update(Role newRole);
        List<Role> GetAll();
    }
}