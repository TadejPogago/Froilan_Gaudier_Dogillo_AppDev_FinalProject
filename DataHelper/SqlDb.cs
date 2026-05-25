using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataHelper
{
    public class SqlDb
    {
        static string connString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SalesInventoryDb;Integrated Security=True;Connect Timeout=30;";

        public static bool ChangePassword(string username, string currentPass, string newPass)
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                con.Open();

                // 1. check current password
                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username=@u AND Password=@p";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@u", username);
                checkCmd.Parameters.AddWithValue("@p", currentPass);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists == 0)
                    return false;

                // 2. update password
                string updateQuery = "UPDATE Users SET Password=@np WHERE Username=@u";
                SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                updateCmd.Parameters.AddWithValue("@u", username);
                updateCmd.Parameters.AddWithValue("@np", newPass);

                updateCmd.ExecuteNonQuery();

                return true;
            }
        }
    }
}
