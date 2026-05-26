using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
// using System.Data.SqlClient; // Uncomment when database is ready

namespace AppDev_FinalProject
{
    public partial class AdminPage : Page
    {
        // TODO: Uncomment and set your connection string in Web.config when DB is ready
        // string connStr = ConfigurationManager.ConnectionStrings["SalesDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowPanel("Dashboard");
                LoadDashboard();
            }
        }

        // ── NAVIGATION ──────────────────────────────────────
        protected void btnNav_Click(object sender, EventArgs e)
        {
            string section = ((Button)sender).CommandArgument;
            ShowPanel(section);

            switch (section)
            {
                case "Dashboard": LoadDashboard(); break;
                case "Products": LoadProducts(); break;
                case "Members": LoadMembers(); break;
                case "Transactions": LoadTransactions(); break;
                case "Reports": LoadReports(); break;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/LoginPage.aspx");
        }

        void ShowPanel(string name)
        {
            pnlDashboard.Visible = (name == "Dashboard");
            pnlAddProduct.Visible = (name == "AddProduct");
            pnlProducts.Visible = (name == "Products");
            pnlMembers.Visible = (name == "Members");
            pnlTransactions.Visible = (name == "Transactions");
            pnlReports.Visible = (name == "Reports");
        }

        // ── DASHBOARD ───────────────────────────────────────
        void LoadDashboard()
        {
            // TODO: Replace placeholder data with DB call when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_GetDashboardStats", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     SqlDataReader dr = cmd.ExecuteReader();
            //     if (dr.Read())
            //     {
            //         lblStatMembers.Text  = dr["TotalMembers"].ToString();
            //         lblStatTxn.Text      = dr["TotalTransactions"].ToString();
            //         lblStatSales.Text    = Convert.ToDecimal(dr["TotalSales"]).ToString("N2");
            //         lblStatProducts.Text = dr["TotalProducts"].ToString();
            //     }
            // }

            // PLACEHOLDER: Remove these when DB is connected
            lblStatProducts.Text = "5";
            lblStatMembers.Text = "0";
            lblStatTxn.Text = "0";
            lblStatSales.Text = "0.00";

            gvDashStock.DataSource = GetPlaceholderProducts();
            gvDashStock.DataBind();
        }

        // ── ADD PRODUCT ─────────────────────────────────────
        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            ShowPanel("AddProduct");

            if (string.IsNullOrWhiteSpace(txtProductId.Text) ||
                string.IsNullOrWhiteSpace(txtProductName.Text) ||
                string.IsNullOrWhiteSpace(txtPrice.Text) ||
                string.IsNullOrWhiteSpace(txtStocks.Text))
            {
                lblAddMsg.CssClass = "msg-error";
                lblAddMsg.Text = "⚠ Please fill in all fields.";
                return;
            }

            decimal price;
            int stocks;

            if (!decimal.TryParse(txtPrice.Text, out price) || price <= 0)
            {
                lblAddMsg.CssClass = "msg-error";
                lblAddMsg.Text = "⚠ Please enter a valid price.";
                return;
            }

            if (!int.TryParse(txtStocks.Text, out stocks) || stocks < 0)
            {
                lblAddMsg.CssClass = "msg-error";
                lblAddMsg.Text = "⚠ Please enter a valid stock count.";
                return;
            }

            decimal srp = price * 1.15m;

            // TODO: Replace with actual DB insert when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_AddProduct", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     cmd.Parameters.AddWithValue("@ProductId",   txtProductId.Text.Trim().ToUpper());
            //     cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
            //     cmd.Parameters.AddWithValue("@Price",       price);
            //     cmd.Parameters.AddWithValue("@Stocks",      stocks);
            //     cmd.ExecuteNonQuery();
            // }

            // PLACEHOLDER: Just shows success message until DB is connected
            lblAddMsg.CssClass = "msg-success";
            lblAddMsg.Text = $"✔ Product '{txtProductName.Text.Trim()}' added! SRP: ₱{srp:N2} (DB not connected yet)";

            txtProductId.Text = txtProductName.Text = txtPrice.Text = txtStocks.Text = "";
        }

        // ── PRODUCTS ────────────────────────────────────────
        void LoadProducts()
        {
            // TODO: Replace with DB call when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_GetAllProducts", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     SqlDataAdapter da = new SqlDataAdapter(cmd);
            //     DataTable dt = new DataTable();
            //     da.Fill(dt);
            //     gvProducts.DataSource = dt;
            //     gvProducts.DataBind();
            // }

            // PLACEHOLDER
            gvProducts.DataSource = GetPlaceholderProducts();
            gvProducts.DataBind();
        }

        // ── MEMBERS ─────────────────────────────────────────
        void LoadMembers()
        {
            // TODO: Replace with DB call when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_GetAllMembers", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     SqlDataAdapter da = new SqlDataAdapter(cmd);
            //     DataTable dt = new DataTable();
            //     da.Fill(dt);
            //     gvMembers.DataSource = dt;
            //     gvMembers.DataBind();
            // }

            // PLACEHOLDER
            DataTable dt = new DataTable();
            dt.Columns.Add("MemberId");
            dt.Columns.Add("FullName");
            dt.Columns.Add("Email");
            dt.Columns.Add("MembershipType");
            dt.Columns.Add("DateRegistered");

            dt.Rows.Add("1", "Juan dela Cruz", "juan@example.com", "Silver", "2026-01-10");
            dt.Rows.Add("2", "Maria Santos", "maria@example.com", "Gold", "2026-02-14");
            dt.Rows.Add("3", "Pedro Reyes", "pedro@example.com", "Platinum", "2026-03-01");

            gvMembers.DataSource = dt;
            gvMembers.DataBind();
        }

        // ── TRANSACTIONS ─────────────────────────────────────
        void LoadTransactions()
        {
            // TODO: Replace with DB call when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_GetAllTransactions", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     SqlDataAdapter da = new SqlDataAdapter(cmd);
            //     DataTable dt = new DataTable();
            //     da.Fill(dt);
            //     gvTransactions.DataSource = dt;
            //     gvTransactions.DataBind();
            // }

            // PLACEHOLDER
            DataTable dt = new DataTable();
            dt.Columns.Add("TransactionId");
            dt.Columns.Add("TransactionDate");
            dt.Columns.Add("MemberName");
            dt.Columns.Add("MembershipType");
            dt.Columns.Add("Subtotal");
            dt.Columns.Add("VAT");
            dt.Columns.Add("Discount");
            dt.Columns.Add("TotalAmount");

            dt.Rows.Add("1", "2026-05-25 09:14 AM", "Maria Santos", "Gold", "7200.00", "720.00", "0.00", "7920.00");
            dt.Rows.Add("2", "2026-05-25 11:30 AM", "Pedro Reyes", "Platinum", "15000.00", "1500.00", "2475.00", "14025.00");

            gvTransactions.DataSource = dt;
            gvTransactions.DataBind();
        }

        // ── REPORTS ─────────────────────────────────────────
        void LoadReports()
        {
            lblReportDate.Text = DateTime.Now.ToString("MMMM dd, yyyy hh:mm tt");

            // TODO: Replace with DB call when ready
            // using (SqlConnection conn = new SqlConnection(connStr))
            // {
            //     conn.Open();
            //     SqlCommand cmd = new SqlCommand("sp_GetTotalSales", conn);
            //     cmd.CommandType = CommandType.StoredProcedure;
            //     object result = cmd.ExecuteScalar();
            //     lblTotalSales.Text = Convert.ToDecimal(result).ToString("N2");
            // }

            // PLACEHOLDER
            lblTotalSales.Text = "21,945.00";

            // PLACEHOLDER: Sales per product
            // TODO: Replace with sp_GetSalesPerProduct
            DataTable dtSales = new DataTable();
            dtSales.Columns.Add("ProductName");
            dtSales.Columns.Add("TotalSold");
            dtSales.Columns.Add("TotalRevenue");
            dtSales.Columns.Add("RemainingStock");

            dtSales.Rows.Add("Mouse", "2", "700.00", "98");
            dtSales.Rows.Add("LCD Monitor", "1", "6500.00", "99");
            dtSales.Rows.Add("LED Monitor", "2", "15000.00", "98");
            dtSales.Rows.Add("Printer Ink", "0", "0.00", "100");
            dtSales.Rows.Add("Printer Dot Matrix", "0", "0.00", "100");

            rptChart.DataSource = dtSales;
            rptChart.DataBind();
            gvSalesReport.DataSource = dtSales;
            gvSalesReport.DataBind();

            // PLACEHOLDER: Members by type
            // TODO: Replace with sp_GetMembersByType query
            DataTable dtMem = new DataTable();
            dtMem.Columns.Add("MembershipType");
            dtMem.Columns.Add("MemberCount");
            dtMem.Columns.Add("Discount");

            dtMem.Rows.Add("Silver", "1", "5%");
            dtMem.Rows.Add("Gold", "1", "10%");
            dtMem.Rows.Add("Platinum", "1", "15%");

            gvMemberReport.DataSource = dtMem;
            gvMemberReport.DataBind();
        }

        // ── PLACEHOLDER DATA ─────────────────────────────────
        DataTable GetPlaceholderProducts()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ProductId");
            dt.Columns.Add("ProductName");
            dt.Columns.Add("Price");
            dt.Columns.Add("SRP");
            dt.Columns.Add("Stocks");

            dt.Rows.Add("MSE", "Mouse", "350.00", "402.50", "100");
            dt.Rows.Add("PRN", "Printer Ink", "7500.00", "8625.00", "100");
            dt.Rows.Add("PRNDT", "Printer Dot Matrix", "5000.00", "5750.00", "100");
            dt.Rows.Add("MNTRLc", "LCD Monitor", "6500.00", "7475.00", "100");
            dt.Rows.Add("MNTRLe", "LED Monitor", "7500.00", "8625.00", "100");

            return dt;
        }

        // ── BAR CHART HEIGHT HELPER ──────────────────────────
        public string GetBarHeight(object stocks)
        {
            int s = Convert.ToInt32(stocks);
            return Math.Max(10, (int)(s * 1.4)).ToString();
        }
    }
}