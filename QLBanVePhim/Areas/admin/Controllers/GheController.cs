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
    public class GheController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/Ghe/

        public ActionResult Index()
        {
            return View(db.Ghes.ToList());
        }

        //
        // GET: /admin/Ghe/Details/5

        public ActionResult Details(int id = 0)
        {
            Ghe ghe = db.Ghes.Find(id);
            if (ghe == null)
            {
                return HttpNotFound();
            }
            return View(ghe);
        }

        //
        // GET: /admin/Ghe/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/Ghe/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Ghe ghe)
        {
            if (ModelState.IsValid)
            {
                db.Ghes.Add(ghe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ghe);
        }

        //
        // GET: /admin/Ghe/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Ghe ghe = db.Ghes.Find(id);
            if (ghe == null)
            {
                return HttpNotFound();
            }
            return View(ghe);
        }

        //
        // POST: /admin/Ghe/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Ghe ghe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ghe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ghe);
        }

        //
        // GET: /admin/Ghe/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Ghe ghe = db.Ghes.Find(id);
            if (ghe == null)
            {
                return HttpNotFound();
            }
            return View(ghe);
        }

        //
        // POST: /admin/Ghe/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ghe ghe = db.Ghes.Find(id);
            db.Ghes.Remove(ghe);
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