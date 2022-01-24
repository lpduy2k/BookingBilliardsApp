using System;
using System.Collections.Generic;
using Api.Entities;
using Api.Repositories;

namespace Api.Services
{
    public class BidaTableService
    {
        private readonly IBidaTableRepository<BidaTable> _repo;
        public BidaTableService(IBidaTableRepository<BidaTable> repo)
        {
            _repo = repo;
        }
        public List<BidaTable> GetAllByBidaClubId(Guid BidaClubId)
        {
            return _repo.GetAllByBidaClubId(BidaClubId);
        }
    }
}
