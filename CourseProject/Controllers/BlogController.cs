using Model.DAO;
using Model.Model;
using OnlineCourse.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CourseProject.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index()
        {
            var daoBlogCateogry = new BlogCategoryDao();
            ViewBag.BlogCategory = daoBlogCateogry.ListAllBlogCategory();
            var daouser = new AccountDao();
            ViewBag.AccountID = daouser.GetAll();
            var daoblog = new BlogDao();
            ViewBag.ListBlog = daoblog.ListAllBlog();

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

        public ActionResult Detail(long id)
        {
            var daoBlogCateogry = new BlogCategoryDao();
            var daoblog = new BlogDao();
            var daouser = new AccountDao();

            ViewBag.BlogCategory = daoBlogCateogry.ListAllBlogCategory();
            ViewBag.AccountID = daouser.GetAll();
            ViewBag.ListBlog = daoblog.ListAllBlog();

            ViewBag.CategoryID = new ProductCategoryDao().ListAll();

            var blog = new BlogDao().ViewDetail(id);

            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }
            if (usersession != null)
            {
                ViewBag.UserID = usersession.Id;
                ViewBag.ListBlogComment = new BlogCommentDao().ListBlogCommentViewModel(0, id);
            }
            else
            {
                // Chuyển hướng đến trang đăng nhập nếu sessionUser là null
                return RedirectToAction("Login", "User");
            }

            return View(blog);
        }

        [HttpPost]
        public JsonResult AddNewComment(long blogid, long userid, long parentid, string commentmsg)
        {
            try
            {
                var dao = new BlogCommentDao();
                BlogComment comment = new BlogComment();

                comment.CommentMsg = commentmsg;
                comment.BlogID = blogid;
                comment.UserID = userid;
                comment.ParentID = parentid;
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

        [ChildActionOnly]
        public ActionResult _ChildBlogComment(long parentid, long blogid)   
        {
            var daouser = new AccountDao();
            ViewBag.AccountID = daouser.GetAll();
            var data = new BlogCommentDao().ListBlogCommentViewModel(parentid, blogid);
            var sessionuser = (UserLogin)Session[CommonConstants.USER_SESSION];
            for (int k = 0; k < data.Count; k++)
            {
                data[k].UserID = sessionuser.Id;
            }
            return PartialView("~/Views/Shared/_ChildBlogComment.cshtml", data);
        }


        public ActionResult GetBlogComment(long blogid)
        {
            var daouser = new AccountDao();
            ViewBag.AccountID = daouser.GetAll();
            var data = new BlogCommentDao().ListBlogCommentViewModel(0, blogid);
            return PartialView("~/Views/Shared/_ChildBlogComment.cshtml", data);
        }
    }
}