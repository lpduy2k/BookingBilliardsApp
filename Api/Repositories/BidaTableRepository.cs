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
    public class BidaTableRepository : IBidaTableRepository<BidaTable>
    {
        private readonly DataContext _context;
        public BidaTableRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<BidaTable> Create(BidaTable bidaTable)
        {
            await _context.BidaTables.AddAsync(bidaTable);
            await _context.SaveChangesAsync();
            return bidaTable;
        }
        public async Task<bool> Update(BidaTable newBidaTable)
        {
            BidaTable bidaTable = _context.BidaTables.AsNoTracking().FirstOrDefault(x => x.Id == newBidaTable.Id);
            if (bidaTable == null)
            {
                return false;
            }
            _context.BidaTables.Update(newBidaTable);
            await _context.SaveChangesAsync();
            return true;
        }
        public async Task<BidaTable> GetById(Guid id)
        {
            BidaTable bidaTable = await _context.BidaTables.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (bidaTable == null)
            {
                return null;
            }
            return bidaTable;
        }
        public List<BidaTable> GetList(int pageNumber, int pageSize)
        {
            if (pageNumber == 0 && pageSize == 0)
            {
                return _context.BidaTables.ToList();
            }
            List<BidaTable> bidaTables = _context.BidaTables.ToPagedList(pageNumber, pageSize).ToList();
            if (bidaTables == null)
            {
                return null;
            }
            return bidaTables;
        }
        public async Task<bool> Delete(Guid id)
        {
            BidaTable bidaTable = await _context.BidaTables.FirstOrDefaultAsync(x => x.Id == id);
            if (bidaTable == null)
            {
                return false;
            }
            _context.BidaTables.Remove(bidaTable);
            await _context.SaveChangesAsync();
            return true;
        }
        public List<BidaTable> GetAllByBidaClubId(Guid id)
        {
            return _context.BidaTables.ToList();
        }
    }
}
