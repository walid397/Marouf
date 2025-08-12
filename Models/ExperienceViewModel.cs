using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Marofh.Models
{
    [NotMapped]
    public class ExperienceViewModel
    {
        public int? experience { get; set; }
        public int? expCountryID { get; set; }
        public int? expCityID { get; set; }
        public string City { get; set; }
    }
}