using System;
using System.Collections.Generic;

#nullable disable

namespace sportiroda.Model
{
    public partial class Versenyzo
    {
        public int VersenyzoId { get; set; }
        public string Nev { get; set; }
        public DateTime? Szuldatum { get; set; }
        public int? Nem { get; set; }
        public string Email { get; set; }
    }
}
