using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CourseProject
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");


            routes.MapRoute(
            name: "Error",
            url: "khong-tim-thay",
            defaults: new { controller = "Error", action = "Error404", id = UrlParameter.Optional },
            namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
             name: "Home",
             url: "trang-chu",
             defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
             namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
             name: "Product Category",
              url: "khoa-hoc/{metatitle}-{cateID}",
             defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
             namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
          name: "Exam Category",
           url: "kiem-tra/{metatitle}-{Type}",
          defaults: new { controller = "Exam", action = "Category", id = UrlParameter.Optional },
          namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
       name: "Exam Detail",
        url: "chi-tiet-kiem-tra/{metatitle}-{id}",
       defaults: new { controller = "Exam", action = "Detail", id = UrlParameter.Optional },
       namespaces: new[] { "CourseProject.Controllers" });
            routes.MapRoute(
             name: "Product Detail",
              url: "chi-tiet/{metatitle}-{id}-{detailid}",
             defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
             namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
             name: "Profile PersonalPage",
              url: "trang-ca-nhan/{id}",
              defaults: new { controller = "Profile", action = "PersonalPage", id = UrlParameter.Optional },
             namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
             name: "User SignUp",
              url: "dang-ki",
             defaults: new { controller = "User", action = "SignUp", id = UrlParameter.Optional },
             namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
            name: "User ForgotPassword",
             url: "quen-mat-khau",
            defaults: new { controller = "User", action = "ForgotPassword", id = UrlParameter.Optional },
            namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
           name: "Blog Index",
            url: "bai-chia-se",
           defaults: new { controller = "Blog", action = "Index", id = UrlParameter.Optional },
           namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
           name: "Blog Detail",
            url: "chi-tiet-blog/{metatitle}-{id}",
           defaults: new { controller = "Blog", action = "Detail", id = UrlParameter.Optional },
           namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
          name: "Profile AddNewBlog",
           url: "viet-blog",
          defaults: new { controller = "Profile", action = "AddNewBlog", id = UrlParameter.Optional },
          namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
            name: "User Login",
             url: "dang-nhap",
            defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
            namespaces: new[] { "CourseProject.Controllers" });

            routes.MapRoute(
               name: "Profile Profile",
                url: "thong-tin-ca-nhan",
                defaults: new { controller = "Profile", action = "Profile", id = UrlParameter.Optional },
               namespaces: new[] { "CourseProject.Controllers" });


            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "CourseProject.Controllers" });


        }
    }
}
