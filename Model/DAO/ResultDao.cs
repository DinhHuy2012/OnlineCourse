using Model.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ResultDao
    {
        OnlineCourseDbContext context = null;
        public ResultDao()
        {
            context = new OnlineCourseDbContext();
        }

        public Result GetByUserExamID(long userID, long examID)
        {
            return context.Results.SingleOrDefault(x => x.UserID == userID && x.ExamID == examID);
        }

        public bool Insert(Result result)
        {

            context.Results.Add(result);
            context.SaveChanges();
            return true;
        }
        public bool Update(Result entity)
        {
            try
            {
                var result = GetByUserExamID(entity.UserID, entity.ExamID);
                result.ResultQuiz = entity.ResultQuiz;
                result.ResultEssay = entity.ResultEssay;
                result.FinishTimeEssay = entity.FinishTimeEssay;
                result.FinishTimeQuiz = entity.FinishTimeQuiz;
                result.Status = entity.Status;
                result.Score = entity.Score;

                context.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
          
        }
    }
}
