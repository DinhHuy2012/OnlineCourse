using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CourseProject.Models
{
    public class ForgotPasswordViewModel
    {

        [Required(ErrorMessage = "Mời bạn nhập email")]
        [EmailAddress]
        public string Email { get; set; }
    }
}