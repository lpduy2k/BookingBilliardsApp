using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class BookingItemService
    {
        private readonly IBookingItemRepository<BookingItem> _repo;
        public BookingItemService(IBookingItemRepository<BookingItem> repo)
        {
            _repo = repo;
        }
        public async Task<BookingItem> Create(BookingItem bookingItem)
        {
            return await _repo.Create(bookingItem);
        }
        public async Task<bool> Update(BookingItem newBookingItem)
        {
            return await _repo.Update(newBookingItem);
        }
        public async Task<BookingItem> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<BookingItem> GetList(int pageNumber, int pageSize)
        {
            return _repo.GetList(pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }

    }
}
