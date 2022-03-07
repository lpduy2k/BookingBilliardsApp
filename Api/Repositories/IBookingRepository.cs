using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IBookingRepository<T>
    {
        Task<Booking> Create(Booking booking);
        Task<bool> Update(Booking newBooking);
        Task<Booking> GetById(Guid id);
        List<Booking> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
