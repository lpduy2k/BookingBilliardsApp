using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    public class RoleController : BaseApiController
    {
        private readonly RoleService _service;
        public RoleController(RoleService service)
        {
            _service = service;
        }

        [HttpPost]
        public async Task<ActionResult> Create(ResponseRoleModal newRole)
        {
            Role role = new Role
            {
                Name = newRole.Name
            };
            await _service.Create(role);
            return NoContent();
        }
    }
}