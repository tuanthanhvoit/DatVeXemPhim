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
    public class PhongController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/Phong/

        public ActionResult Index()
        {
            return View(db.Phongs.ToList());
        }

        //
        // GET: /admin/Phong/Details/5

        public ActionResult Details(int id = 0)
        {
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            return View(phong);
        }

        //
        // GET: /admin/Phong/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/Phong/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Phong phong)
        {
            if (ModelState.IsValid)
            {
                db.Phongs.Add(phong);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phong);
        }

        //
        // GET: /admin/Phong/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            return View(phong);
        }

        //
        // POST: /admin/Phong/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Phong phong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phong);
        }

        //
        // GET: /admin/Phong/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Phong phong = db.Phongs.Find(id);
            if (phong == null)
            {
                return HttpNotFound();
            }
            return View(phong);
        }

        //
        // POST: /admin/Phong/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phong phong = db.Phongs.Find(id);
            db.Phongs.Remove(phong);
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