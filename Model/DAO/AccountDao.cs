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

    public class AccountDao

    {
        OnlineCourseDbContext context = null;
        public AccountDao()
        {
            context = new OnlineCourseDbContext();
        }
        public long Insert(User entity)
        {
            context.Users.Add(entity);
            context.SaveChanges();
            return entity.Id;


        }

        public bool UpdateLogout(User entity)
        {
            try
            {
                var user = context.Users.Find(entity.Id);
                user.LastLogin = DateTime.Now;

                context.SaveChanges();
                return true;


            }
            catch (Exception ex)
            {
                return false;
            }

        }

        public bool Update(User entity)
        {
            try
            {
                var user = context.Users.Find(entity.Id);
                user.Name = entity.Name;
                if (!string.IsNullOrEmpty(user.Password))
                {
                    user.Password = user.Password;

                }
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.ModifiedBy = entity.ModifiedBy;
                user.ModifiedDate = entity.ModifiedDate;
                user.Status = entity.Status;
                user.Phone = entity.Phone;


                context.SaveChanges();
                return true;


            }
            catch (Exception ex)
            {
                return false;
            }

        }
       

        /*  public User getItem(string email, string username)
          {
              return context.Users.FirstOrDefault(x => x.Email == email && x.Username == username);
          }*/
        public List<User> GetAll()
        {
            return context.Users.ToList();
        }
        public int Login(string username, string password)
        {
            var account = context.Users.SingleOrDefault(x => x.UserName == username);

            if (account == null)
            {
                return 0; // Username or email doesn't exist!
            }
            else if (account.Status == false)
            {
                return -1; // Account is disabled
            }
            else if (account.Password == password && account.Role == 1)
            {
                return 1; // Login successful
            }
            else if (account.Role != 1)
            {
                return -3;
            }
            else
            {
                return -2; // Incorrect password
            }
        }

        public int LoginForUser(string username, string password)
        {
            var account = context.Users.SingleOrDefault(x => x.UserName == username);

            if (account == null)
            {
                return 0; // Username or email doesn't exist!
            }
            else if (account.Status == false)
            {
                return -1; // Account is disabled
            }
            else if (account.Password == password)
            {
                return 1; // Login successful
            }

            else
            {
                return -2; // Incorrect password
            }
        }
        public bool Delete(int Id)
        {
            try
            {
                var acc = context.Users.Find(Id);
                context.Users.Remove(acc);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public User GetByUsername(string username)
        {
            return context.Users.SingleOrDefault(x => x.UserName == username);

        }
        public User FindByEmail(string email)
        {
            return context.Users.SingleOrDefault(x => x.Email == email);

        }
        public User GetUserById(int id)
        {
            return context.Users.SingleOrDefault(x => x.Id == id);

        }
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<User> model = context.Users;
            model = model.Where(x => x.UserName != "admin");
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) ||
                x.Name.Contains(searchString) || x.Email.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public User ViewDetail(long id)
        {
            return context.Users.Find(id);
        }



        public int UpdatePassword(long userId, string password)
        {
            try
            {
                var user = context.Users.Find(userId);
                if (user != null)
                {
                    // Update the new password for the user
                    user.ModifiedDate = DateTime.Now;
                    user.Password = password;
                    user.ModifiedBy = "User change password";

                    // Save changes to the database
                    context.SaveChanges();
                    return 0; // Return 0 for success
                }
                return -1; // Return -1 if user not found
            }
            catch (Exception ex)
            {
                // Handle the exception here, e.g., log the error
                return -2; // Return -2 for an exception or error
            }
        }
        public int UpdateEmail(int userId, string newEmail)
        {
            // Tìm người dùng bằng ID
            var user = context.Users.FirstOrDefault(u => u.Id == userId);
            if (user == null)
            {
                // Không tìm thấy người dùng
                return -2;
            }

            // Kiểm tra xem có user nào khác có cùng email không
            bool emailExists = context.Users.Any(u => u.Email == newEmail && u.Id != userId);
            if (emailExists)
            {
                // Email đã tồn tại cho một người dùng khác
                return -1;
            }

            // Cập nhật email cho người dùng
            user.Email = newEmail;
            context.SaveChanges();

            // Cập nhật thành công
            return 0;
        }

        public int SignUp(User entity)
        {
            // Kiểm tra xem có user nào có cùng username không
            bool usernameExists = context.Users.Any(u => u.UserName == entity.UserName);
            if (usernameExists)
            {
                // Username đã tồn tại
                return -1;
            }

            // Kiểm tra xem có user nào có cùng email không
            bool emailExists = context.Users.Any(u => u.Email == entity.Email);
            if (emailExists)
            {
                // Email đã tồn tại
                return -2;
            }

            // Nếu không có trùng lặp, thêm đối tượng vào cơ sở dữ liệu và lưu thay đổi
            context.Users.Add(entity);
            context.SaveChanges();

            // Đăng ký thành công
            return 0;
        }


        public bool VerifyPassword(long userId, string providedPassword)
        {
            var user = context.Users.Find(userId);
            if (user == null)
            {
                // User not found
                return false;
            }

            // Directly compare the provided password with the stored one
            // WARNING: This is insecure and for demonstration purposes only
            return user.Password == providedPassword;

        }


        public int UpdateSocialMediaInfo(long userId, string urlfb ,string urlIg ,string urlYoutube)
        {
            try
            {
                var user = context.Users.Find(userId);
                if (user != null)
                {
                    // Update the new password for the user
                    user.ModifiedDate = DateTime.Now;
                    user.UrlFacebook = urlfb;
                    user.UrlInstagram = urlIg;
                    user.UrlYoutube = urlYoutube;

                    // Save changes to the database
                    context.SaveChanges();
                    return 0; // Return 0 for success
                }
                return -1; // Return -1 if user not found
            }
            catch (Exception ex)
            {
                // Handle the exception here, e.g., log the error
                return -2; // Return -2 for an exception or error
            }
        }

        public int UpdateInfo(long userId, string name, string phone, string address,string aboutme,string education)
        {
            try
            {
                var user = context.Users.Find(userId);


                if (user != null)
                {
                    // Check if the phone number exists and is associated with a different user
                    var existingUserWithPhone = context.Users.FirstOrDefault(u => u.Phone == phone);
                    if (existingUserWithPhone != null && existingUserWithPhone.Id != user.Id)
                    {
                        // The phone number exists and is associated with a different user
                        return -3;
                    }

                    // Update the user information
                    user.Name = name;
                    user.Phone = phone;
                    user.Address = address;
                    user.AboutMe = aboutme;
                    user.Education = education;
                    user.ModifiedBy = "Change info profile";
                    user.ModifiedDate = DateTime.Now.Date;

                    // Save changes to the database
                    context.SaveChanges();
                    return 0; // Return 0 for success
                }
                return -1; // Return -1 if user not found

            }
            catch (Exception ex)
            {
                // Handle the exception here, e.g., log the error
                return -2; // Return -2 for an exception or error
            }
        }


    }
}
