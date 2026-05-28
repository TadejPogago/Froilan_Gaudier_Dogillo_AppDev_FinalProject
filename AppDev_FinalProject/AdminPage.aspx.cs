using DataHelper;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Util;

namespace AppDev_FinalProject
{
    public partial class AdminPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // FIX: was checking Session["Role"] which is never set
            if (Session["UserID"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                ShowPanel("Dashboard");
                LoadDashboard();
            }
        }

        protected void btnNav_Click(object sender, EventArgs e)
        {
            string panel = ((Button)sender).CommandArgument;
            ShowPanel(panel);

            switch (panel)
            {
                case "Dashboard": LoadDashboard(); break;
                case "Products": LoadProducts(); break;
                case "Members": LoadMembers(); break;
                case "Transactions": LoadTransactions(); break;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        private void ShowPanel(string panel)
        {
            pnlDashboard.Visible = (panel == "Dashboard");
            pnlAddProduct.Visible = (panel == "AddProduct");
            pnlProducts.Visible = (panel == "Products");
            pnlMembers.Visible = (panel == "Members");
            pnlTransactions.Visible = (panel == "Transactions");
        }

        private void LoadDashboard()
        {
            lblStatProducts.Text = SqlDb.GetTotalProducts().ToString();
            lblStatMembers.Text = SqlDb.GetTotalMembers().ToString();
            lblStatOrders.Text = SqlDb.GetTotalOrders().ToString(); lblStatSales.Text = "₱" + SqlDb.GetTotalSales().ToString("N2");

            gvDashboard.DataSource = SqlDb.GetProducts();
            gvDashboard.DataBind();
        }

        private void LoadProducts()
        {
            gvProducts.DataSource = SqlDb.GetProducts();
            gvProducts.DataBind();
        }

        private void LoadMembers()
        {
            gvMembers.DataSource = SqlDb.GetAllUsers();
            gvMembers.DataBind();
        }

        private void LoadTransactions()
        {
            gvTransactions.DataSource = SqlDb.GetAllOrders();
            gvTransactions.DataBind();
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            try
            {
                string id = txtProductId.Text.Trim().ToUpper();
                string name = txtProductName.Text.Trim();

                if (string.IsNullOrEmpty(id) || string.IsNullOrEmpty(name) ||
                    string.IsNullOrEmpty(txtPrice.Text) || string.IsNullOrEmpty(txtStocks.Text))
                {
                    lblAddMsg.CssClass = "msg-error";
                    lblAddMsg.Text = "⚠ Please fill in all fields.";
                    ShowPanel("AddProduct");
                    return;
                }

                decimal price = Convert.ToDecimal(txtPrice.Text);
                int stocks = Convert.ToInt32(txtStocks.Text);

                bool success = SqlDb.AddProduct(id, name, price, stocks);

                if (success)
                {
                    txtProductId.Text = "";
                    txtProductName.Text = "";
                    txtPrice.Text = "";
                    txtStocks.Text = "";

                    ShowPanel("Products");
                    LoadProducts();
                }
                else
                {
                    lblAddMsg.CssClass = "msg-error";
                    lblAddMsg.Text = "⚠ Failed to add product. ID may already exist.";
                    ShowPanel("AddProduct");
                }
            }
            catch (Exception ex)
            {
                lblAddMsg.CssClass = "msg-error";
                lblAddMsg.Text = "⚠ " + ex.Message;
                ShowPanel("AddProduct");
            }
        }
    }
}
