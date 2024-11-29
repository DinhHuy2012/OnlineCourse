using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Entity;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using Model.Model;
using PagedList;
using System.Runtime.Remoting.Contexts;


namespace Model.DAO
{
    public class ProductDao
    {

        OnlineCourseDbContext db = null;
        public ProductDao()
        {
            db = new OnlineCourseDbContext();
        }
        public IEnumerable<Product> ListAllPaging(long cateID, string searchString, int page, int pagesize)
        {
            IQueryable<Product> model = db.Products;
            if (cateID != -1)
            {
                model = model.Where(x => x.CategoryID == cateID);
            }
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.MetaTitle.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pagesize);
        }
        public bool Delete(int Id)
        {
            try
            {
                var pd = db.Products.Find(Id);
                db.Products.Remove(pd);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public long Insert(Product entity)
        {
            db.Products.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public Product ViewDetail(long id)
        {

            return db.Products.Find(id);
        }
        public bool Update(Product entity)
        {
            try
            {
                var product = db.Products.Find(entity.Id);
                product.Name = entity.Name;
                product.Code = entity.Code;
                product.MetaTitle = entity.MetaTitle;
                product.Description = entity.Description;
                product.Detail = entity.Detail;
                product.Image = entity.Image;
                product.ListType = entity.ListType;
                product.ListFile = entity.ListFile;
                product.CategoryID = entity.CategoryID;

                db.SaveChanges();
                return true;

            }
            catch (Exception)
            {
                return false;

            }
        }
        public List<Product> ListAllProduct()
        {
            return db.Products.Where(x => x.Status == true).OrderByDescending(x => x.Id).ToList();
        }
        public List<Product> ListByCategoryID(string searchString, long CategoryID)
        {
            IOrderedQueryable<Product> model = db.Products;
            if (CategoryID == 0)
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    return model.Where(x => x.Name.Contains(searchString) || x.Description.Contains(searchString)).Where(x => x.Status == true).OrderByDescending(x => x.CreateDate).ToList();
                }
                else
                {
                    return model.Where(x => x.Status == true).OrderByDescending(x => x.CreateDate).ToList();
                }

            }
            else
            {
                if (!string.IsNullOrEmpty(searchString))
                {
                    return model.Where(x => x.Name.Contains(searchString) || x.Description.Contains(searchString)).Where(x => x.Status == true && x.CategoryID == CategoryID).OrderByDescending(x => x.CreateDate).ToList();
                }
                else
                {
                    return model.Where(x => x.Status == true && x.CategoryID == CategoryID).OrderByDescending(x => x.CreateDate).ToList();
                }
            }


        }
        public List<Product> ListAll()
        {
            return db.Products.Where(x => x.Status == true).OrderByDescending(x => x.Id).ToList();
        }

    }
}
