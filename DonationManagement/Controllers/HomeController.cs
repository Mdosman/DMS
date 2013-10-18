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
            ViewBag.Message = "Donation Management System - Tracking donations for your organization.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Please Contact us at help@DMS.org for detailed information.";

            return View();
        }
    }
}
