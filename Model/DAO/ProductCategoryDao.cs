using Model.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProductCategoryDao
    {
        OnlineCourseDbContext db = null;
        public ProductCategoryDao()
        {
            db = new OnlineCourseDbContext();
        }
        public List<ProductCategory> ListAll()
        {
            return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();

        }
        public IEnumerable<ProductCategory> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ProductCategory> model = db.ProductCategories;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) ||
                x.Name.Contains(searchString) || x.MetaTitle.Contains(searchString));
            }
            return model.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToPagedList(page, pageSize);
        }
        public ProductCategory ViewDetail(long id)
        {   
            return db.ProductCategories.Find(id);
        }
        public bool Delete(int Id)
        {
            try
            {
                var acc = db.Questions.Find(Id);
                db.Questions.Remove(acc);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public long Insert(ProductCategory entity)
        {

            db.ProductCategories.Add(entity);
            db.SaveChanges();
            return entity.Id;


        }


    }
}
