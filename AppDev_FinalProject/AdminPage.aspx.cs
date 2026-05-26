using DataHelper;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace AppDev_FinalProject
{
    public partial class AdminPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowPanel("Dashboard");
                LoadProducts();
            }
        }

        protected void btnNav_Click(object sender, EventArgs e)
        {
            string panel = ((Button)sender).CommandArgument;
            ShowPanel(panel);

            if (panel == "Products" || panel == "Dashboard")
            {
                LoadProducts();
            }
        }

        private void ShowPanel(string panel)
        {
            pnlDashboard.Visible = panel == "Dashboard";
            pnlAddProduct.Visible = panel == "AddProduct";
        }

        private void LoadProducts()
        {
            DataTable dt = SqlDb.GetProducts();

            gvProducts.DataSource = dt;
            gvProducts.DataBind();

            lblStatProducts.Text = dt.Rows.Count.ToString();
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string id = txtProductId.Text.Trim();
                string name = txtProductName.Text.Trim();
                decimal price = Convert.ToDecimal(txtPrice.Text);
                int stocks = Convert.ToInt32(txtStocks.Text);

              
                lblAddMsg.CssClass = "msg-success";
                lblAddMsg.Text = "Product added successfully.";

                txtProductId.Text = "";
                txtProductName.Text = "";
                txtPrice.Text = "";
                txtStocks.Text = "";

                LoadProducts();
            }
            catch (Exception ex)
            {
                lblAddMsg.CssClass = "msg-error";
                lblAddMsg.Text = ex.Message;
            }
        }
    }
}