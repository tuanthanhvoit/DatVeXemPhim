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
    public class LoaiPhimController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/LoaiPhim/

        public ActionResult Index()
        {
            return View(db.LoaiPhims.ToList());
        }

        //
        // GET: /admin/LoaiPhim/Details/5

        public ActionResult Details(int id = 0)
        {
            LoaiPhim loaiphim = db.LoaiPhims.Find(id);
            if (loaiphim == null)
            {
                return HttpNotFound();
            }
            return View(loaiphim);
        }

        public ActionResult CreateTool()
        {
            return PartialView();
        }

        //
        // GET: /admin/LoaiPhim/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/LoaiPhim/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(LoaiPhim loaiphim)
        {
            if (ModelState.IsValid)
            {
                db.LoaiPhims.Add(loaiphim);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiphim);
        }

        //
        // GET: /admin/LoaiPhim/Edit/5

        public ActionResult Edit(int id = 0)
        {
            LoaiPhim loaiphim = db.LoaiPhims.Find(id);
            if (loaiphim == null)
            {
                return HttpNotFound();
            }
            return View(loaiphim);
        }

        //
        // POST: /admin/LoaiPhim/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LoaiPhim loaiphim)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiphim).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiphim);
        }

        //
        // GET: /admin/LoaiPhim/Delete/5

        public ActionResult Delete(int id = 0)
        {
            LoaiPhim loaiphim = db.LoaiPhims.Find(id);
            if (loaiphim == null)
            {
                return HttpNotFound();
            }
            return View(loaiphim);
        }

        //
        // POST: /admin/LoaiPhim/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiPhim loaiphim = db.LoaiPhims.Find(id);
            db.LoaiPhims.Remove(loaiphim);
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