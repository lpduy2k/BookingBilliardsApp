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
    public class BookingItemRepository : IBookingItemRepository<BookingItem>
    {
        private readonly DataContext _context;
        public BookingItemRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<BookingItem> Create(BookingItem bookingItem)
        {
            await _context.BookingItems.AddAsync(bookingItem);
            await _context.SaveChangesAsync();
            return bookingItem;
        }
        public async Task<bool> Update(BookingItem newBookingItem)
        {
            BookingItem bookingItem = _context.BookingItems.AsNoTracking().FirstOrDefault(x => x.Id == newBookingItem.Id);
            if (bookingItem == null)
            {
                return false;
            }
            _context.BookingItems.Update(newBookingItem);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<BookingItem> GetById(Guid id)
        {
            BookingItem bookingItem = await _context.BookingItems.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (bookingItem == null)
            {
                return null;
            }
            return bookingItem;
        }
        public List<BookingItem> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.BookingItems.ToList();
            }
            List<BookingItem> bookingItem = _context.BookingItems.ToPagedList(pageNumber, pageSize).ToList();
            if (bookingItem == null)
            {
                return null;
            }
            return bookingItem;
        }
        public async Task<bool> Delete(Guid id)
        {
            BookingItem bookingItem = await _context.BookingItems.FirstOrDefaultAsync(x => x.Id == id);
            if (bookingItem == null)
            {
                return false;
            }
            _context.BookingItems.Remove(bookingItem);
            await _context.SaveChangesAsync();
            return true;
        }

    }
}
