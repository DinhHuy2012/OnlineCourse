using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Model
{
    [Table("Blog")]

    public  class Blog
    {

        public long Id { get; set; }

        [StringLength(500)]
        public string MetaTitle { get; set; }
        [StringLength(500)]
        public string Name { get; set; }

        [StringLength(500)]
        public string Title { get; set; }
        public long UserID { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }
        public DateTime PublishedDate { get; set;}
        public DateTime? LastModified { get; set; }

        public bool Status { get; set; }

        [StringLength(500)]
        public string ImageBlog { get; set; }

        public long? CategoryBlogId { get; set; }
        public long? Likes { get; set; }
        public long? Views { get; set; }

    }
}
