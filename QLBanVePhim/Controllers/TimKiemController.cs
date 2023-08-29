using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;


namespace QLBanVePhim.Controllers
{
    public class TimKiemController : Controller
    {
        QLPhimDBContext Db = new QLPhimDBContext();
        //
        // GET: /TimKiem/
        
        public ActionResult Index()
        {
            ViewBag.Rap = Db.Raps;
            return View();
        }

        [HttpPost]
        public ActionResult Index(string inputSearch = "", string theophim = "theo phim")
        {
            if (theophim != "theo phim")
            {
                var modeltl = Db.Phims.Where(s=>s.LoaiPhim.TenLoai.Contains(inputSearch)).ToList();
                return View(modeltl);
            }
            // && p.NgayBatDau <= DateTime.Now && p.NgayKetThuc >= DateTime.Now
            var model = Db.Phims.Where(p => p.TenPhim.Contains(inputSearch)).ToList();
            return View(model);
        }

        public JsonResult GetAllFilmInRap(int marap)
        {
            var phim = Db.PhatHanhPhims.Where(p=>p.RapId == marap).ToList();
            return Json(phim.Select(
                x => new { 
                    id = x.PhatHanhPhimId,
                    tenphim = x.Phim.TenPhim,
                    dangphim = x.Phim.DangPhim.TenDang
                }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetLichChieu(int maphim, int songay = 1)
        {
            DateTime ngaybd = DateTime.Now;
            ngaybd = ngaybd.AddDays(-1);
            DateTime ngaykt = ngaybd.AddDays(songay);
            var e = Db.LichChieus.Where(p => p.PhatHanhPhimId == maphim && p.NgayChieu >= ngaybd && p.NgayChieu <= ngaykt).ToList();
            return Json(e.Select(
                x => new
                {
                    lichchieu = x.LichChieuId,
                    ngay = x.NgayChieu.ToShortDateString(),
                    xuatchieu = x.ChiTietLichChieus.Where(p => p.LichChieuId == x.LichChieuId).Select(p => new
                    {
                        xuatChieuId = p.XuatChieuId,
                        giochieu = p.XuatChieu.GioBatDau.ToString(@"hh\:mm")
                    }).ToList()
                }), JsonRequestBehavior.AllowGet);
        }
    }
}
