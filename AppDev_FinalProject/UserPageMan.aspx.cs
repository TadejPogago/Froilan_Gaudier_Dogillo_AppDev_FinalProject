using DataHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppDev_FinalProject
{
    public partial class UserPageMan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            // FIX: match login session key
            string user = Session["Username"]?.ToString();

            if (string.IsNullOrEmpty(user))
            {
                lblMessage.Text = "No user logged in.";
                return;
            }

            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match!";
                return;
            }

            bool ok = SqlDb.ChangePassword(
                user,
                txtCurrentPassword.Text,
                txtNewPassword.Text
            );

            lblMessage.Text = ok
                ? "Password changed successfully!"
                : "Current password is incorrect!";
        }
    }
}