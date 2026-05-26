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
    public partial class UserOrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MemberId"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            SqlParameter[] param =
            {
                new SqlParameter("@MemberId", Session["MemberId"])
            };

            DataTable dt = SqlDb.ExecuteDataTable("sp_GetUserOrders", param);

            gvOrders.DataSource = dt;
            gvOrders.DataBind();
        }
    }
}
