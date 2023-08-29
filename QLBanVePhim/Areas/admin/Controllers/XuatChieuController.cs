using QLBanVePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class XuatChieuController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/XuatChieu/Create

        public ActionResult Create(string Id)
        {
            int phpId = 0;
            if (String.IsNullOrEmpty(Id))
            {
                return RedirectToAction("Index", "PhatHanhPhim");
            }
            else
            {
                try
                {
                    phpId = int.Parse(Id);
                }
                catch (Exception)
                {
                    ViewBag.Error = "Mã Phát Hành Phim Không Đúng";
                    return RedirectToAction("Index", "PhatHanhPhim");
                }

            }

            var phathanhphim = db.PhatHanhPhims.SingleOrDefault(s => s.PhatHanhPhimId == phpId);
            var ngaydachieu = db.LichChieus.Where(s => s.PhatHanhPhimId == phpId).ToList();
            var phong = new List<SelectListItem>
            { 
                new SelectListItem{ Text = "A", Value = "a" }, 
                new SelectListItem{ Text = "B", Value = "b" }, 
                new SelectListItem{ Text = "C", Value = "c" }, 
                new SelectListItem{ Text = "D", Value = "d" }, 
                new SelectListItem{ Text = "E", Value = "e" }
            };
            ViewBag.Phong = new SelectList(phong, "Value", "Text");
            ViewBag.XuatChieuId = new SelectList(db.XuatChieus, "XuatChieuId", "GioBatDau");
            var ngay = new List<SelectListItem>();
            foreach (var item in ngaydachieu)
            {
                ngay.Add(new SelectListItem() { 
                    Text = item.NgayChieu.ToString("dd/MM/yyyy"),
                    Value = item.LichChieuId.ToString()
                });
            }
            if (ngaydachieu.Count != 0)
            {
                ViewBag.Day = new SelectList(ngay, "Value", "Text");
            }
            else
            {
                ViewBag.Error = "Chưa có lịch chiếu vui lòng trở về trang Phát Hành Phim Thêm Lịch Chiếu";
            }
            
            return View(phathanhphim);
        }

        //
        // POST: /admin/XuatChieu/Create

        public bool VetuDong(int ctlc) {
            var ghes = db.Ghes.ToList();
            foreach (var ve in ghes)
            {
                Ve v = new Ve
                {
                    GheId = ve.GheId,
                    ChiTietLichChieuId = ctlc,
                    TinhTrangGhe = false
                };
                db.Ves.Add(v);
            }
            try
            {
                db.SaveChanges();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }

        [HttpPost]
        public ActionResult Create(int PhatHanhPhimid, int minOfPhim, int RapId, string phong, int NgayChieu, string clockface)
        {
            minOfPhim = minOfPhim + 30;
            string[] words = Regex.Split(clockface, @"\:");
            TimeSpan s = new TimeSpan(int.Parse(words[0]), int.Parse(words[1]), 0);
            TimeSpan n = TimeSpan.FromMinutes(minOfPhim);
            var ph = db.Phongs.Where(p => p.RapId == RapId && p.TenPhong.ToLower() == phong).SingleOrDefault();
            try
            {
                var xuatchieu = db.XuatChieus.SingleOrDefault(xc => xc.GioBatDau == s);
                ChiTietLichChieu ctlc = new ChiTietLichChieu() { 
                    PhongId = ph.PhongId,
                    XuatChieuId = xuatchieu.XuatChieuId,
                    LichChieuId = NgayChieu
                };
                db.ChiTietLichChieus.Add(ctlc);
                db.SaveChanges();
                if (!VetuDong(ctlc.ChiTietLichChieuId))
                {
                    TempData["Error"] = "Lỗi Khi Khởi Tạo Xuất Chiếu Vui Lòng Thử Lại";
                    return RedirectToAction("Index", "PhatHanhPhim");
                }
                TempData["Error"] = "Đã Khởi Tạo Xuất Chiếu Lúc: " + xuatchieu.GioBatDau;
            }
            catch (Exception)
            {
                XuatChieu xcItem = new XuatChieu() { 
                    GioBatDau = s
                };
                db.XuatChieus.Add(xcItem);
                db.SaveChanges();
                ChiTietLichChieu ctlc = new ChiTietLichChieu()
                {
                    PhongId = ph.PhongId,
                    XuatChieuId = xcItem.XuatChieuId,
                    LichChieuId = NgayChieu
                };
                db.ChiTietLichChieus.Add(ctlc);
                db.SaveChanges();
                if (!VetuDong(ctlc.ChiTietLichChieuId))
                {
                    TempData["Error"] = "Lỗi Khi Khởi Tạo Xuất Chiếu Vui Lòng Thử Lại";
                    return RedirectToAction("Index", "PhatHanhPhim");
                }
                TempData["Error"] = "Đã Khởi Tạo Xuất Chiếu Lúc: " + xcItem.GioBatDau;
            }

            return RedirectToAction("Index", "PhatHanhPhim");
        }

    }
}
