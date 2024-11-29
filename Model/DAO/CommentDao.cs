using Model.Model;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CommentDao
    {
        OnlineCourseDbContext db = null;
        public CommentDao()
        {
            db = new OnlineCourseDbContext();
        }

        public bool Insert(Comment entity)
        {

            db.Comments.Add(entity);
            db.SaveChanges();
            return true;
        }
        public List<Comment> ListComment(long parentId, long productId)
        {
            return db.Comments.Where(x => x.ParentID == parentId && x.ProductID == productId).ToList();


        }
        public List<CommentViewModel> ListCommentViewModel(long parentId, long productId)
        {
            var model = (from a in db.Comments
                         join b in db.Users
                             on a.UserID equals b.Id
                         where a.ParentID == parentId && a.ProductID == productId

                         select new
                         {
                             ID = a.Id,
                             CommentMsg = a.CommentMsg,
                             CommentDate = a.CommentDate,
                             ProductID = a.ProductID,
                             UserID = a.UserID,
                             FullName = b.Name,
                             ParentID = a.ParentID,
                             Rate = a.Rate
                         }).AsEnumerable().Select(x => new CommentViewModel()
                         {
                             Id = x.ID,
                             CommentMsg = x.CommentMsg,
                             CommentDate = x.CommentDate,
                             ProductID = x.ProductID,
                             UserID = x.UserID,
                             FullName = x.FullName,
                             ParentID = x.ParentID,
                             Rate = x.Rate
                         });
            return model.OrderByDescending(y => y.Id).ToList();
        }

    }
}
