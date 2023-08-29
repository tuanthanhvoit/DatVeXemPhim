using QLBanVePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;


namespace QLBanVePhim.Controllers
{
    
    public class ThanhToanController : Controller
    {
        private QLPhimDBContext db = new Models.QLPhimDBContext();
        //
        // GET: /ThanhToan/
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ThanhToan()
        {
            if (ListDatVe.Cart.Count == 0)
            {
                return RedirectToAction("index", "Home");
            }

            try
            {
                int userId = WebSecurity.GetUserId(User.Identity.Name);
                DatVe dv = new DatVe()
                {
                    UserId = userId,
                    NgayDat = DateTime.Now,
                    SoLuong = ListDatVe.Cart.Count,
                    ThanhTien = decimal.Parse(ListDatVe.Cart.Amount.ToString())
                };
                db.DatVes.Add(dv);
                db.SaveChanges();
                foreach (var item in ListDatVe.Cart._Items)
                {
                    Ve v = db.Ves.Find(item.VeID);
                    v.TinhTrangGhe = true;
                    ChiTietVe ctv = new ChiTietVe() { 
                        DatVeId = dv.DatveId,
                        VeId = item.VeID
                    };
                    db.ChiTietVes.Add(ctv);
                    db.SaveChanges();
                }
                ListDatVe.Cart.Clear();
                return RedirectToAction("Index","Home");
            }
            catch (Exception)
            {
                return RedirectToAction("Login", "Account", new { ReturnUrl = "/ThanhToan/ThanhToan" });
            }
        }

    }
}
