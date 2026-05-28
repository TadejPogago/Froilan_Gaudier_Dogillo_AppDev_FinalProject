<%@ Page Title="Admin Page" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="AppDev_FinalProject.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    body { background: #f4f7fb; font-family: 'Poppins', sans-serif; }
    .admin-wrapper { display: flex; min-height: 90vh; }

    .sidebar { width: 220px; background: #1e293b; padding: 20px 0; flex-shrink: 0; }
    .sidebar-title { color: #94a3b8; font-size: 12px; font-weight: 700; letter-spacing: 2px;
        text-transform: uppercase; padding: 0 20px 15px; border-bottom: 1px solid #334155; margin-bottom: 10px; }
    .btn-nav { display: block; width: 100%; padding: 13px 20px; background: transparent;
        color: #cbd5e1; border: none; border-left: 3px solid transparent; text-align: left;
        font-size: 14px; font-family: 'Poppins', sans-serif; cursor: pointer; }
    .btn-nav:hover { background: rgba(37,99,235,0.15); color: #38bdf8; border-left-color: #38bdf8; }
    .sidebar-sep { border: none; border-top: 1px solid #334155; margin: 8px 0; }

    .main-content { flex: 1; padding: 30px 35px; }
    .page-header { margin-bottom: 20px; }
    .page-header h2 { font-size: 26px; font-weight: 700; color: #0f172a; }
    .page-header p  { color: #64748b; font-size: 14px; }

    .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; margin-bottom: 28px; }
    .stat-card { background: white; border-radius: 14px; padding: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06); text-align: center; }
    .stat-card h3 { font-size: 28px; font-weight: 700; color: #2563eb; }
    .stat-card p  { font-size: 13px; color: #64748b; margin-top: 4px; }

    .panel { background: white; border-radius: 16px; padding: 25px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.06); margin-bottom: 24px; }
    .panel h3 { font-size: 17px; font-weight: 700; color: #0f172a;
        margin-bottom: 18px; padding-bottom: 12px; border-bottom: 2px solid #f1f5f9; }

    .form-row { display: flex; gap: 16px; flex-wrap: wrap; margin-bottom: 16px; }
    .form-group { display: flex; flex-direction: column; gap: 6px; flex: 1; min-width: 180px; }
    .form-group label { font-size: 13px; font-weight: 600; color: #374151; }
    .form-group input { padding: 10px 14px; border: 2px solid #e2e8f0;
        border-radius: 9px; font-size: 14px; font-family: 'Poppins', sans-serif; outline: none; }
    .form-group input:focus { border-color: #3b82f6; }

    .btn { padding: 10px 22px; border: none; border-radius: 9px;
        font-size: 14px; font-weight: 600; cursor: pointer; font-family: 'Poppins', sans-serif; }
    .btn-blue { background: linear-gradient(135deg,#2563eb,#3b82f6); color: white; }

    .data-table { width: 100%; border-collapse: collapse; }
    .data-table th { background: #f8fafc; padding: 11px 14px; text-align: left;
        font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase;
        border-bottom: 2px solid #e2e8f0; }
    .data-table td { padding: 12px 14px; font-size: 14px; color: #334155; border-bottom: 1px solid #f1f5f9; }
    .data-table tr:hover td { background: #f8faff; }

    .msg-success { color: #16a34a; font-weight: bold; display: block; margin-top: 10px; }
    .msg-error   { color: #dc2626; font-weight: bold; display: block; margin-top: 10px; }
</style>

<div class="admin-wrapper">

    <!-- SIDEBAR -->
    <div class="sidebar">
        <div class="sidebar-title">Admin Panel</div>
        <asp:Button ID="btnNavDashboard"    runat="server" Text="📊 Dashboard"    CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Dashboard" />
        <asp:Button ID="btnNavAddProduct"   runat="server" Text="➕ Add Product"  CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="AddProduct" />
        <hr class="sidebar-sep" />
        <asp:Button ID="btnNavProducts"     runat="server" Text="📦 Products"     CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Products" />
        <asp:Button ID="btnNavMembers"      runat="server" Text="👥 Members"      CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Members" />
        <asp:Button ID="btnNavTransactions" runat="server" Text="🧾 Transactions" CssClass="btn-nav" OnClick="btnNav_Click" CommandArgument="Transactions" />
        <hr class="sidebar-sep" />
        <asp:Button ID="btnLogout"          runat="server" Text="🚪 Logout"       CssClass="btn-nav" OnClick="btnLogout_Click" />
    </div>

    <!-- MAIN -->
    <div class="main-content">

        <!-- DASHBOARD -->
        <asp:Panel ID="pnlDashboard" runat="server">
            <div class="page-header">
                <h2>Dashboard</h2>
                <p>Overview of the Sales &amp; Inventory System.</p>
            </div>
            <div class="stats-grid">
                <div class="stat-card">
                    <h3><asp:Label ID="lblStatProducts" runat="server" Text="0" /></h3>
                    <p>Products</p>
                </div>
                <div class="stat-card">
                    <h3><asp:Label ID="lblStatMembers" runat="server" Text="0" /></h3>
                    <p>Members</p>
                </div>
                <div class="stat-card">
                    <h3><asp:Label ID="lblStatOrders" runat="server" Text="0" /></h3>
                    <p>Orders</p>
                </div>
                <div class="stat-card">
                    <h3><asp:Label ID="lblStatSales" runat="server" Text="₱0.00" /></h3>
                    <p>Total Sales</p>
                </div>
            </div>
            <div class="panel">
                <h3>Current Products</h3>
                <asp:GridView ID="gvDashboard" runat="server" CssClass="data-table" AutoGenerateColumns="False" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ProductID"   HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="Price"       HeaderText="Price" DataFormatString="₱{0:N2}" />
                        <asp:BoundField DataField="SRP"         HeaderText="SRP"   DataFormatString="₱{0:N2}" />
                        <asp:BoundField DataField="Stocks"      HeaderText="Stocks" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- ADD PRODUCT -->
        <asp:Panel ID="pnlAddProduct" runat="server" Visible="false">
            <div class="page-header">
                <h2>Add New Product</h2>
                <p>SRP is auto-calculated as Price + 15%.</p>
            </div>
            <div class="panel">
                <h3>Product Details</h3>
                <div class="form-row">
                    <div class="form-group">
                        <label>Product ID</label>
                        <asp:TextBox ID="txtProductId" runat="server" placeholder="e.g. MSE" />
                    </div>
                    <div class="form-group">
                        <label>Product Name</label>
                        <asp:TextBox ID="txtProductName" runat="server" placeholder="e.g. Mouse" />
                    </div>
                    <div class="form-group">
                        <label>Price (₱)</label>
                        <asp:TextBox ID="txtPrice" runat="server" placeholder="e.g. 350.00" />
                    </div>
                    <div class="form-group">
                        <label>Stocks</label>
                        <asp:TextBox ID="txtStocks" runat="server" placeholder="e.g. 100" />
                    </div>
                </div>
                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn btn-blue" OnClick="btnAddProduct_Click" />
                <asp:Label ID="lblAddMsg" runat="server" />
            </div>
        </asp:Panel>

        <!-- ALL PRODUCTS -->
        <asp:Panel ID="pnlProducts" runat="server" Visible="false">
            <div class="page-header">
                <h2>All Products</h2>
            </div>
            <div class="panel">
                <asp:GridView ID="gvProducts" runat="server" CssClass="data-table" AutoGenerateColumns="False" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ProductID"   HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="Price"       HeaderText="Price"  DataFormatString="₱{0:N2}" />
                        <asp:BoundField DataField="SRP"         HeaderText="SRP"    DataFormatString="₱{0:N2}" />
                        <asp:BoundField DataField="Stocks"      HeaderText="Stocks" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- MEMBERS -->
        <asp:Panel ID="pnlMembers" runat="server" Visible="false">
            <div class="page-header">
                <h2>Member Records</h2>
            </div>
            <div class="panel">
                <asp:GridView ID="gvMembers" runat="server" CssClass="data-table" AutoGenerateColumns="False" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="UserID"         HeaderText="ID" />
                        <asp:BoundField DataField="Username"        HeaderText="Username" />
                        <asp:BoundField DataField="MembershipType"  HeaderText="Membership" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

        <!-- TRANSACTIONS -->
        <asp:Panel ID="pnlTransactions" runat="server" Visible="false">
            <div class="page-header">
                <h2>Transactions</h2>
            </div>
            <div class="panel">
                <asp:GridView ID="gvTransactions" runat="server" CssClass="data-table" AutoGenerateColumns="False" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="OrderID"        HeaderText="Order ID" />
                        <asp:BoundField DataField="Username"        HeaderText="Member" />
                        <asp:BoundField DataField="MembershipType"  HeaderText="Type" />
                        <asp:BoundField DataField="TotalAmount"     HeaderText="Total"  DataFormatString="₱{0:N2}" />
                        <asp:BoundField DataField="OrderDate"       HeaderText="Date"   DataFormatString="{0:MMM dd, yyyy}" />
                    </Columns>
                </asp:GridView>
            </div>
        </asp:Panel>

    </div>
</div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="NavBarContent">
    <div class="header">
        <div class="logo">
            Sales Inventory System
        </div>
        <div class="nav">
            <a href="AdminPage.aspx">Dashboard</a>
            <a href="LoginPage.aspx">Logout</a>
        </div>
    </div>
</asp:Content>