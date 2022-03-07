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
    public class BookingItemController : BaseApiController
    {
        private readonly BookingItemService _service;
        public BookingItemController(BookingItemService service)
        {
            _service = service;
        }
        [HttpPost]
        [SwaggerOperation(Summary = "Create new booking item")]
        public async Task<ActionResult> Create(ResponseBookingItemModel newBookingItem)
        {
            BookingItem bookingItem = new BookingItem
            {
                price = newBookingItem.price,
                BookingId = newBookingItem.BookingId,
                BidaTableId = newBookingItem.BidaTableId
            };
            await _service.Create(bookingItem);
            return CreatedAtAction(nameof(GetById), new { id = bookingItem.Id }, bookingItem);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update booking item")]
        public async Task<ActionResult> Update(Guid id, UpdateBookingItemModel updateBookingItem)
        {
            if (id != updateBookingItem.Id)
            {
                return BadRequest();
            }
            BookingItem bookingItem = new BookingItem
            {
                Id = updateBookingItem.Id,
                price = updateBookingItem.price,
                BookingId = updateBookingItem.BookingId,
                BidaTableId = updateBookingItem.BidaTableId
            };
            bool check = await _service.Update(bookingItem);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get booking item by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            BookingItem bookingItem = await _service.GetById(id);
            if (bookingItem == null)
            {
                return NotFound();
            }
            return Ok(bookingItem);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list booking item")]
        public List<BookingItem> GetList(int pageNumber, int pageSize)
        {
            List<BookingItem> listBookingItems = _service.GetList(pageNumber, pageSize);

            return listBookingItems;
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete booking item by Id")]
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
