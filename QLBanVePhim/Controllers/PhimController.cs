using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;

namespace QLBanVePhim.Controllers
{
    public class PhimController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();
        
        public ActionResult ChiTiet(int Id) {
            var model = db.Phims.Where(p => p.PhimId == Id).SingleOrDefault();
            ViewBag.Rap = db.Raps.ToList();
            DateTime now = DateTime.Now;
            DateTime begin = now.AddDays(-1);
            DateTime end = now.AddDays(1);
            ViewBag.XuatChieu = db.ChiTietLichChieus.Where(s=>s.LichChieu.PhatHanhPhim.PhimId==Id && s.LichChieu.NgayChieu >= begin && s.LichChieu.NgayChieu <= end).ToList();
            return View(model);
        }
    }
}
