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
        //public List<Booking> GetList(int pageNumber, int pageSize)
        //{
        //    if (pageNumber == 0 && pageSize == 0)
        //    {
        //        return _context.Bookings.ToList();
        //    }
        //    List<Booking> booking = _context.Bookings.ToPagedList(pageNumber, pageSize).ToList();
        //    if (booking == null)
        //    {
        //        return null;
        //    }
        //    return booking;
        //}
        public dynamic GetList(Guid userId, int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0 && userId == Guid.Empty)
            {
                return _context.Bookings.ToList();
            }
            else if (pageNumber == 0 && pageSize == 0)
            {
                var bookingList = from booking in _context.Bookings
                             join bookingItem in _context.BookingItems on booking.Id equals bookingItem.BookingId
                             join bidaTable in _context.BidaTables on bookingItem.BidaTableId equals bidaTable.Id
                             join bidaClub in _context.BidaClubs on bidaTable.BidaClubId equals bidaClub.Id
                             where booking.UserId == userId
                             select new { TimeBooking = booking.TimeBooking, TotalPrice = booking.TotalPrice, BidaTableName = bidaTable.Name, BidaClubName = bidaClub.Name};

                return bookingList.ToList();
            }
            else if (userId == Guid.Empty)
            {
                return _context.Bookings.ToPagedList(pageNumber, pageSize).ToList();
            }
            else
            {
                var bookingList = from booking in _context.Bookings
                                  join bookingItem in _context.BookingItems on booking.Id equals bookingItem.BookingId
                                  join bidaTable in _context.BidaTables on bookingItem.BidaTableId equals bidaTable.Id
                                  join bidaClub in _context.BidaClubs on bidaTable.BidaClubId equals bidaClub.Id
                                  where booking.UserId == userId
                                  select new { TimeBooking = booking.TimeBooking, TotalPrice = booking.TotalPrice, BidaTableName = bidaTable.Name, BidaClubName = bidaClub.Name };
                return bookingList.ToPagedList(pageNumber, pageSize).ToList();
            }
            
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
