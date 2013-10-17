using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DonationManagement.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Index - Dashboard";
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Title = "About DMS";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Title = "DMS Contact Page";

            return View();
        }
    }
}
