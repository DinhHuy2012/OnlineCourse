using Model.DAO;
using OnlineCourse.Common;
using OnlineCourse.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseProject.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            try
            {
                var dao = new ProductCategoryDao();
                ViewBag.CategoryID = dao.ListAll();
                var productdao = new ProductDao();
                ViewBag.HomeProducts = productdao.ListAllProduct();
                var examDao = new ExamDao();
                ViewBag.HomeExams = examDao.ListAllExam();

                var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
                if (usersession != null)
                {
                    var daoacc = new AccountDao();
                    var items = daoacc.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                    ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
                }

                return View();
            }
            catch (Exception ex)
            {
                return RedirectToAction("/khong-tim-thay");


            }

        }
    }

}