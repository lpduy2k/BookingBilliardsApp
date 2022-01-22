using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class RoleService
    {
        private readonly IRoleRepository<Role> _repo;
        public RoleService(IRoleRepository<Role> repo)
        {
            _repo = repo;
        }
        public async Task<Role> Create(Role role)
        {
            return await _repo.Create(role);
        }
        public async Task<bool> Update(Role newRole)
        {
            return await _repo.Update(newRole);
        }
    }
}