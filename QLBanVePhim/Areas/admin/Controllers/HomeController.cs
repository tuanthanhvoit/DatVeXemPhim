﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLBanVePhim.Areas.admin.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /admin/Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Menu() {
            return PartialView();
        }

        public ActionResult MenuLeft() {
            return PartialView();
        }

        public ActionResult Footer()
        {
            return PartialView();
        }
    }
}
