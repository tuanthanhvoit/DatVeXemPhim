using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBanVePhim.Models
{
    public class ListVe
    {
        public string NameDayGhe { get; set; }
        public List<Ve> Listve { get; set; }
    }

    public class qlListVe 
    {
        public List<ListVe> qllistve { get; set; }
    }
}