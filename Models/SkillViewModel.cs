using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Marofh.Models
{
    [NotMapped]
    public class SkillViewModel
    {
        public string Level { get; set; }
        public int? SkillID { get; set; }
    }
}