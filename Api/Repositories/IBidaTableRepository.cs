using System;
using System.Collections.Generic;

namespace Api.Repositories
{
    public interface IBidaTableRepository<BidaTable>
    {
        List<BidaTable> GetAllByBidaClubId(Guid BidaClubId);
    }
}
