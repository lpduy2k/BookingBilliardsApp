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

        [HttpPost]
        [SwaggerOperation(Summary = "Create new bida table")]
        public async Task<ActionResult> Create(CreateBidaTableModel newBidaTable)
        {
            BidaTable bidaTable = new BidaTable
            {
                Name = newBidaTable.Name,
                Type = newBidaTable.Type,
                Image = newBidaTable.Image,
                Price = newBidaTable.Price,
                Status = newBidaTable.Status,
                BidaClubId = newBidaTable.BidaClubId
            };
            await _service.Create(bidaTable);
            return CreatedAtAction(nameof(GetById), new { id = bidaTable.Id }, bidaTable);
        }
        [HttpPut("{id}")]
        [SwaggerOperation(Summary = "Update bida table")]
        public async Task<ActionResult> Update(Guid id, ResponseBidaTableModel updateBidaTable)
        {
            if (id != updateBidaTable.Id)
            {
                return BadRequest();
            }
            BidaTable bidaTable = new BidaTable
            {
                Id = updateBidaTable.Id,
                Name = updateBidaTable.Name,
                Type = updateBidaTable.Type,
                Image = updateBidaTable.Image,
                Price = updateBidaTable.Price,
                Status = updateBidaTable.Status,
                BidaClubId = updateBidaTable.BidaClubId
            };
            bool check = await _service.Update(bidaTable);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }
        [HttpGet("{id}")]
        [SwaggerOperation(Summary = "Get bida table by Id")]
        public async Task<ActionResult> GetById(Guid id)
        {
            BidaTable bidaTable = await _service.GetById(id);
            if (bidaTable == null)
            {
                return NotFound();
            }
            return Ok(bidaTable);
        }
        [HttpGet]
        [SwaggerOperation(Summary = "Get list bida table by club id")]
        public async Task<List<BidaTable>> GetList(Guid clubId, int pageNumber, int pageSize)
        {
            if (clubId == Guid.Empty) {
                List<BidaTable> listBidaTables =  _service.GetList(pageNumber, pageSize);

            return listBidaTables;
            }
            else {
                List<BidaTable> listBidaTables = await _service.GetAllByBidaClubId(clubId, pageNumber, pageSize);
                if (listBidaTables == null)
                {
                    return null;
                }
                return listBidaTables;
            }
        }
        [HttpDelete("{id}")]
        [SwaggerOperation(Summary = "Delete bida table by Id")]
        public async Task<ActionResult> Delete(Guid id)
        {
            bool check = await _service.Delete(id);
            if (!check)
            {
                return NotFound();
            }
            return NoContent();
        }

    }
}
