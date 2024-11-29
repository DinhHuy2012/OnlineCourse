using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseProject.Controllers
{
    public class ErrorController : Controller
    {
        // GET: Error
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Error404()
        {
            var dao = new ProductCategoryDao();
            ViewBag.CategoryID = dao.ListAll();
            Response.StatusCode = 404; // Ensure proper status code is returned.

            return View();
        }
    }
}