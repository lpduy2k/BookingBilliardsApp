using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class BookingController : BaseApiController
    {
        private readonly BookingService _service;
        public BookingController(BookingService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new booking")]
        public async Task<ActionResult> Create(ResponseBookingModel newBooking)
        {
            Booking booking = new Booking
            {
                TimeBooking = newBooking.TimeBooking,
                TotalPrice = newBooking.TotalPrice,
                TotalQuantity = newBooking.TotalQuantity,
                Status = newBooking.Status,
                UserId = newBooking.UserId
            };
            await _service.Create(booking);
            return CreatedAtAction(nameof(GetById), new { id = booking.Id }, booking);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update booing")]
        public async Task<ActionResult> Update(Guid id, UpdateBookingModel updateBooking)
        {
            if (id != updateBooking.Id)
            {
                return BadRequest();
            }
            Booking booking = new Booking
            {
                Id = updateBooking.Id,
                TimeBooking = updateBooking.TimeBooking,
                TotalPrice = updateBooking.TotalPrice,
                TotalQuantity = updateBooking.TotalQuantity,
                Status = updateBooking.Status,
                UserId = updateBooking.UserId
            };
            bool check = await _service.Update(booking);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get booking by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            Booking booking = await _service.GetById(id);
            if (booking == null)
            {
                return NotFound();
            }
            return Ok(booking);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list booking")]
        public ActionResult GetList(Guid userId, int pageNumber, int pageSize)
        {
            var listBookings = _service.GetList(userId, pageNumber, pageSize);

            return Ok(listBookings);
        }
        [HttpGet("/clubId")]
        [SwaggerOperation(Summary = "Get list booking by bida club id")]
        public ActionResult GetListByClubId(Guid clubId, int pageNumber, int pageSize)
        {
            var listBookings = _service.GetListByClubId(clubId, pageNumber, pageSize);

            return Ok(listBookings);
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete booking by Id")]
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
