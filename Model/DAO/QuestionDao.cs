using Model.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class QuestionDao
    {
        OnlineCourseDbContext context = null;
        public QuestionDao()
        {
            context = new OnlineCourseDbContext();
        }
        public long Insert(Question entity)
        {

            context.Questions.Add(entity);
            context.SaveChanges();
            return entity.Id;
                

        }
        public bool Delete(int Id)
        {
            try
            {
                var acc = context.Questions.Find(Id);
                context.Questions.Remove(acc);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<Question> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Question> model = context.Questions;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) ||
                x.Name.Contains(searchString) || x.Content.Contains(searchString));
            }
            return model.OrderByDescending(x => x.Id).ToPagedList(page, pageSize);
        }

        public Question ViewDetail(int id)
        {
            return context.Questions.Find(id);
        }
        public bool Update(Question entity)
        {
            try
            {
                var question = context.Questions.Find(entity.Id);
                question.Name = entity.Name;

                question.Content = entity.Content;
                question.Answer = entity.Answer;
                question.ProductID = entity.ProductID;
              

                context.SaveChanges();
                return true;


            }
            catch (Exception ex)
            {
                return false;
            }

        }
  
        public List<Question> GetAll()
        {
            return context.Questions.ToList();
        }
     
        public List<Question> ListExamQuestion(string pList)
        {
            return context.Questions.Where( x => pList.Contains("*" + x.Id.ToString() + "*")).ToList();
        }

      
    }
}
