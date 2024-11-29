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
    public class ProductController : BaseController
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Category(string search, long cateID)
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }

            var category = new ProductCategoryDao().ViewDetail(cateID);
            ViewBag.Category = category;
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var model = new ProductDao().ListByCategoryID(search, cateID);   


            return View(model);
        }

        public ActionResult Detail(long id, long detailid)
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }
            var product = new ProductDao().ViewDetail(id);
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();

            var sessionUser = Session[CommonConstants.USER_SESSION] as UserLogin;
            if (sessionUser != null)
            {
                ViewBag.UserID = sessionUser.Id;
                ViewBag.ListComment = new CommentDao().ListCommentViewModel(0, id);
            }
            else
            {
                // Chuyển hướng đến trang đăng nhập nếu sessionUser là null
                return RedirectToAction("Login", "User");
            }

            ViewBag.DetailID = detailid.ToString();
            return View(product);
        }

        [ChildActionOnly]
        public ActionResult _ChildComment(long parentid, long productid)
        {
            var data = new CommentDao().ListCommentViewModel(parentid, productid);
            var sessionuser = (UserLogin)Session[CommonConstants.USER_SESSION];
            for (int k = 0; k < data.Count; k++)
            {
                data[k].UserID = sessionuser.Id;
            }
            return PartialView("~/Views/Shared/_ChildComment.cshtml", data);
        }
        [HttpPost]
        public JsonResult AddNewComment(long productid, long userid, long parentid, string commentmsg, string rate)
        {
            try
            {
                var dao = new CommentDao();
                Comment comment = new Comment();

                comment.CommentMsg = commentmsg;
                comment.ProductID = productid;
                comment.UserID = userid;
                comment.ParentID = parentid;
                comment.Rate = Convert.ToInt16(rate);
                comment.CommentDate = DateTime.Now;

                bool addcomment = dao.Insert(comment);
                if (addcomment == true)
                {
                    return Json(new
                    {
                        status = true
                    });
                }
                else
                {
                    return Json(new
                    {
                        status = false
                    });
                }
            }
            catch
            {
                return Json(new
                {
                    status = false
                });
            }
        }
        public ActionResult GetComment(long productid)
        {
            var data = new CommentDao().ListCommentViewModel(0, productid);
            return PartialView("~/Views/Shared/_ChildComment.cshtml", data);
        }
    }
}