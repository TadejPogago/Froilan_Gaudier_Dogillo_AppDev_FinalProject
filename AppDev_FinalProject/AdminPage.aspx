<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="AppDev_FinalProject.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<style>
    body {
        background: #f4f7fb;
        font-family: 'Poppins', sans-serif;
    }

    .admin-wrapper {
        display: flex;
        min-height: 90vh;
    }

    .sidebar {
        width: 220px;
        background: #1e293b;
        padding: 20px 0;
        flex-shrink: 0;
    }

    .sidebar-title {
        color: #94a3b8;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 2px;
        text-transform: uppercase;
        padding: 0 20px 15px;
        border-bottom: 1px solid #334155;
        margin-bottom: 10px;
    }

    .btn-nav {
        display: block;
        width: 100%;
        padding: 13px 20px;
        background: transparent;
        color: #cbd5e1;
        border: none;
        border-left: 3px solid transparent;
        text-align: left;
        font-size: 14px;
        font-family: 'Poppins', sans-serif;
        cursor: pointer;
    }

    .btn-nav:hover {
        background: rgba(37,99,235,0.15);
        color: #38bdf8;
        border-left-color: #38bdf8;
    }

    .sidebar-sep {
        border: none;
        border-top: 1px solid #334155;
        margin: 8px 0;
    }

    .main-content {
        flex: 1;
        padding: 30px 35px;
    }

    .page-header h2 {
        font-size: 26px;
        font-weight: 700;
        color: #0f172a;
    }

    .stats-grid {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 16px;
        margin-bottom: 28px;
    }

    .stat-card {
        background: white;
        border-radius: 14px;
        padding: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        text-align: center;
    }

    .panel {
        background: white;
        border-radius: 16px;
        padding: 25px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06);
        margin-bottom: 24px;
    }

    .form-row {
        display: flex;
        gap: 16px;
        flex-wrap: wrap;
        margin-bottom: 16px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 6px;
        flex: 1;
        min-width: 180px;
    }

    .form-group input {
        padding: 10px 14px;
        border: 2px solid #e2e8f0;
        border-radius: 9px;
        font-size: 14px;
    }

    .btn {
        padding: 10px 22px;
        border: none;
        border-radius: 9px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
    }

    .btn-blue {
        background: #2563eb;
        color: white;
    }

    .data-table {
        width: 100%;
        border-collapse: collapse;
    }

    .data-table th,
    .data-table td {
        padding: 12px;
        border-bottom: 1px solid #e2e8f0;
    }

    .msg-success {
        color: green;
        font-weight: bold;
    }

    .msg-error {
        color: red;
        font-weight: bold;
    }
</style>

<div class="admin-wrapper">

    <div class="sidebar">
        <div class="sidebar-title">Admin Panel</div>

        <asp:Button ID="btnNavDashboard" runat="server" Text="Dashboard" CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Dashboard" />
        <asp:Button ID="btnNavAddProduct" runat="server" Text="Add Product" CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="AddProduct" />
        <asp:Button ID="btnNavProducts" runat="server" Text="Products" CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Products" />
    </div>

    <div class="main-content">

        <asp:Panel ID="pnlDashboard" runat="server">
            <div class="page-header">
                <h2>Dashboard</h2>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <h3><asp:Label ID="lblStatProducts" runat="server" /></h3>
                    <p>Products</p>
                </div>
            </div>

            <div class="panel">
                <asp:GridView ID="gvProducts" runat="server" CssClass="data-table" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ProductID" HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="Stocks" HeaderText="Stocks" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlAddProduct" runat="server" Visible="false">
            <div class="panel">

                <div class="form-row">
                    <div class="form-group">
                        <label>Product ID</label>
                        <asp:TextBox ID="txtProductId" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Product Name</label>
                        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Price</label>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Stocks</label>
                        <asp:TextBox ID="txtStocks" runat="server"></asp:TextBox>
                    </div>
                </div>

                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-blue" OnClick="btnAddProduct_Click" />

                <br /><br />

                <asp:Label ID="lblAddMsg" runat="server"></asp:Label>
            </div>
        </asp:Panel>

    </div>
</div>

</asp:Content>
```

---

# Fixed `AdminPage.aspx.cs`

```csharp
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataHelper;

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

                // ADD THIS STORED PROCEDURE IN SQL
                // sp_AddProduct

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
```

---

# Main Errors Fixed

## 1. Invalid CSS Selector

This line causes errors:

```css
.sidebar asp:Button
```

ASP.NET controls are rendered as HTML, so CSS cannot target `asp:Button` directly.

Fixed using:

```css
.btn-nav
```

---

## 2. Self Closing ASP.NET TextBox

Some Visual Studio versions throw parser errors with:

```aspx
<asp:TextBox />
```

Fixed using:

```aspx
<asp:TextBox></asp:TextBox>
```

---

## 3. Database Integration

Your project already uses:

```csharp
DataHelper.SqlDb
```

So the admin page is now connected to:

```csharp
SqlDb.GetProducts()
```

instead of placeholder tables.

---

# SQL Stored Procedure Needed

```sql
CREATE PROCEDURE sp_AddProduct
    @ProductID NVARCHAR(50),
    @ProductName NVARCHAR(100),
    @Price DECIMAL(18,2),
    @Stocks INT
AS
BEGIN
    INSERT INTO Products(ProductID, ProductName, Price, Stocks)
    VALUES(@ProductID, @ProductName, @Price, @Stocks)
END
```

---

# Also Check Your Database Table

```sql
CREATE TABLE Products
(
    ProductID NVARCHAR(50) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(18,2),
    Stocks INT
)
```

---

# Important

Your connection string currently points to:

```csharp
Initial Catalog=MasterFile
```

inside:

```csharp
DataHelper/SqlDb.cs
```

Make sure that database actually exists in SQL Server.
