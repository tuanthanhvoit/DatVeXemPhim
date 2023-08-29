using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;
using System.Text.RegularExpressions;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class LichChieuController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/LichChieu/

        public ActionResult Index()
        {
            var lichchieus = db.LichChieus.Include(l => l.PhatHanhPhim);
            return View(lichchieus.ToList());
        }

        //
        // GET: /admin/LichChieu/Details/5

        public ActionResult Details(int id = 0)
        {
            LichChieu lichchieu = db.LichChieus.Find(id);
            if (lichchieu == null)
            {
                return HttpNotFound();
            }
            return View(lichchieu);
        }

        //
        // GET: /admin/LichChieu/Create

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

            var ngay = new List<SelectListItem>();
            
            var e = Enumerable.Range(0, 1 + phathanhphim.NgayKetThuc.Subtract(phathanhphim.NgayBatDau).Days).Select(offset => phathanhphim.NgayBatDau.AddDays(offset)).ToArray();
            var ngaydachieu = db.LichChieus.Where(s => s.PhatHanhPhimId == phpId).ToList();
            foreach (var item in e)
            {
                bool kt = true;
                foreach (var ngaydcitem in ngaydachieu)
                {
                    if (item == ngaydcitem.NgayChieu)
                    {
                        kt = false;
                        
                        break;
                    }
                }
                if (kt)
                {
                    ngay.Add(new SelectListItem()
                    {
                        Text = item.ToString("dd/MM/yyyy"),
                        Value = item.ToString("dd/MM/yyyy"),
                    });
                }
            }
            ViewBag.Day = ngay.ToList();
            ViewBag.DayDaChieu = ngaydachieu;
            return View(phathanhphim);
        }

        //
        // POST: /admin/LichChieu/Create

        [HttpPost]
        public ActionResult Create(int PhatHanhPhimid)
        {
            String[] names = Request.Form.AllKeys;
            foreach (var name in names)
            {
                if (name.StartsWith("ChkNgay"))
                {
                    string ngay = name.Substring(7);
                    LichChieu lc = new LichChieu() { 
                        NgayChieu = DateTime.ParseExact(ngay,"dd/MM/yyyy",null),
                        PhatHanhPhimId = PhatHanhPhimid
                    };
                    db.LichChieus.Add(lc);
                }
            }
            try
            {
                db.SaveChanges();
            }
            catch (Exception)
            {
                ViewBag.Error = "Lỗi Khi Thêm Lịch Chiếu";
                return RedirectToAction("Create", "LichChieu", new { Id = PhatHanhPhimid });
            }
            return RedirectToAction("Create", "LichChieu", new { Id = PhatHanhPhimid });
        }


        //
        // GET: /admin/LichChieu/Edit/5

        public ActionResult Edit(int id = 0)
        {
            LichChieu lichchieu = db.LichChieus.Find(id);
            if (lichchieu == null)
            {
                return HttpNotFound();
            }
            ViewBag.PhatHanhPhimId = new SelectList(db.PhatHanhPhims, "PhatHanhPhimId", "PhatHanhPhimId", lichchieu.PhatHanhPhimId);
            return View(lichchieu);
        }

        //
        // POST: /admin/LichChieu/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LichChieu lichchieu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lichchieu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PhatHanhPhimId = new SelectList(db.PhatHanhPhims, "PhatHanhPhimId", "PhatHanhPhimId", lichchieu.PhatHanhPhimId);
            return View(lichchieu);
        }

        //
        // GET: /admin/LichChieu/Delete/5

        public ActionResult Delete(int id = 0)
        {
            LichChieu lichchieu = db.LichChieus.Find(id);
            if (lichchieu == null)
            {
                return HttpNotFound();
            }
            return View(lichchieu);
        }

        //
        // POST: /admin/LichChieu/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LichChieu lichchieu = db.LichChieus.Find(id);
            db.LichChieus.Remove(lichchieu);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}