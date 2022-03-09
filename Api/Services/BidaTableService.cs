using System;
using System.Collections.Generic;
using System.Threading.Tasks;
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
        public async Task<BidaTable> Create(BidaTable bidaTable)
        {
            return await _repo.Create(bidaTable);
        }
        public async Task<bool> Update(BidaTable newBidaTable)
        {
            return await _repo.Update(newBidaTable);
        }
        public async Task<BidaTable> GetById(Guid id)
        {
            return await _repo.GetById(id);
        }
        public List<BidaTable> GetList(int pageNumber, int pageSize)
        {
            return _repo.GetList(pageNumber, pageSize);
        }
        public async Task<bool> Delete(Guid id)
        {
            return await _repo.Delete(id);
        }
        public Task<List<BidaTable>> GetAllByBidaClubId(Guid BidaClubId, int pageNumber, int pageSize)
        {
            return _repo.GetAllByBidaClubId(BidaClubId, pageSize, pageNumber);
        }
    }
}
