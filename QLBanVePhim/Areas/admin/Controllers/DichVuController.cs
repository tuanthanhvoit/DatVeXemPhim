﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class DichVuController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/DichVu/

        public ActionResult Index()
        {
            return View(db.DichVus.ToList());
        }

        //
        // GET: /admin/DichVu/Details/5

        public ActionResult Details(int id = 0)
        {
            DichVu dichvu = db.DichVus.Find(id);
            if (dichvu == null)
            {
                return HttpNotFound();
            }
            return View(dichvu);
        }

        //
        // GET: /admin/DichVu/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /admin/DichVu/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DichVu dichvu)
        {
            if (ModelState.IsValid)
            {
                db.DichVus.Add(dichvu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(dichvu);
        }

        //
        // GET: /admin/DichVu/Edit/5

        public ActionResult Edit(int id = 0)
        {
            DichVu dichvu = db.DichVus.Find(id);
            if (dichvu == null)
            {
                return HttpNotFound();
            }
            return View(dichvu);
        }

        //
        // POST: /admin/DichVu/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DichVu dichvu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dichvu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(dichvu);
        }

        //
        // GET: /admin/DichVu/Delete/5

        public ActionResult Delete(int id = 0)
        {
            DichVu dichvu = db.DichVus.Find(id);
            if (dichvu == null)
            {
                return HttpNotFound();
            }
            return View(dichvu);
        }

        //
        // POST: /admin/DichVu/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DichVu dichvu = db.DichVus.Find(id);
            db.DichVus.Remove(dichvu);
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