using Model.DAO;
using Model.Model;
using OnlineCourse.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OnlineCourse.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        //
        // GET: /Admin/User/

        public ActionResult Index(string searchString, int page = 1, int pageSize = 200)
        {
            var dao = new AccountDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new AccountDao().Delete(id);
            return RedirectToAction("Index");
        }


        [HttpPost]
        public JsonResult AddUserAjax(string username, string name, string password, string address, string email, string phone)
        {
            try
            {
                var dao = new AccountDao();

                User user = new User
                {
                    Password = password,
                    CreateDate = DateTime.Now,
                    UserName = username,
                    Name = name,
                    Address = address,
                    Email = email,
                    Phone = phone,
                    Status = true,
                    Role = 2
                };

                long id = dao.Insert(user);

                if (id > 0)
                {
                    return Json(new { status = true, message = "User added successfully" });
                }
                else
                {
                    return Json(new { status = false, message = "Failed to add user" });
                }
            }
            catch (Exception ex)
            {
                // Log the exception for debugging purposes
                Console.WriteLine(ex.Message);

                return Json(new { status = false, message = "Failed to add user", error = ex.Message });
            }
        }



        [HttpPost]
        public JsonResult UpdateUserAjax(string userid, string name, string address, string email, string phone)
        {
            try
            {
                var dao = new AccountDao();
                User user = new User();

                user = dao.ViewDetail(Convert.ToInt16(userid));

                user.Name = name;
                user.Address = address;
                user.Email = email;
                user.Phone = phone;


                bool editresult = dao.Update(user);

                if (editresult == true)
                {
                    return Json(new { status = true });
                }
                else
                {
                    return Json(new { status = false });
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



