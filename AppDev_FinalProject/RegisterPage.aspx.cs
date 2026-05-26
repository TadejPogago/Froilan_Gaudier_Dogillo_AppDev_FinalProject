using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataHelper;

namespace AppDev_FinalProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool success = SqlDb.RegisterUser
            (
                txtUser.Text.Trim(),
                txtPass.Text.Trim(),
                ddlMembership.SelectedValue
            );

            if (success)
            {
                Response.Write("<script>alert('Registration Successful!');</script>");

                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registration Failed!');</script>");
            }
        }
    }
}