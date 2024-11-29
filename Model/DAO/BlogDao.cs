using Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class BlogDao
    {

        OnlineCourseDbContext context = null;
        public BlogDao()
        {
            context = new OnlineCourseDbContext();
        }

        public List<Blog> ListAllBlog()
        {

            return context.Blogs.Where(x => x.Status == true).OrderByDescending(x => x.Id).ToList();
        }

        public Blog ViewDetail(long id)
        {

            return context.Blogs.Find(id);
        }
        public long Insert(Blog entity)
        {
            context.Blogs.Add(entity);
            context.SaveChanges();
            return entity.Id;
        }
    }
}
