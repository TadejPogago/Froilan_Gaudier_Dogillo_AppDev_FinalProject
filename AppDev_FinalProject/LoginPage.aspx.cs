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
            if (txtUsername.Text.Trim() == "admin" && txtPassword.Text.Trim() == "admin")
            {
                Session["Username"] = "admin";
                Session["MembershipType"] = "";
                Session["UserID"] = "0";
                Response.Redirect("AdminPage.aspx");
                return;
            }

            DataTable dt = SqlDb.ValidateUserAccount
            (
                txtUsername.Text.Trim(),
                txtPassword.Text.Trim()
            );

            if (dt.Rows.Count > 0)
            {
                Session["Username"] = dt.Rows[0]["Username"].ToString();
                Session["MembershipType"] = dt.Rows[0]["MembershipType"].ToString();
                Session["UserID"] = dt.Rows[0]["UserID"].ToString();

                bool isAdmin =
                    Convert.ToBoolean(dt.Rows[0]["IsAdmin"]);

                if (isAdmin)
                {
                    Response.Redirect("AdminPage.aspx");
                }
                else
                {
                    Response.Redirect("UserPage.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }

        protected void LinkReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterPage.aspx");
        }
    }
}