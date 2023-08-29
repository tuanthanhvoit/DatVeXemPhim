using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;
using System.IO;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class PhimController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();

        //
        // GET: /admin/Phim/

        public ActionResult Index()
        {
            var phims = db.Phims.Include(p => p.DangPhim).Include(p => p.LoaiPhim);
            return View(phims.ToList());
        }

        //
        // GET: /admin/Phim/Details/5

        public ActionResult Details(int id = 0)
        {
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            return View(phim);
        }

        //
        // GET: /admin/Phim/Create

        public ActionResult Create()
        {
            ViewBag.DangPhimId = new SelectList(db.DangPhims, "DangPhimId", "TenDang");
            ViewBag.LoaiPhimId = new SelectList(db.LoaiPhims, "LoaiPhimId", "TenLoai");
            return View();
        }

        //
        // POST: /admin/Phim/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Phim phim, HttpPostedFileBase myfile)
        {
            ViewBag.DangPhimId = new SelectList(db.DangPhims, "DangPhimId", "TenDang", phim.DangPhimId);
            ViewBag.LoaiPhimId = new SelectList(db.LoaiPhims, "LoaiPhimId", "TenLoai", phim.LoaiPhimId);
            if (myfile != null)
            {
                if (myfile.FileName.Contains(".jpg") || myfile.FileName.Contains(".png"))
                {
                    var fileName = "";
                    if (myfile.ContentLength > 0 && myfile.ContentLength < 1024 * 1024 * 2)
                    {
                        fileName = Convert.ToDateTime(DateTime.Now).ToString() + Path.GetFileName(myfile.FileName);
                        fileName = fileName.Replace("/", "");
                        fileName = fileName.Replace(":", "");
                        fileName = fileName.Replace(" ", "-");
                        var path = Path.Combine(Server.MapPath("~/Images/movie/"), fileName);
                        myfile.SaveAs(path);
                        phim.AnhDaiDien = "movie/"+fileName;
                        db.Phims.Add(phim);
                        db.SaveChanges();
                        return RedirectToAction("Details", new { id = phim.PhimId });
                    }
                    else
                    {
                        ViewData["kichthuoc"] = "Upload ảnh dưới 2MB";
                    }
                }
                else
                {
                    ViewData["loaianh"] = "File ảnh không hợp lệ";
                }
            }
            else { 

                ViewData["hinh"] = "Chưa chọn hình ảnh";
                
            }

            
            return View(phim);
        }

        //
        // GET: /admin/Phim/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            ViewBag.DangPhimId = new SelectList(db.DangPhims, "DangPhimId", "TenDang", phim.DangPhimId);
            ViewBag.LoaiPhimId = new SelectList(db.LoaiPhims, "LoaiPhimId", "TenLoai", phim.LoaiPhimId);
            return View(phim);
        }

        //
        // POST: /admin/Phim/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Phim phim)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phim).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DangPhimId = new SelectList(db.DangPhims, "DangPhimId", "TenDang", phim.DangPhimId);
            ViewBag.LoaiPhimId = new SelectList(db.LoaiPhims, "LoaiPhimId", "TenLoai", phim.LoaiPhimId);
            return View(phim);
        }

        //
        // GET: /admin/Phim/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Phim phim = db.Phims.Find(id);
            if (phim == null)
            {
                return HttpNotFound();
            }
            return View(phim);
        }

        //
        // POST: /admin/Phim/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Phim phim = db.Phims.Find(id);
            db.Phims.Remove(phim);
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