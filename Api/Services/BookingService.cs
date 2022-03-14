using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class BookingService
    {
        private readonly IBookingRepository<Booking> _repo;
        public BookingService(IBookingRepository<Booking> repo)
        {
            _repo = repo;
        }
        public async Task<Booking> Create(Booking booking)
        {
            return await _repo.Create(booking);
        }
        public async Task<bool> Update(Booking newBooking)
        {
            return await _repo.Update(newBooking);
        }
        public async Task<Booking> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public dynamic GetList(Guid userId, int pageNumber, int pageSize)
        {
            return _repo.GetList(userId, pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
    }
}
