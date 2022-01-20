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
    public class UserController : BaseApiController
    {
        private readonly UserService _service;
        public UserController(UserService service)
        {
            _service = service;
        }

        [HttpPost]
        public async Task<ActionResult> Create(ResponseUserModal newUser)
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
                PhoneNumber = response.PhoneNumber
            };
            return Ok(user);
        }
        [Route("Login")]
        [HttpPost]
        public ActionResult Login(LoginModal loginModal)
        {
            var response = _service.Login(loginModal);
            if (response == null)
            {
                return BadRequest(new { message = "User name or password not correct" });
            }
            return Ok(response);
        }
    }
}