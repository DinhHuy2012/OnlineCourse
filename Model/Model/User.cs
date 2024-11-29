namespace Model.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {
        public long Id { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        [StringLength(32)]
        public string Password { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(350)]
        public string Address { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        [StringLength(20)]
        public string Phone { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }

        [StringLength(250)]
        public string ProductList { get; set; }
        public int Role { get; set; }


        [StringLength(350)]
        public string Avatar { get; set; }

        public DateTime? LastLogin { get; set; }

        [StringLength(1000)]
        public string AboutMe { get; set; }

        public string UrlFacebook { get; set; }

        public string UrlYoutube { get; set; }
        public string UrlInstagram { get; set; }

        [StringLength(200)]

        public string Education { get; set; }







    }
}
