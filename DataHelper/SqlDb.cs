using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataHelper
{
    public class SqlDb
    {
        static string connString = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=MasterFile;Integrated Security=True;Connect Timeout=30;";

        public static int ExecuteNonQuery
        (
            string storedProcedure, SqlParameter[] parameters
        )
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(storedProcedure, con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    con.Open();

                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public static object ExecuteScalar
        (
            string storedProcedure,
            SqlParameter[] parameters = null
        )
        {
            using (SqlConnection con =
                new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(storedProcedure, con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    con.Open();

                    return cmd.ExecuteScalar();
                }
            }
        }

        public static DataTable ExecuteDataTable
        (
            string storedProcedure,
            SqlParameter[] parameters = null
        )
        {
            DataTable dt = new DataTable();

            using (SqlConnection con =
                new SqlConnection(connString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(storedProcedure, con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        public static bool ChangePassword
        (
            string username,
            string currentPass,
            string newPass
        )
        {
            using (SqlConnection con =
                new SqlConnection(connString))
            {
                con.Open();

                string checkQuery =
                    @"SELECT COUNT(*)
                      FROM Users
                      WHERE Username=@u
                      AND PasswordHash=@p";

                SqlCommand checkCmd =
                    new SqlCommand(checkQuery, con);

                checkCmd.Parameters.AddWithValue("@u", username);
                checkCmd.Parameters.AddWithValue("@p", currentPass);

                int exists =
                    Convert.ToInt32(checkCmd.ExecuteScalar());

                if (exists == 0)
                    return false;

                string updateQuery =
                    @"UPDATE Users
                      SET PasswordHash=@np
                      WHERE Username=@u";

                SqlCommand updateCmd =
                    new SqlCommand(updateQuery, con);

                updateCmd.Parameters.AddWithValue("@u", username);
                updateCmd.Parameters.AddWithValue("@np", newPass);

                updateCmd.ExecuteNonQuery();

                return true;
            }
        }
    }
}
