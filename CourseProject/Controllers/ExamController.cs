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
    public class ExamController : BaseController
    {
        // GET: Exam
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Category(string tim_kiem, string Type)
        {
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }

            ViewBag.Category = Type;
            ViewBag.CategoryID = new ProductCategoryDao().ListAll();


            var model = new ExamDao().ListByType(tim_kiem, Type);


            return View(model);
        }
        public ActionResult Detail(long id)
        {

            ViewBag.CategoryID = new ProductCategoryDao().ListAll();
            var usersession = (UserLogin)Session[CommonConstants.USER_SESSION]; // Giả sử đây là cách bạn lấy user session.
            if (usersession != null)
            {
                var dao = new AccountDao();
                var items = dao.GetUserById(Convert.ToInt16(usersession.Id)); // Lấy thông tin user.
                ViewBag.Items = items; // Thêm vào ViewBag để sử dụng trong view.
            }
            try
            {
                var dao = new ExamDao().ViewDetail(Convert.ToInt16(id));
                ViewBag.ExamQuestion = new QuestionDao().ListExamQuestion(dao.QuestionList);
                ViewBag.Result = new ResultDao().GetByUserExamID(usersession.Id, dao.Id);
                ViewBag.Msnv = usersession.UserName;
                ViewBag.userID = usersession.Id;
                if (!dao.UserList.Contains("*" + usersession.Id.ToString() + "*"))
                {
                    return Redirect("/trang-chu");
                }
                return View(dao);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return View();
            }



        }

        [HttpPost]
        public JsonResult AddResult(long examid, long userid)
        {
            try
            {
                var dao = new ResultDao();
                Result result = new Result();

                result.ExamID = examid;
                result.UserID = userid;
                result.Status = false;
                result.ResultQuiz = "";
                result.StartDateQuiz = DateTime.Now.ToShortDateString();
                result.StartTimeQuiz = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
                result.Score = "0";

                bool addResult = dao.Insert(result);
                if (!addResult)
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



        [HttpPost]
        public JsonResult UpdateResult(long examid, long userid,string resultessay,string resultquiz)
        {
            try
            {
                var dao = new ResultDao();
                Result result = new Result();

                result.ExamID = examid;
                result.UserID = userid;
                result.ResultQuiz = resultquiz;
                result.ResultEssay = resultessay;

                result.FinishTimeEssay = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
                result.FinishTimeQuiz = DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString();
                result.Score = "";
                result.Status = true;


                bool addResult = dao.Update(result);
                if (!addResult)
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
    }
}