using Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class BlogCategoryDao
    {
        OnlineCourseDbContext context = null;
        public BlogCategoryDao()
        {
            context = new OnlineCourseDbContext();
        }

        public List<BlogCategory> ListAllBlogCategory()
        {

            return context.BlogCategories.ToList();
        }
    }
}
