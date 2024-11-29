using OnlineCourse.Areas.Admin.Models;
using System.Web.Mvc;
using Model.DAO;
using OnlineCourse.Common;

namespace OnlineCourse.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Index(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                var result = dao.Login(model.UserName, model.Password);// Encrytor.MD5Hash(model.Password)
                if (result == 1)
                {
                    var user = dao.GetByUsername(model.UserName);
                    var usersession = new UserLogin();
                    usersession.UserName = user.UserName;
                    usersession.Id = user.Id;
                    Session.Add(CommonConstants.USER_SESSION, usersession);
                    return RedirectToAction("Index", "Home");

                }
                else if(result == 0) 
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại ");
                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Tài khoản đang bị khóa  ");
                }
                else if (result == -2)
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng  ");
                }
                else if (result == -3)
                {
                    ModelState.AddModelError("", "Tài khoản không có quyền truy cập ");

                }

            }
            return View("Index");

        }
    }
}
