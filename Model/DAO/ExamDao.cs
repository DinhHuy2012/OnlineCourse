using Model.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ExamDao
    {
        OnlineCourseDbContext context = null;
        public ExamDao()
        {
            context = new OnlineCourseDbContext();
        }
        public long Insert(Exam entity)
        {

            context.Exams.Add(entity);
            context.SaveChanges();
            return entity.Id;


        }
        public bool Delete(int Id)
        {
            try
            {
                var acc = context.Exams.Find(Id);
                context.Exams.Remove(acc);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<Exam> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Exam> model = context.Exams;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) ||
                x.ProductID.ToString().Contains(searchString));
            }
            return model.OrderByDescending(x => x.Id).ToPagedList(page, pageSize);
        }

        public Exam ViewDetail(int id)
        {
            return context.Exams.Find(id);
        }
        public bool Update(Exam entity)
        {
            try
            {
                var exam = context.Exams.Find(entity.Id);
                exam.Name = entity.Name;
                exam.Code = entity.Code;
                exam.MetaTitle = entity.MetaTitle;
                exam.QuestionList = entity.QuestionList;
                exam.AnswerList = entity.AnswerList;
                exam.ProductID = entity.ProductID;
                exam.StartDate = entity.StartDate;
                exam.EndDate = entity.EndDate;
                exam.TotalScore = entity.TotalScore;
                exam.Time = entity.Time;
                exam.TotalQuestion = entity.TotalQuestion;
                exam.QuestionEssay = entity.QuestionEssay;
                exam.UserList = entity.UserList;
                exam.ScoreList = entity.ScoreList;

                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }
        public List<Exam> ListAllExam()
        {
            return context.Exams.Where(x => x.Status == true).OrderByDescending(x => x.Id).ToList();
        }


        public List<Exam> ListByType(string searchString, string Type)
        {
            IOrderedQueryable<Exam> model = context.Exams;
            if (Type == "0")
            {
                if (!string.IsNullOrEmpty(searchString))
                    return model.Where(x => x.Name.ToString().Contains(searchString)).Where(x => x.Status == true).OrderByDescending(x => x.StartDate).ToList();
                else
                {
                    return model.Where(x => x.Status == true).OrderByDescending(x => x.StartDate).ToList();
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    model = model.Where(x => x.Name.ToString().Contains(searchString)).Where(x => x.Status == true).OrderByDescending(x => x.StartDate);
                    return model.Where(x => x.Type == Type).ToList();
                }
                return context.Exams.Where(x => x.Type == Type).ToList();
            }



        }
    }
}
