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
        [HttpGet]
        [SwaggerOperation(Summary = "Get all role")]
        public ActionResult GetAll()
        {
            List<Role> listRoles = _service.GetAll();
            
            return Ok(listRoles);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete role by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}