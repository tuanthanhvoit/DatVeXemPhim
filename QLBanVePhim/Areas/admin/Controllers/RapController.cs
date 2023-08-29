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
    public class RapController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/Default1/

        public ActionResult Index()
        {
            return View(db.Raps.ToList());
        }

        //
        // GET: /admin/Default1/Details/5

        public ActionResult Details(int id = 0)
        {
            Rap rap = db.Raps.Find(id);
            if (rap == null)
            {
                return HttpNotFound();
            }
            ViewBag.Phong = db.Phongs.Where(s => s.RapId == id).ToList();
            return View(rap);
        }

        //
        // GET: /admin/Default1/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/Default1/Create

        [HttpPost]
        public ActionResult Create(Rap rap)
        {
            if (ModelState.IsValid)
            {
                db.Raps.Add(rap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(rap);
        }

        //
        // GET: /admin/Default1/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Rap rap = db.Raps.Find(id);
            if (rap == null)
            {
                return HttpNotFound();
            }
            return View(rap);
        }

        //
        // POST: /admin/Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(Rap rap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(rap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(rap);
        }

        //
        // GET: /admin/Default1/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Rap rap = db.Raps.Find(id);
            if (rap == null)
            {
                return HttpNotFound();
            }
            return View(rap);
        }

        //
        // POST: /admin/Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Rap rap = db.Raps.Find(id);
            db.Raps.Remove(rap);
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