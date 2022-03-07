using System;
namespace Api.Models
{
    public class UpdateBookingModel
    {
        public Guid Id { get; set; }
        public DateTime TimeBooking { get; set; }
        public int TotalQuantity { get; set; }
        public float TotalPrice { get; set; }
        public string Status { get; set; }
        public Guid UserId { get; set; }
    }
}
