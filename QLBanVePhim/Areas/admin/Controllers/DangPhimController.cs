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
    public class DangPhimController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/DangPhim/

        public ActionResult Index()
        {
            return View(db.DangPhims.ToList());
        }

        //
        // GET: /admin/DangPhim/Details/5

        public ActionResult Details(int id = 0)
        {
            DangPhim dangphim = db.DangPhims.Find(id);
            if (dangphim == null)
            {
                return HttpNotFound();
            }
            return View(dangphim);
        }

        //
        // partial create

        public ActionResult CreateTool()
        {
            return PartialView();
        }

        //
        // GET: /admin/DangPhim/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/DangPhim/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DangPhim dangphim)
        {
            if (ModelState.IsValid)
            {
                db.DangPhims.Add(dangphim);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(dangphim);
        }

        //
        // GET: /admin/DangPhim/Edit/5

        public ActionResult Edit(int id = 0)
        {
            DangPhim dangphim = db.DangPhims.Find(id);
            if (dangphim == null)
            {
                return HttpNotFound();
            }
            return View(dangphim);
        }

        //
        // POST: /admin/DangPhim/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DangPhim dangphim)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dangphim).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(dangphim);
        }

        //
        // GET: /admin/DangPhim/Delete/5

        public ActionResult Delete(int id = 0)
        {
            DangPhim dangphim = db.DangPhims.Find(id);
            if (dangphim == null)
            {
                return HttpNotFound();
            }
            return View(dangphim);
        }

        //
        // POST: /admin/DangPhim/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DangPhim dangphim = db.DangPhims.Find(id);
            db.DangPhims.Remove(dangphim);
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