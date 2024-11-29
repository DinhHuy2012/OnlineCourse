using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Model
{
    [Table("BlogComment")]

    public class BlogComment
    {
        public long Id { get; set; }

        [StringLength(5000)]
        public string CommentMsg { get; set; }
        public DateTime CommentDate { get; set; }

        public long? BlogID { get; set; }
        public long? UserID { get; set; }
        public long? ParentID { get; set; }

    }
}
