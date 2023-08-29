using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class PhatHanhPhimController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/PhatHanhPhim/

        public ActionResult Index()
        {
            var phathanhphims = db.PhatHanhPhims.Include(p => p.Phim).Include(p => p.Rap);
            return View(phathanhphims.ToList());
        }

        //
        // POST: /admin/PhatHanhPhim/
        [HttpPost]
        public ActionResult Index(PhatHanhPhim model)
        {
            var phathanhphims = db.PhatHanhPhims.Include(p => p.Phim).Include(p => p.Rap);
            return View(phathanhphims.ToList());
        }

        //
        // GET: /admin/PhatHanhPhim/Details/5

        public ActionResult Details(int id = 0)
        {
            PhatHanhPhim phathanhphim = db.PhatHanhPhims.Find(id);
            if (phathanhphim == null)
            {
                return HttpNotFound();
            }
            return View(phathanhphim);
        }

        //
        // GET: /admin/PhatHanhPhim/Create

        public ActionResult Create()
        {
            ViewBag.PhimId = new SelectList(db.Phims, "PhimId", "TenPhim");
            ViewBag.RapId = new SelectList(db.Raps, "RapId", "TenRap");
            return View();
        }

        public bool chiTietPhatHanhPhim(int phathanhphimId) {

            return true;
        }

        //
        // POST: /admin/PhatHanhPhim/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(PhatHanhPhim phathanhphim)
        {
            if (ModelState.IsValid)
            {
                db.PhatHanhPhims.Add(phathanhphim);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PhimId = new SelectList(db.Phims, "PhimId", "TenPhim", phathanhphim.PhimId);
            ViewBag.RapId = new SelectList(db.Raps, "RapId", "TenRap", phathanhphim.RapId);
            return View(phathanhphim);
        }

        //
        // GET: /admin/PhatHanhPhim/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PhatHanhPhim phathanhphim = db.PhatHanhPhims.Find(id);
            if (phathanhphim == null)
            {
                return HttpNotFound();
            }
            ViewBag.PhimId = new SelectList(db.Phims, "PhimId", "TenPhim", phathanhphim.PhimId);
            ViewBag.RapId = new SelectList(db.Raps, "RapId", "TenRap", phathanhphim.RapId);
            return View(phathanhphim);
        }

        //
        // POST: /admin/PhatHanhPhim/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(PhatHanhPhim phathanhphim)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phathanhphim).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PhimId = new SelectList(db.Phims, "PhimId", "TenPhim", phathanhphim.PhimId);
            ViewBag.RapId = new SelectList(db.Raps, "RapId", "TenRap", phathanhphim.RapId);
            return View(phathanhphim);
        }

        //
        // GET: /admin/PhatHanhPhim/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PhatHanhPhim phathanhphim = db.PhatHanhPhims.Find(id);
            if (phathanhphim == null)
            {
                return HttpNotFound();
            }
            return View(phathanhphim);
        }

        //
        // POST: /admin/PhatHanhPhim/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PhatHanhPhim phathanhphim = db.PhatHanhPhims.Find(id);
            db.PhatHanhPhims.Remove(phathanhphim);
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