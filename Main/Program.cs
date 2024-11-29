using System.Net.Mail;
using System.Net;

namespace MyProject;
class Program
{
    static void Main(string[] args)
    {
        Program program = new Program();
        string code = program.getRandom();

        program.SendMail("huygoku37@gmail.com", "CourseOnline thay đổi email của bạn", $"Mã Xác Nhận: {code}");
        Console.WriteLine("DONE");
    }
    public string getRandom()
    {
        Random r = new Random();
        int num = r.Next(0, 10000); // Tạo một số ngẫu nhiên từ 0 đến 9999
        return num.ToString("D4"); // Định dạng số với ít nhất 4 chữ số, thêm số 0 ở đầu nếu cần
    }

    public void SendMail(string toMail, string subject, string body)
    {
        string fromMail = "huysendmailjava@gmail.com";
        string fromPassword = "jqjzzgkyvwjexskx";

        // Tạo một mã ngẫu nhiên

        MailMessage message = new MailMessage();
        message.From = new MailAddress(fromMail);
        message.To.Add(new MailAddress(toMail));
        message.Subject = subject;
        message.Body = body;
        message.IsBodyHtml = true; // Đảm bảo rằng bạn đặt IsBodyHtml là true để mã HTML được hiển thị đúng cách

        using (var smtpClient = new SmtpClient("smtp.gmail.com"))
        {
            smtpClient.Port = 587;
            smtpClient.Credentials = new NetworkCredential(fromMail, fromPassword);
            smtpClient.EnableSsl = true;

            try
            {
                smtpClient.Send(message);
                Console.WriteLine("Email sent successfully.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error sending email. " + ex.Message);
            }
        }
    }

}
