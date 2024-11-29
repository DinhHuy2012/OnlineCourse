using CourseProject.Models;
using Model.DAO;
using Model.Model;
using OnlineCourse.Common;
using OnlineCourse.Controllers;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseProject.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();

            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                var result = dao.LoginForUser(model.UserName, model.Password);// Encrytor.MD5Hash(model.Password)
                if (result == 1)
                {
                    var user = dao.GetByUsername(model.UserName);
                    var usersession = new UserLogin();
                    usersession.UserName = user.UserName;
                    usersession.Email = user.Email;
                    usersession.Address = user.Address;
                    usersession.Phone = user.Phone;
                    usersession.Avartar = user.Avatar;
                    usersession.Name = user.Name;
                    usersession.CreateDate = user.CreateDate.Value;
                    usersession.Role = user.Role;
                    usersession.Id = user.Id;
                    usersession.UrlFacebook = user.UrlFacebook;
                    usersession.UrlInstagram = user.UrlInstagram;
                    usersession.UrlYoutube = user.UrlYoutube;
                    Session.Add(CommonConstants.USER_SESSION, usersession);
 ;

                    return RedirectToAction("Index", "Home");

                }
                else if (result == 0)
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


            }
            return View("Login");

        }
        [HttpPost]
        public JsonResult UpdateAvatar(string id, string image)
        {
            try
            {
                var dao = new AccountDao();
                // Chuyển đổi userid từ kiểu string sang int
                // Tìm người dùng theo ID
                User user = dao.ViewDetail(Convert.ToInt16(id));

                if (user != null)
                {
                    // Cập nhật đường dẫn mới cho ảnh đại diện
                    user.Avatar = image;
                    user.ModifiedBy = "User change avatar"; // Cập nhật người thực hiện thay đổi
                    user.ModifiedDate = DateTime.Now; // Cập nhật thời gian thay đổi

                    // Lưu thay đổi vào cơ sở dữ liệu
                    bool editResult = dao.Update(user);

                    if (editResult)
                    {
                        return Json(new { status = true });
                    }
                    else
                    {
                        return Json(new { status = false });
                    }
                }
                else
                {
                    return Json(new { status = false }); // Trả về false nếu không tìm thấy người dùng
                }
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ, ví dụ: log lỗi
                return Json(new
                {
                    status = false
                });
            }
        }
        [HttpGet]
        public ActionResult SignUp()
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            return View();

        }
        [HttpGet]
        public ActionResult ForgotPassword()
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            return View();

        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp(SignUpModel model)
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                var user = new User()
                {
                    UserName = model.UserName,
                    Email = model.Email,
                    Password = model.Password,
                    CreateDate = DateTime.Now,
                    Status = true,  
                    CreateBy = "User SignUp",
                    Role = 2,
                    LastLogin = DateTime.Now
               

                };

                // Gọi phương thức SignUp và xử lý dựa trên giá trị trả về
                var result = dao.SignUp(user);

                switch (result)
                {
                    case 0: // Đăng ký thành công
                        ViewBag.Success = "Chúc mừng bạn đã đăng kí thành công";
                        return RedirectToAction("Index", "Home"); // Hoặc một trang phù hợp sau khi đăng ký thành công

                    case -1: // Username đã tồn tại
                        ModelState.AddModelError("", "Tài khoản đã tồn tại");
                        break;

                    case -2: // Email đã tồn tại
                        ModelState.AddModelError("", "Email đã tồn tại");
                        break;

                    default: // Các trường hợp khác (nếu có)
                        ModelState.AddModelError("", "Đăng kí thất bại");
                        break;
                }
            }
            // Trả về view SignUp với thông tin đã nhập để người dùng có thể chỉnh sửa nếu cần
            return View("SignUp", model);
        }










        [HttpPost]
        public ActionResult Logout()
        {
            if (Session["USER_SESSION"] != null)
            {
                var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
                if (usersession != null)
                {
                    var dao = new AccountDao();
                    var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                    ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.

                    items.LastLogin = DateTime.Now;
                    dao.UpdateLogout(items); // Giả sử bạn có phương thức này trong AccountDao để cập nhật người dùng
                }

                Session.Remove("USER_SESSION");
            }

            // Chuyển hướng người dùng đến trang đăng nhập hoặc trang chính
            return RedirectToAction("Index", "Home"); // Hoặc chuyển hướng đến trang đăng nhập
        }



    }
}