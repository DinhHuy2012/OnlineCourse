using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineCourse.Common
{
    [Serializable]

    public class UserLogin
    {
        public long  Id { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }

        public string Email {  get; set; }
            
        public string Phone { get; set; }

        public string Avartar { get; set; }

        public DateTime CreateDate {  get; set; }

        public int Role {  get; set; }  

        public string UrlFacebook { get; set; }

        public string UrlInstagram { get; set; }

        public string UrlYoutube { get; set; }

        public string GroupID { get; set; }
    
    }
}