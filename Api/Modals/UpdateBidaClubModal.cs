using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Modals
{
    public class UpdateBidaClubModal
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Image { get; set; }
        public string TimeOpen { get; set; }
        public string TimeClose { get; set; }
        public int Quantity { get; set; }
        public string Status { get; set; }
        public Guid UserId { get; set; }
    }
}