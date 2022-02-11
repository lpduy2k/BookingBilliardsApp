using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Api.Entities;
using Api.Models;
using Api.Services;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;

namespace Api.Controllers
{
    public class BidaTableController : BaseApiController
    {
        private readonly BidaTableService _service;
        public BidaTableController(BidaTableService service)
        {
            _service = service;
        }
        [HttpGet("{BidaClubId}")]
        [SwaggerOperation(Summary = "Get bida table by bida club id")]
        public ActionResult GetAllByBidaClubId(Guid BidaClubId)
        {
            List<BidaTable> response = _service.GetAllByBidaClubId(BidaClubId);
            List<ResponseBidaTableModel> newTable = new List<ResponseBidaTableModel>();
            foreach (var bidaTable in response)
            {
                ResponseBidaTableModel table = new ResponseBidaTableModel
                {
                    Id = bidaTable.Id,
                    Name = bidaTable.Name,
                    Type = bidaTable.Type,
                    Image = bidaTable.Image,
                    Price = bidaTable.Price,
                    Status = bidaTable.Status,
                    BidaClubId = bidaTable.BidaClubId
                };
                newTable.Add(table);

            }
            return Ok(newTable);
        }
    }
}
