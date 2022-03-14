using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class UserController : BaseApiController
    {
        private readonly UserService _service;
        public UserController(UserService service)
        {
            _service = service;
        }

        [Route("Register")]
        [HttpPost]
        public async Task<ActionResult> Register(CreateUserModel newUser)
        {
            User user = new User
            {
                Username = newUser.Username,
                FullName = newUser.FullName,
                Image = newUser.Image,
                Password = newUser.Password,
                PhoneNumber = newUser.PhoneNumber,
                RoleId = newUser.RoleId
            };
            await _service.Create(user);
            return CreatedAtAction(nameof(GetByUserName), new { username = user.Username }, user);
        }

        [HttpGet("{username}")]
        [SwaggerOperation(Summary = "Get information user by username")]
        public ActionResult GetByUserName(string username)
        {
            User response = _service.GetByUserName(username);
            if (response == null)
            {
                return NotFound();
            }
            ResponseUserModel user = new ResponseUserModel
            {
                Id = response.Id,
                Username = response.Username,
                FullName = response.FullName,
                Image = response.Image,
                Password = response.Password,
                PhoneNumber = response.PhoneNumber,
                RoleId = response.RoleId
            };
            return Ok(user);
        }
        [Route("Login")]
        [HttpPost]
        public ActionResult Login(LoginModel loginModal)
        {
            var response = _service.Login(loginModal);
            if (response == null)
            {
                return BadRequest(new { message = "User name or password not correct" });
            }
            return Ok(new { token = response });
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete user by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update user")]
        public async Task<ActionResult> Update(Guid id, ResponseUserModel updateUser)
        {
            if (id != updateUser.Id)
            {
                return BadRequest();
            }

            User user = new User
            {
                Id = updateUser.Id,
                Username = updateUser.Username,
                FullName = updateUser.FullName,
                Password = updateUser.Password,
                PhoneNumber = updateUser.PhoneNumber,
                Image = updateUser.Image,
                RoleId = updateUser.RoleId
            };
            bool check = await _service.Update(user);
            if (!check)
            {
                return BadRequest();
            }
            return NoContent();
        }
    }
}