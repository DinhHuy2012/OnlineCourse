using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
namespace OnlineCourse.Common
{
    public static class Encrytor
    {
        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));
            byte[] result = md5.Hash;
            StringBuilder strBuild = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                strBuild.Append(result[i].ToString("x2"));
            }
            return strBuild.ToString();
        }

    }
}