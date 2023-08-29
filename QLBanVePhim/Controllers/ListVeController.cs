using QLBanVePhim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLBanVePhim.Controllers
{
    public class ListVeController : Controller
    {
        public ActionResult AddtoCart(int id = 0)
        {
            ListDatVe.Cart.ThemXoaGio(id);
            String response = "fnUpdateCartInfo('" + ListDatVe.Cart.Count + "', '" + ListDatVe.Cart.Amount.ToString("0.##") + "')";

            //String.Format("fnUpdateCartInfo({0}, {1})",
            //GioHang.Cart.Count, );
            return Content(response);
        }

    }
}
