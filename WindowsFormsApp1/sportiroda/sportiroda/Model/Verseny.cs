using System;
using System.Collections.Generic;

#nullable disable

namespace sportiroda.Model
{
    public partial class Verseny
    {
        public int VersenyId { get; set; }
        public int? TipusId { get; set; }
        public int? NevezesiDij { get; set; }
        public DateTime? Datum { get; set; }
        public TimeSpan? Kezdesido { get; set; }
        public TimeSpan? Szintido { get; set; }
    }
}
