using System;
using System.Web.UI;

namespace AppDev_FinalProject
{
    public partial class AdminPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblReportDate.Text = DateTime.Now.ToString("MMMM dd, yyyy hh:mm tt");

            if (!IsPostBack)
            {
                // TODO: LoadDashboardStats(); LoadProducts(); etc.
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtProductId.Text) ||
                string.IsNullOrWhiteSpace(txtProductName.Text) ||
                string.IsNullOrWhiteSpace(txtPrice.Text) ||
                string.IsNullOrWhiteSpace(txtStocks.Text))
            {
                lblAddMsg.ForeColor = System.Drawing.Color.Red;
                lblAddMsg.Text = "⚠ Please fill in all fields.";
                return;
            }

            decimal price;
            int stocks;

            if (!decimal.TryParse(txtPrice.Text, out price) || price <= 0)
            {
                lblAddMsg.ForeColor = System.Drawing.Color.Red;
                lblAddMsg.Text = "⚠ Please enter a valid price.";
                return;
            }

            if (!int.TryParse(txtStocks.Text, out stocks) || stocks < 0)
            {
                lblAddMsg.ForeColor = System.Drawing.Color.Red;
                lblAddMsg.Text = "⚠ Please enter a valid stock count.";
                return;
            }

            decimal srp = price * 1.15m;

            // TODO: INSERT into your database here

            lblAddMsg.ForeColor = System.Drawing.Color.Green;
            lblAddMsg.Text = $"✔ Product '{txtProductName.Text.Trim()}' added! SRP: ₱{srp:N2}";

            txtProductId.Text = string.Empty;
            txtProductName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtStocks.Text = string.Empty;
        }
    }
}