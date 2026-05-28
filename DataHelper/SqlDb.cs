using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataHelper
{
    public class SqlDb
    {
        private static string connString =
    System.Configuration.ConfigurationManager
    .ConnectionStrings["SomeeDB"].ConnectionString;

        //add product
        public static bool AddProduct (string productId, string productName, decimal price, int stocks)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_AddProduct", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@ProductName", productName);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Stocks", stocks);

                    conn.Open();
                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        //register user
        public static bool RegisterUser
        (
            string username,
            string password,
            string membership,
            bool isAdmin = false
        )
        {
            using (SqlConnection conn =
                new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_RegisterUser", conn))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@Username", username);

                    cmd.Parameters.AddWithValue(
                        "@PasswordHash", password);

                    cmd.Parameters.AddWithValue(
                        "@MembershipType", membership);

                    cmd.Parameters.AddWithValue(
                        "@IsAdmin", isAdmin);

                    conn.Open();

                    return cmd.ExecuteNonQuery() > 0;
                }
            }
        }

        //login
        public static DataTable ValidateUserAccount
        (
            string username,
            string password
        )
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn =
                new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                    "sp_ValidateUserAccount",
                    conn))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@Username", username);

                    cmd.Parameters.AddWithValue(
                        "@PasswordHash", password);

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

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
            using (SqlConnection conn =
                new SqlConnection(connString))
            {
                conn.Open();

                string checkQuery =
                @"SELECT COUNT(*)
                  FROM Users
                  WHERE Username=@Username
                  AND PasswordHash=@Password";

                using (SqlCommand checkCmd =
                    new SqlCommand(checkQuery, conn))
                {
                    checkCmd.Parameters.AddWithValue(
                        "@Username", username);

                    checkCmd.Parameters.AddWithValue(
                        "@Password", currentPassword);

                    int count =
                        (int)checkCmd.ExecuteScalar();

                    if (count == 0)
                        return false;
                }

                string updateQuery =
                @"UPDATE Users
                  SET PasswordHash=@NewPassword
                  WHERE Username=@Username";

                using (SqlCommand updateCmd =
                    new SqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue(
                        "@NewPassword", newPassword);

                    updateCmd.Parameters.AddWithValue(
                        "@Username", username);

                    return updateCmd.ExecuteNonQuery() > 0;
                }
            }
        }

        //get products
        public static DataTable GetProducts()
        {
            DataTable dt = new DataTable();

            using (SqlConnection conn =
                new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_GetProducts", conn))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    da.Fill(dt);
                }
            }

            return dt;
        }

        //save orders
        public static int SaveOrder(int userId, decimal subtotal, decimal vat, decimal discount, decimal totalAmount)
        {
            int newOrderId = 0;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_SaveOrder", conn))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@UserID", userId);

                    cmd.Parameters.AddWithValue(
                        "@Subtotal", subtotal);

                    cmd.Parameters.AddWithValue(
                        "@VAT", vat);

                    cmd.Parameters.AddWithValue(
                        "@Discount", discount);

                    cmd.Parameters.AddWithValue(
                        "@TotalAmount", totalAmount);

                    conn.Open();
                    newOrderId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return newOrderId;
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
            using (SqlConnection conn =
                new SqlConnection(connString))
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

        //get user orders
        public static DataTable GetUserOrders(int userId)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetUserOrders", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }
            return dt;
        }
        public static int GetTotalProducts()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Products", conn);
                conn.Open();
                return (int)cmd.ExecuteScalar();
            }
        }

        public static int GetTotalMembers()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Users WHERE IsAdmin = 0", conn);
                conn.Open();
                return (int)cmd.ExecuteScalar();
            }
        }

        // REPLACE WITH this version that returns DataTable
        public static DataTable GetAllOrders()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
            SELECT 
                o.OrderID,
                u.Username,
                u.MembershipType,
                o.Subtotal,
                o.VAT,
                o.Discount,
                o.TotalAmount,
                o.OrderDate
            FROM Orders o
            INNER JOIN Users u ON o.UserID = u.UserID
            ORDER BY o.OrderDate DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.Fill(dt);
            }
            return dt;
        }

        public static decimal GetTotalSales()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT ISNULL(SUM(TotalAmount), 0) FROM Orders", conn);
                conn.Open();
                return (decimal)cmd.ExecuteScalar();
            }
        }

        public static DataTable GetAllUsers()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Users WHERE IsAdmin = 0", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }
        public static int GetTotalOrders()
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Orders", conn);
                conn.Open();
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}