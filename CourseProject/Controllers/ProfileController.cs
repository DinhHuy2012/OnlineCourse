using CourseProject.Models;
using Model.DAO;
using Model.Model;
using OnlineCourse.Common;
using OnlineCourse.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseProject.Controllers
{
    public class ProfileController : BaseController
    {
        public ActionResult Index()
        {
            return View();
        }
        // GET: Profile
        public ActionResult Profile()
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var userSession = (UserLogin)Session[CommonConstants.USER_SESSION]; 
            if (userSession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(userSession.Id)); 
                ViewBag.Items = items;

                // Khởi tạo model và gán giá trị cho SocialMedia
                var model = new UserProfileViewModel
                {
                    SocialMedia = new SocialMediaInfo // Khởi tạo đối tượng SocialMedia trước
                    {
                        UrlInstagram = items.UrlInstagram, // Gán giá trị cho UrlInstagram đúng cách.
                        UrlFacebook = items.UrlFacebook,
                        UrlYoutube = items.UrlYoutube
                    },
                    ChangeInfo = new ChangeInfoModel
                    {
                        Name = items.Name,
                        Address = items.Address,
                        Phone = items.Phone,
                        Education = items.Education,
                        AboutMe = items.AboutMe,
                        CreateDate = DateTime.Now,
                        
                    }
                };
                return View(model); // Trả về view với model.
            }

            return View(); // Trả về view mặc định nếu không tìm thấy userSession.
        }

        [HttpPost]
        public ActionResult ChangePassword(UserProfileViewModel model)
        {
            var userSession = (UserLogin)Session[CommonConstants.USER_SESSION];


            var dao = new AccountDao();
            if (model.ChangePassword.CurrentPassword == null)
            {
                TempData["ErrorMessage"] = "Mật khẩu không được để trống";
                return RedirectToAction("Profile");
            }
            if (model.ChangePassword.NewPassword == null)
            {
                TempData["ErrorMessage"] = "mật khẩu mới không được để trống";
                return RedirectToAction("Profile");
            }
            if (model.ChangePassword.ConfirmPassword == null)
            {
                TempData["ErrorMessage"] = "Nhập lại mật khẩu không được để trống";
                return RedirectToAction("Profile");
            }
            bool isCurrentPasswordValid = dao.VerifyPassword(userSession.Id, model.ChangePassword.CurrentPassword);
            if (!isCurrentPasswordValid)
            {
                TempData["ErrorMessage"] = "Mật khẩu hiện tại không đúng ! .";
                return RedirectToAction("Profile");
            }

            if (model.ChangePassword.NewPassword != model.ChangePassword.ConfirmPassword)
            {
                TempData["ErrorMessage"] = "Mật khẩu mới và xác thực mật khẩu mới không khớp !";
                return RedirectToAction("Profile");
            }

            var updateResult = dao.UpdatePassword(userSession.Id, model.ChangePassword.NewPassword);
            if (updateResult == 0)
            {
                TempData["SuccessMessage"] = "Chúc mừng bạn đổi mật khẩu thành công .";
                return RedirectToAction("Profile");
            }
            else
            {
                TempData["ErrorMessage"] = "Password update failed. Please try again.";
                return RedirectToAction("Profile");
            }
        }
        [HttpPost]

        public ActionResult UpdateSocialMedia(UserProfileViewModel model)
        {

            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
               

                ViewBag.Items = items;
            }
            if (ModelState.IsValid)
            {

                var dao = new AccountDao();

                var userSession = (UserLogin)Session[CommonConstants.USER_SESSION];   
                if (usersession != null)
                {
                    var editResult = dao.UpdateSocialMediaInfo(userSession.Id, model.SocialMedia.UrlFacebook, model.SocialMedia.UrlInstagram, model.SocialMedia.UrlYoutube);
                    if (editResult == 0)
                    {
                        TempData["SuccessMessageSocial"] = "Cập nhật thông tin mạng xã hội thành công .";
                        return RedirectToAction("Profile", "Profile"); // Hoặc một trang phù hợp sau khi đăng ký thành công

                    }
                    else
                    {
                        ModelState.AddModelError("", "Cập nhật thông tin mạng xã hội thất bại. Vui lòng thử lại. ");

                    }
                }
                else
                {
                    return RedirectToAction("Login");

                }



            }
            return View("Profile");

        }


        [HttpPost]
        public ActionResult UpdateInfo(UserProfileViewModel model)
        {

            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.


                ViewBag.Items = items;
            }
            if (ModelState.IsValid)
            {

                var dao = new AccountDao();

                var userSession = (UserLogin)Session[CommonConstants.USER_SESSION];
                if (usersession != null)
                {
                    var editResult = dao.UpdateInfo(userSession.Id, model.ChangeInfo.Name, model.ChangeInfo.Phone, model.ChangeInfo.Address, model.ChangeInfo.AboutMe, model.ChangeInfo.Education);
                    if (editResult == 0)
                    {
                        TempData["SuccessMessageInfo"] = "Cập nhật thông tin thành công .";
                        return RedirectToAction("Profile", "Profile"); // Hoặc một trang phù hợp sau khi đăng ký thành công

                    }
                    else if (editResult == -3)
                    {
                        TempData["ErrorMessageInfo"] = "Số điện thoại này đã tồn tại !.";
                        return RedirectToAction("Profile", "Profile"); // Hoặc một trang phù hợp sau khi đăng ký thành công


                    }
                    else
                    {
                        TempData["ErrorMessageInfo"] = "Cập nhật thông tin thất bại. Vui lòng thử lại.";
                        return RedirectToAction("Profile", "Profile"); // Hoặc một trang phù hợp sau khi đăng ký thành công

                    }
                }
                else
                {
                    return RedirectToAction("Login");

                }

            }
            return View("Profile");

        }


        public ActionResult PersonalPage(long? id)
        {
            var daoBlogCateogry = new BlogCategoryDao();
            ViewBag.BlogCategory = daoBlogCateogry.ListAllBlogCategory();
            var daouser = new AccountDao();
            ViewBag.AccountID = daouser.GetAll();
            var daoblog = new BlogDao();
            ViewBag.ListBlog = daoblog.ListAllBlog();
            if (id == null)
            {
                return RedirectToAction("Error", "Home");
            }

            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; 

            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Get user information.
                ViewBag.Items = items; // Add to ViewBag for use in the view.
            }
            else
            {
                // Redirect to the login page if usersession is null
                return RedirectToAction("Login", "User");
            }

            // Retrieve user information using the id parameter
            var user = new AccountDao().ViewDetail((long)id);

            return View(user);
        }
        [HttpGet]
        public ActionResult AddNewBlog()
        {

            var daoBlogCateogry = new BlogCategoryDao();
            ViewBag.BlogCategory = daoBlogCateogry.ListAllBlogCategory();
             
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION];

            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Get user information.
                ViewBag.Items = items; // Add to ViewBag for use in the view.
            }
            else
            {
                // Redirect to the login page if usersession is null
                return RedirectToAction("Login", "User");
            }




            return View();
        }

        [HttpPost]
        [ValidateInput(false)] // Tắt kiểm tra đầu vào cho toàn bộ action

        public ActionResult AddNewBlog(Blog model)
        {
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION];

            if (ModelState.IsValid)
            {

                var dao = new BlogDao();
                if (usersession != null)
                {
                    model.UserID = usersession.Id;
                }
                else
                {
                    return RedirectToAction("Login", "User");
                }
                model.PublishedDate = DateTime.Now;
                model.Status = false;

                model.UserID = Convert.ToInt16(model.UserID);

                // Lưu blog mới
                long id = dao.Insert(model);
                if (id > 0)
                {
                    TempData["SuccessMessage"] = "Thêm blog thành công ,Chờ Xét Duyệt xin cảm ơn bạn đã đóng góp cho cộng đồng ! .";

                    return RedirectToAction("AddNewBlog", "Profile");
                }
                else
                {

                    TempData["ErrorMessage"] = "Thêm blog không thành công! .";
                    return RedirectToAction("AddNewBlog", "Profile"); // Hoặc một trang phù hợp sau khi đăng ký thành công
                }
            }

            var daoBlogCateogry = new BlogCategoryDao();
            ViewBag.BlogCategory = daoBlogCateogry.ListAllBlogCategory();
            var daouser = new AccountDao();
            ViewBag.AccountID = daouser.GetAll();
            var daoblog = new BlogDao();
            ViewBag.ListBlog = daoblog.ListAllBlog();
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();

            return View(model);
        }

    }

}



