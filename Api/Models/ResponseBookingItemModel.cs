using System;
namespace Api.Models
{
    public class ResponseBookingItemModel
    {
        public float price { get; set; }
        public Guid BookingId { get; set; }
        public Guid BidaTableId { get; set; }
    }
}
