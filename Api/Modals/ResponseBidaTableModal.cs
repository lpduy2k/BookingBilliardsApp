﻿using System;
namespace Api.Modals
{
    public class ResponseBidaTableModal
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Type { get; set; }
        public string Image { get; set; }
        public float Price { get; set; }
        public string Status { get; set; }
        public Guid BidaClubId { get; set; }

    }
}
