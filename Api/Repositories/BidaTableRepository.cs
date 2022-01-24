using System;
using System.Collections.Generic;
using System.Linq;
using Api.Data;
using Api.Entities;

namespace Api.Repositories
{
    public class BidaTableRepository : IBidaTableRepository<BidaTable>
    {
        private readonly DataContext _context;
        public BidaTableRepository(DataContext context)
        {
            _context = context;
        }

        public List<BidaTable> GetAllByBidaClubId(Guid id)
        {
            return _context.BidaTables.ToList();
        }
    }
}
