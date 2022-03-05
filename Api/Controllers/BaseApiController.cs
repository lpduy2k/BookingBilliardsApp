using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("/api/v1.0/[controller]")]
    [ApiController]
    public class BaseApiController : ControllerBase
    {
    }
}