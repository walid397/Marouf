//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Marofh
{
    using System;
    using System.Collections.Generic;
    
    public partial class WorkerLanguage
    {
        public int ID { get; set; }
        public Nullable<int> LanguageID { get; set; }
        public string WorkerID { get; set; }
        public string Level { get; set; }
        public string Method { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Language Language { get; set; }
    }
}
