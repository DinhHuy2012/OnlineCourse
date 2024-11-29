using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CourseProject.Models
{
    public class UserProfileViewModel
    {
        public ChangePasswordModel ChangePassword { get; set; }
        public SocialMediaInfo SocialMedia { get; set; }

        public ChangeInfoModel ChangeInfo { get; set; }

    }
}