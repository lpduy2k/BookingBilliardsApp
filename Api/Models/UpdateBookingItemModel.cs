using System;
namespace Api.Models
{
    public class UpdateBookingItemModel
    {
        public Guid Id { get; set; }
        public float price { get; set; }
        public Guid BookingId { get; set; }
        public Guid BidaTableId { get; set; }
    }
}
