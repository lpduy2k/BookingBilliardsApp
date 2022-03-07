using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;
using X.PagedList;

namespace Api.Repositories
{
    public class BookingRepository : IBookingRepository<Booking>
    {
        private readonly DataContext _context;
        public BookingRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<Booking> Create(Booking booking)
        {
            await _context.Bookings.AddAsync(booking);
            await _context.SaveChangesAsync();
            return booking;
        }
        public async Task<bool> Update(Booking newBooking)
        {
            Booking booking = _context.Bookings.AsNoTracking().FirstOrDefault(x => x.Id == newBooking.Id);
            if (booking == null)
            {
                return false;
            }
            _context.Bookings.Update(newBooking);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<Booking> GetById(Guid id)
        {
            Booking booking = await _context.Bookings.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (booking == null)
            {
                return null;
            }
            return booking;
        }
        public List<Booking> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.Bookings.ToList();
            }
            List<Booking> booking = _context.Bookings.ToPagedList(pageNumber, pageSize).ToList();
            if (booking == null)
            {
                return null;
            }
            return booking;
        }
        public async Task<bool> Delete(Guid id)
        {
            Booking booking = await _context.Bookings.FirstOrDefaultAsync(x => x.Id == id);
            if (booking == null)
            {
                return false;
            }
            _context.Bookings.Remove(booking);
            await _context.SaveChangesAsync();
            return true;
        }

    }
}
