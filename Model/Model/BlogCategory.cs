using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Model
{
    [Table("BlogCategory")]
    public class BlogCategory
    {
        public long Id { get; set; }    
        [StringLength(50)]
        public string Name { get; set; }
        public DateTime? CreateDate { get; set; }
    }
}
