using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

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
        [SwaggerOperation(Summary = "Register new role")]
        public async Task<ActionResult> Create(ResponseRoleModal newRole)
        {
            Role role = new Role
            {
                Name = newRole.Name
            };
            await _service.Create(role);
            return NoContent();
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update role")]
        public async Task<ActionResult> Update(Guid id, Role updateRole)
        {
            if (id != updateRole.Id)
            {
                return BadRequest();
            }
            Role role = new Role
            {
                Id = updateRole.Id,
                Name = updateRole.Name
            };
            bool check = await _service.Update(role);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get role by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Role role = await _service.GetById(id);
            if (role == null)
            {
                return NotFound();
            }
            return Ok(role);
        }
    }
}