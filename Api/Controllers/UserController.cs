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
    public class UserController : BaseApiController
    {
        private readonly UserService _service;
        public UserController(UserService service)
        {
            _service = service;
        }

        [Route("Register")]
        [HttpPost]
        [SwaggerOperation(Summary = "Register new user")]
        public async Task<ActionResult> Register(ResponseUserModal newUser)
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
            return NoContent();
        }
        [HttpGet("{username}")]
        [SwaggerOperation(Summary = "Get username")]
        public ActionResult GetByUserName(string username)
        {
            User response = _service.GetByUserName(username);
            if (response == null)
            {
                return NotFound();
            }
            ResponseUserModal user = new ResponseUserModal
            {
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
        [SwaggerOperation(Summary = "Login with username and password")]
        public ActionResult Login(LoginModal loginModal)
        {
            var response = _service.Login(loginModal);
            if (!response)
            {
                return BadRequest(new { message = "User name or password not correct" });
            }
            return NoContent();
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update user (no password)")]
        public async Task<ActionResult> Update(Guid id, UpdateUserModal updateUser)
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