using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CourseProject.Models
{
    public class ChangePasswordModel
    {

        [Required(ErrorMessage = "Mời bạn nhập CurrentPassword")]

        public string CurrentPassword { get; set; }




        [Required(ErrorMessage = "Mời bạn nhập NewPassword")]
        public string NewPassword { get; set; }




        [Required(ErrorMessage = "Mời bạn nhập ConfirmPassword")]


        [Compare("NewPassword", ErrorMessage = "The new password and confirmation do not match.")]
            public string ConfirmPassword { get; set; }
        



    }
}