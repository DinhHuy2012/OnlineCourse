using Model.Model;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class BlogCommentDao
    {
        OnlineCourseDbContext db = null;
        public BlogCommentDao()
        {
            db = new OnlineCourseDbContext();
        }

        public bool Insert(BlogComment entity)
        {

            db.BlogComments.Add(entity);
            db.SaveChanges();
            return true;
        }
        public List<BlogComment> ListBlogComment(long parentId, long blogId)
        {
            return db.BlogComments.Where(x => x.ParentID == parentId && x.BlogID == blogId).ToList();


        }
        public List<BlogCommentViewModel> ListBlogCommentViewModel(long parentId, long blogId)
        {
            var model = (from a in db.BlogComments
                         join b in db.Users
                             on a.UserID equals b.Id
                         where a.ParentID == parentId && a.BlogID == blogId

                         select new
                         {
                             ID = a.Id,
                             CommentMsg = a.CommentMsg,
                             CommentDate = a.CommentDate,
                             BlogID = a.BlogID,
                             UserID = a.UserID,
                             FullName = b.Name,
                             ParentID = a.ParentID,
                         }).AsEnumerable().Select(x => new BlogCommentViewModel()
                         {
                             Id = x.ID,
                             CommentMsg = x.CommentMsg,
                             CommentDate = x.CommentDate,
                             BlogID = x.BlogID,
                             UserID = x.UserID,
                             FullName = x.FullName,
                             ParentID = x.ParentID,
                         });
            return model.OrderByDescending(y => y.Id).ToList();
        }

    }
}
