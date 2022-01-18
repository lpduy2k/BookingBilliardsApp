using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BidaClubController : ControllerBase
    {
        private readonly BidaClubService _service;
        public BidaClubController(BidaClubService service)
        {
            _service = service;
        }
        // GET: api/<BidaClubController>
        [HttpGet]
        [AllowAnonymous]
        public ActionResult GetAll()
        {
            return Ok(_service.GetAll());
        }

        // GET api/<BidaClubController>/5
        [HttpGet("{id:Guid}")]
        public async Task<ActionResult> GetById(Guid id)
        {
            BidaClub response = await _service.GetById(id);
            if(response == null)
            {
                return NotFound();
            }
            ResponseBidaClub bida = new ResponseBidaClub
            {
                Id = response.Id,
                Name = response.Name,
                Image = response.Image,
                Quantity = response.Quantity,
                TimeClose = response.TimeClose,
                TimeOpen = response.TimeOpen,
                Address = response.Address,
                PhoneNumber = response.PhoneNumber
            };
            return Ok(bida);
        }

        // POST api/<BidaClubController>
        [HttpPost]
        public async Task<ActionResult> Create(AddBidaClub bidaClub)
        {
            BidaClub bida = new BidaClub
            {
                Name = bidaClub.Name,
                Image = bidaClub.Image,
                Quantity = bidaClub.Quantity,
                TimeClose = bidaClub.TimeClose,
                TimeOpen = bidaClub.TimeOpen,
                Address = bidaClub.Address,
                PhoneNumber = bidaClub.PhoneNumber
            };
            BidaClub response = await _service.Create(bida);
            return NoContent();
        }

        // PUT api/<BidaClubController>/5
        [HttpPut("{id}")]
        public async Task<ActionResult> UpdateCourse(Guid id, ResponseBidaClub updateBidaClub)
        {
            if (id != updateBidaClub.Id)
            {
                return BadRequest();
            }
            BidaClub bida = new BidaClub
            {
                Name = updateBidaClub.Name,
                Image = updateBidaClub.Image,
                Quantity = updateBidaClub.Quantity,
                TimeClose = updateBidaClub.TimeClose,
                TimeOpen = updateBidaClub.TimeOpen,
                Address = updateBidaClub.Address,
                PhoneNumber = updateBidaClub.PhoneNumber
            };
            bool check = await _service.UpdateBidaClub(bida);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }

        // DELETE api/<BidaClubController>/5
        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteBidaClub(Guid id, DeleteBidaClub deleteBidaClub)
        {
            if (id != deleteBidaClub.Id)
            {
                return BadRequest();
            }
            BidaClub bida = new BidaClub
            {
                Status = deleteBidaClub.Status
            };
            bool check = await _service.UpdateBidaClub(bida);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}
