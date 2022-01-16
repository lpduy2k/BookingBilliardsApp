using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Entities
{
    [Table("BidaTable")]
    public class BidaTable
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Image { get; set; }
        public float Price { get; set; }
        public string Status { get; set; }
        public Guid BidaClubId { get; set; }
        public virtual BidaClub BidaClub { get; set; }
    }
}