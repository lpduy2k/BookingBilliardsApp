using Api.Entities;
using Api.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Services
{
    public class BidaClubService
    {
        private readonly IBidaClubRepository<BidaClub> _repo;
        public BidaClubService(IBidaClubRepository<BidaClub> repo)
        {
            _repo = repo;
        }
        public List<BidaClub> GetAll()
        {
            return _repo.GetAll();
        }
        public async Task<BidaClub> Create(BidaClub bidaClub)
        {
            return await _repo.Create(bidaClub);
        }
        public async Task<BidaClub> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public async Task<bool> UpdateBidaClub(BidaClub newBida)
        {
            return await _repo.UpdateBidaClub(newBida);
        }
        public async Task<bool> DeleteBidaClub(BidaClub newBida)
        {
            return await _repo.DeleteBidaClub(newBida);
        }

    }
}
