using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.ModelBinding;

namespace Api.Entities
{
    [Table("BookingItem")]
    public class BookingItem
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }
        public float price { get; set; }
        public Guid BookingId { get; set; }
        public virtual Booking Booking { get; set; }
        public Guid BidaTableId { get; set; }
        public virtual BidaTable BidaTable { get; set; }
    }
}