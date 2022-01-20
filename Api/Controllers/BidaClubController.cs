using Api.Entities;
using Api.Modals;
using Api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Controllers
{
    public class BidaClubController : BaseApiController
    {
        private readonly BidaClubService _service;
        public BidaClubController(BidaClubService service)
        {
            _service = service;
        }

        [HttpGet]
        [SwaggerOperation(Summary = "Get all bida club")]
        public ActionResult GetAll()
        {
            List<BidaClub> listBidaClub = _service.GetAll();
            List<ResponseBidaClubModal> newFormatResponse = new List<ResponseBidaClubModal>();
            foreach (var bidaClub in listBidaClub)
            {
                ResponseBidaClubModal bida = new ResponseBidaClubModal
                {
                    Id = bidaClub.Id,
                    Name = bidaClub.Name,
                    Image = bidaClub.Image,
                    Quantity = bidaClub.Quantity,
                    TimeClose = bidaClub.TimeClose.ToString(@"hh\:mm"),
                    TimeOpen = bidaClub.TimeOpen.ToString(@"hh\:mm"),
                    Address = bidaClub.Address,
                    PhoneNumber = bidaClub.PhoneNumber,
                    Status = bidaClub.Status,
                    UserId = bidaClub.UserId
                };
                newFormatResponse.Add(bida);
            }
            return Ok(newFormatResponse);
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get bida club by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            BidaClub response = await _service.GetById(id);
            if (response == null)
            {
                return NotFound();
            }
            ResponseBidaClubModal bida = new ResponseBidaClubModal
            {
                Id = response.Id,
                Name = response.Name,
                Image = response.Image,
                Quantity = response.Quantity,
                TimeClose = response.TimeClose.ToString(@"hh\:mm"),
                TimeOpen = response.TimeOpen.ToString(@"hh\:mm"),
                Address = response.Address,
                PhoneNumber = response.PhoneNumber,
                Status = response.Status,
                UserId = response.UserId
            };
            return Ok(bida);
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new bida club")]
        public async Task<ActionResult> Create(AddBidaClubModal newBidaClub)
        {
            TimeSpan timeClose = TimeSpan.Parse(newBidaClub.TimeClose);
            TimeSpan timeOpen = TimeSpan.Parse(newBidaClub.TimeOpen);
            BidaClub bidaClub = new BidaClub
            {
                Name = newBidaClub.Name,
                Image = newBidaClub.Image,
                Quantity = newBidaClub.Quantity,
                TimeClose = timeClose,
                TimeOpen = timeOpen,
                Address = newBidaClub.Address,
                PhoneNumber = newBidaClub.PhoneNumber,
                Status = newBidaClub.Status,
                UserId = newBidaClub.UserId
            };
            BidaClub response = await _service.Create(bidaClub);
            return CreatedAtAction(nameof(GetById), new { id = response.Id }, response);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update bida club")]
        public async Task<ActionResult> Update(Guid id, UpdateBidaClubModal updateBidaClub)
        {
            if (id != updateBidaClub.Id)
            {
                return BadRequest();
            }
            TimeSpan timeClose = TimeSpan.Parse(updateBidaClub.TimeClose);
            TimeSpan timeOpen = TimeSpan.Parse(updateBidaClub.TimeOpen);
            BidaClub bida = new BidaClub
            {
                Id = updateBidaClub.Id,
                Name = updateBidaClub.Name,
                Image = updateBidaClub.Image,
                Quantity = updateBidaClub.Quantity,
                TimeClose = timeClose,
                TimeOpen = timeOpen,
                Address = updateBidaClub.Address,
                PhoneNumber = updateBidaClub.PhoneNumber,
                Status = updateBidaClub.Status,
                UserId = updateBidaClub.UserId
            };
            bool check = await _service.Update(bida);
            if (!check)
            {
                return BadRequest();
            }
            return NoContent();
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete bida club by Id")]
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
