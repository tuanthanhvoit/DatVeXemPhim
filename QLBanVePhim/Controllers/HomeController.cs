using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;

namespace QLBanVePhim.Controllers
{
    public class HomeController : Controller
    {
        private QLPhimDBContext db = new QLPhimDBContext();
        public ActionResult Index()
        {
            var model = db.Phims.OrderByDescending(s => s.PhimId).Take(8).ToList();
            return View(model);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
