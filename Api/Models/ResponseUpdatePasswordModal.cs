using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Models
{
    public class ResponseUpdatePasswordModal
    {
        public string OldPassword { get; set; }
        public string NewPassword { get; set; }
    }
}