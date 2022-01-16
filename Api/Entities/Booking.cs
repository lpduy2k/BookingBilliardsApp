using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    [Table("Booking")]
    public class Booking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }
        public DateTime TimeBooking { get; set; }
        public int TotalQuantity { get; set; }
        public float TotalPrice { get; set; }
        public string Status { get; set; }
        public Guid UserId { get; set; }
        public virtual User User { get; set; }
    }
}