using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataHelper
{
    public class SqlDb
    {
        static string connString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MasterFile;Integrated Security=True;Connect Timeout=30;";

        //register user
        public static bool RegisterUser
        (
            string username,
            string password,
            string membership,
            bool isAdmin = false
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_RegisterUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@MembershipType", membership);
                    cmd.Parameters.AddWithValue("@IsAdmin", isAdmin);

                    conn.Open();

                    int rows = cmd.ExecuteNonQuery();

                    return rows > 0;
                }
            }
        }

        //login user
        public static bool LoginUser
        (
            string username,
            string password
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_LoginUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    return reader.HasRows;
                }
            }
        }

        //validate user account
        public static DataTable ValidateUserAccount
        (
            string username,
            string password
        )
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_ValidateUserAccount", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Password", password);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(dt);
                }
            }

            return dt;
        }

        //change password
        public static bool ChangePassword
        (
            string username,
            string currentPassword,
            string newPassword
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();

                string checkQuery =
                    @"SELECT COUNT(*) 
                      FROM Users
                      WHERE Username=@Username
                      AND Password=@Password";

                using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue("@Username", username);
                    checkCmd.Parameters.AddWithValue("@Password", currentPassword);

                    int count = (int)checkCmd.ExecuteScalar();

                    if (count == 0)
                    {
                        return false;
                    }
                }

                string updateQuery =
                    @"UPDATE Users
                      SET Password=@NewPassword
                      WHERE Username=@Username";

                using (SqlCommand updateCmd = new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@NewPassword", newPassword);
                    updateCmd.Parameters.AddWithValue("@Username", username);

                    int rows = updateCmd.ExecuteNonQuery();

                    return rows > 0;
                }
            }
        }

        //get products
        public static DataTable GetProducts()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetProducts", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(dt);
                }
            }

            return dt;
        }

        //save order
        public static int SaveOrder
        (
            int userId,
            decimal subtotal,
            decimal vat,
            decimal discount,
            decimal totalAmount
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SaveOrder", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@Subtotal", subtotal);
                    cmd.Parameters.AddWithValue("@VAT", vat);
                    cmd.Parameters.AddWithValue("@Discount", discount);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);

                    conn.Open();

                    return Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
        }

        //save order details
        public static void SaveOrderDetails
        (
            int orderId,
            string productId,
            int quantity,
            decimal price,
            decimal total
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_SaveOrderDetails", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Total", total);

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }

        //update stock
        public static void UpdateStock
        (
            string productId,
            int quantity
        )
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_UpdateStock", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);

                    conn.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }

        //admin dashboard
        public static DataSet AdminDashboard()
        {
            DataSet ds = new DataSet();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AdminDashboard", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    da.Fill(ds);
                }
            }
            return ds;
        }
    }
}
