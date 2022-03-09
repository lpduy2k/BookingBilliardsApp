using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Api.Repositories
{
    public interface IBidaTableRepository<BidaTable>
    {
        List<BidaTable> GetAllByBidaClubId(Guid BidaClubId);
        Task<BidaTable> Create(BidaTable booking);
        Task<bool> Update(BidaTable newBooking);
        Task<BidaTable> GetById(Guid id);
        List<BidaTable> GetList(int pageNumber, int pageSize);
        Task<bool> Delete(Guid id);
    }
}
