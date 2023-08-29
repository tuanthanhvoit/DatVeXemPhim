using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLBanVePhim.Models;

namespace QLBanVePhim.Controllers
{
    public class DesignController : Controller
    {

        private QLPhimDBContext db = new QLPhimDBContext();

        public ActionResult Login()
        {
            return PartialView();
        }


        //
        // GET: /Design/

        /// <summary>
        /// Menu Site
        /// </summary>
        /// <returns>Menu</returns>
        public ActionResult Menu()
        {
            return PartialView();
        }

        /// <summary>
        /// Top movie 
        /// </summary>
        /// <returns>5 result</returns>
        public ActionResult Banner()
        {
            var model = db.Phims.OrderBy(s => s.PhimId).Take(6).ToList();
            return PartialView(model);
        }

        /// <summary>
        /// tim kiem
        /// </summary>
        /// <returns>action to timkiem</returns>
        public ActionResult Timkiem()
        {
            return PartialView();
        }

        /// <summary>
        /// Banner right
        /// </summary>
        /// <returns>Resule</returns>
        public ActionResult BannerRight()
        {
            return PartialView();
        }

        public ActionResult Footer() 
        {
            return PartialView();
        }
    }
}
