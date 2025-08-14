using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Marofh.Models
{
    [NotMapped]
    public class LanguageViewModel
    {
        
        public int? LanguageID { get; set; }

        public string ReadingMethod { get; set; }
        public string writingMethod { get; set; }
        public string SpeakingMethod { get; set; }
    }
}