using QLBanVePhim.Filters;
using QLBanVePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;

namespace QLBanVePhim.Controllers
{
    [Authorize(Roles = "member")]
    [InitializeSimpleMembership]
    public class DatVeController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();
        //
        // GET: /DatVe/
        public ActionResult Index(int Id, int LichChieuId)
        {
            var xuatchieu = db.ChiTietLichChieus.Single(s => s.XuatChieuId == Id && s.LichChieuId == LichChieuId);
            ViewBag.Info = xuatchieu;
            var GroupGhe = db.Ghes.GroupBy(fu => fu.DayGhe).Select(g => new { Name = g.Key, Dg = g.GroupBy(u => u.DayGhe) }).ToList(); ;
            List<ListVe> llv = new List<ListVe>() { };
            foreach (var dayghe in GroupGhe)
            {
                var ve = db.Ves.Where(v => v.ChiTietLichChieuId == xuatchieu.ChiTietLichChieuId && v.Ghe.DayGhe == dayghe.Name).ToList();
                ListVe lv = new ListVe() { 
                    NameDayGhe = dayghe.Name,
                    Listve = ve
                };
                llv.Add(lv);
            }

            var countghe = db.Ghes.GroupBy(fu => fu.DayGhe).Select(g => new { Name = g.Key, Count = g.Count() }).ToList();
            ViewBag.CountMaxGhe = countghe.Max(s => s.Count);
            return View(llv);
        }

        // test
        /*
        public JsonResult GetVe(int Id, int Lichchieu)
        {
            var xuatchieu = db.ChiTietLichChieus.Single(s => s.XuatChieuId == Id && s.LichChieuId == Lichchieu);

            var GroupGhe = db.Ghes.GroupBy(fu => fu.DayGhe).Select(g => new { Name = g.Key, Dg = g.GroupBy(u => u.DayGhe) }).ToList(); ;
            List<ListVe> a = new List<ListVe>() { };
            foreach (var dayghe in GroupGhe)
            {
                var ve = db.Ves.Where(v => v.ChiTietLichChieuId == xuatchieu.ChiTietLichChieuId && v.Ghe.DayGhe == dayghe.Name).ToList();
                ListVe lv = new ListVe()
                {
                    NameDayGhe = dayghe.Name,
                    Listve = ve
                };
                a.Add(lv);
            }

            return Json(a.Select(x => new {
                NameDayGhe = x.NameDayGhe,
                DSVe = x.Listve.Select(s=>s.GheId).ToList()
            }), JsonRequestBehavior.AllowGet);
        }
        */
    }
}
