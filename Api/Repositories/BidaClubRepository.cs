using Api.Data;
using Api.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Repositories
{
    public class BidaClubRepository : IBidaClubRepository<BidaClub>
    {
        private readonly DataContext _context;
        public BidaClubRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<BidaClub> Create(BidaClub bidaClub)
        {
            await _context.BidaClubs.AddAsync(bidaClub);
            await _context.SaveChangesAsync();
            return bidaClub;
        }

        public async Task<bool> Delete(Guid id)
        {
            BidaClub bida = await _context.BidaClubs.FirstOrDefaultAsync(x => x.Id == id);
            if (bida == null)
            {
                return false;
            }
            _context.BidaClubs.Remove(bida);
            await _context.SaveChangesAsync();
            return true;
        }

        public List<BidaClub> GetAll()
        {
            return _context.BidaClubs.ToList();
        }

        public async Task<BidaClub> GetById(Guid id)
        {
            BidaClub bida = await _context.BidaClubs.Where(x => x.Id == id).FirstOrDefaultAsync();
            if (bida == null)
            {
                return null;
            }
            return bida;
        }

        public async Task<bool> Update(BidaClub newBidaClub)
        {
            BidaClub bida = await _context.BidaClubs.AsNoTracking().FirstOrDefaultAsync(x => x.Id == newBidaClub.Id);
            if (bida == null)
            {
                return false;
            }
            _context.BidaClubs.Update(newBidaClub);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
