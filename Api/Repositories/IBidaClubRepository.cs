using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Api.Repositories
{
    public interface IBidaClubRepository<BidaClub>
    {
        List<BidaClub> GetAll();
        Task<BidaClub> GetById(Guid id);
        Task<BidaClub> Create(BidaClub bidaClub);
        Task<bool> UpdateBidaClub(BidaClub newBidaClub);
        Task<bool> DeleteBidaClub(BidaClub newBidaClub);
    }
}