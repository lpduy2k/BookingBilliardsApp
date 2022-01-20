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
        Task<bool> Update(BidaClub newBidaClub);
        Task<bool> Delete(Guid id);
    }
}