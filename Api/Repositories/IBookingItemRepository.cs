using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;

namespace Api.Repositories
{
    public interface IBookingItemRepository<T>
    {
        Task<BookingItem> Create(BookingItem bookingItem);
        Task<bool> Update(BookingItem newBookingItem);
        Task<BookingItem> GetById(Guid id);
        List<BookingItem> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
