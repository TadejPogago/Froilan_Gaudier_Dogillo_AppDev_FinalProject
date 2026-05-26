using DataHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_FinalProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            SqlParameter[] param =
            {
                new SqlParameter("@Username", txtUsername.Text),
                new SqlParameter("@Password", txtPassword.Text)
            };

            DataTable dt =
                SqlDb.ExecuteDataTable("sp_LoginUser", param);

            // ACCOUNT EXISTS
            if (dt.Rows.Count > 0)
            {
                // SAVE USER INFO IN SESSION
                Session["MemberId"] =
                    dt.Rows[0]["UserID"].ToString();

                Session["Username"] =
                    dt.Rows[0]["Username"].ToString();

                Session["Membership"] =
                    dt.Rows[0]["Membership"].ToString();

                // REDIRECT TO USER PAGE
                Response.Redirect("~/UserPage.aspx");
            }
            else
            {
                // ACCOUNT NOT FOUND
                Response.Write(
                    "<script>alert('Account not found!');</script>"
                );
            }
        }

        protected void LinkReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}