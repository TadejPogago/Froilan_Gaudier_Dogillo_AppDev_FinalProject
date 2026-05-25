<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="AppDev_FinalProject.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background: #f4f7fb;
}

.admin-wrapper {
    display: flex;
    min-height: calc(100vh - 60px);
}

.sidebar {
    width: 260px;
    background: #1e293b;
    color: white;
    padding: 30px 0;
    flex-shrink: 0;
    position: sticky;
    top: 0;
    height: 100vh;
}

.sidebar-title {
    font-size: 13px;
    font-weight: 600;
    letter-spacing: 2px;
    color: #94a3b8;
    text-transform: uppercase;
    padding: 0 25px 15px;
    border-bottom: 1px solid #334155;
    margin-bottom: 15px;
}

.sidebar-nav a {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 13px 25px;
    color: #cbd5e1;
    text-decoration: none;
    font-size: 15px;
    transition: all 0.2s ease;
    border-left: 3px solid transparent;
}

.sidebar-nav a:hover,
.sidebar-nav a.active {
    background: rgba(37, 99, 235, 0.15);
    color: #38bdf8;
    border-left-color: #38bdf8;
}

.sidebar-nav a .nav-icon {
    font-size: 18px;
    width: 22px;
    text-align: center;
}

.sidebar-divider {
    border: none;
    border-top: 1px solid #334155;
    margin: 15px 0;
}

.main-content {
    flex: 1;
    padding: 35px 40px;
    overflow-y: auto;
}

.page-header {
    margin-bottom: 35px;
}

.page-header h1 {
    font-size: 32px;
    font-weight: 700;
    color: #0f172a;
}

.page-header p {
    color: #64748b;
    font-size: 15px;
    margin-top: 5px;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 35px;
}

.stat-card {
    background: white;
    border-radius: 18px;
    padding: 25px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    display: flex;
    align-items: center;
    gap: 18px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.stat-card:hover {
    transform: translateY(-4px);
    box-shadow: 0 10px 30px rgba(37,99,235,0.12);
}

.stat-icon {
    width: 54px;
    height: 54px;
    border-radius: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    flex-shrink: 0;
}

.stat-icon.blue   { background: #eff6ff; }
.stat-icon.green  { background: #f0fdf4; }
.stat-icon.orange { background: #fff7ed; }
.stat-icon.purple { background: #f5f3ff; }

.stat-info h3 {
    font-size: 26px;
    font-weight: 700;
    color: #0f172a;
    line-height: 1;
}

.stat-info p {
    font-size: 13px;
    color: #64748b;
    margin-top: 4px;
}

.section-panel {
    background: white;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    margin-bottom: 30px;
}

.panel-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
    padding-bottom: 18px;
    border-bottom: 2px solid #f1f5f9;
}

.panel-header h2 {
    font-size: 20px;
    font-weight: 700;
    color: #0f172a;
}

.btn-primary {
    padding: 11px 22px;
    border: none;
    border-radius: 10px;
    background: linear-gradient(135deg, #2563eb, #3b82f6);
    color: white;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s ease;
    font-family: 'Poppins', sans-serif;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #1d4ed8, #2563eb);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(37,99,235,0.3);
}

.btn-danger {
    padding: 8px 16px;
    border: none;
    border-radius: 8px;
    background: #fee2e2;
    color: #dc2626;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s ease;
    font-family: 'Poppins', sans-serif;
}

.btn-danger:hover { background: #fecaca; }

.btn-edit {
    padding: 8px 16px;
    border: none;
    border-radius: 8px;
    background: #eff6ff;
    color: #2563eb;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s ease;
    font-family: 'Poppins', sans-serif;
    margin-right: 6px;
}

.btn-edit:hover { background: #dbeafe; }

.form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
    margin-bottom: 20px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 7px;
}

.form-group label {
    font-size: 13px;
    font-weight: 600;
    color: #374151;
}

.form-group input,
.form-group select {
    padding: 12px 15px;
    border: 2px solid #e2e8f0;
    border-radius: 10px;
    font-size: 14px;
    color: #0f172a;
    font-family: 'Poppins', sans-serif;
    outline: none;
    transition: border-color 0.2s ease;
    background: #f8fafc;
}

.form-group input:focus,
.form-group select:focus {
    border-color: #3b82f6;
    background: white;
}

.data-table {
    width: 100%;
    border-collapse: collapse;
}

.data-table thead th {
    background: #f8fafc;
    padding: 13px 16px;
    text-align: left;
    font-size: 13px;
    font-weight: 600;
    color: #64748b;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    border-bottom: 2px solid #e2e8f0;
}

.data-table tbody tr {
    border-bottom: 1px solid #f1f5f9;
    transition: background 0.15s ease;
}

.data-table tbody tr:hover { background: #f8faff; }

.data-table tbody td {
    padding: 14px 16px;
    font-size: 14px;
    color: #334155;
}

.badge {
    display: inline-block;
    padding: 4px 11px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.badge-silver   { background: #f1f5f9; color: #64748b; }
.badge-gold     { background: #fef9c3; color: #a16207; }
.badge-platinum { background: #ede9fe; color: #7c3aed; }
.badge-green    { background: #dcfce7; color: #16a34a; }

.bar-chart {
    display: flex;
    align-items: flex-end;
    gap: 18px;
    height: 180px;
    padding: 0 10px;
    justify-content: center;
}

.bar-group {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 8px;
}

.bar {
    width: 50px;
    border-radius: 8px 8px 0 0;
    background: linear-gradient(180deg, #3b82f6, #2563eb);
    transition: opacity 0.2s ease;
}

.bar:hover { opacity: 0.8; }

.bar-label {
    font-size: 12px;
    color: #64748b;
    font-weight: 600;
    text-align: center;
}

.bar-value {
    font-size: 12px;
    font-weight: 700;
    color: #2563eb;
}

.tabs {
    display: flex;
    gap: 8px;
    margin-bottom: 25px;
}

.tab-btn {
    padding: 9px 20px;
    border: 2px solid #e2e8f0;
    border-radius: 9px;
    background: white;
    color: #64748b;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.2s ease;
    font-family: 'Poppins', sans-serif;
}

.tab-btn.active,
.tab-btn:hover {
    background: linear-gradient(135deg, #2563eb, #3b82f6);
    color: white;
    border-color: transparent;
}

.tab-content { display: none; }
.tab-content.active { display: block; }

.sales-banner {
    background: linear-gradient(135deg, #1e293b, #2563eb);
    border-radius: 18px;
    padding: 28px 35px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    color: white;
}

.sales-banner h2 {
    font-size: 16px;
    font-weight: 500;
    opacity: 0.8;
    margin-bottom: 6px;
}

.sales-banner .amount {
    font-size: 42px;
    font-weight: 700;
}

.sales-banner .sub {
    font-size: 13px;
    opacity: 0.6;
    margin-top: 4px;
}

@media (max-width: 900px) {
    .admin-wrapper { flex-direction: column; }
    .sidebar { width: 100%; height: auto; position: relative; }
    .sidebar-nav { display: flex; flex-wrap: wrap; }
    .sidebar-nav a { padding: 10px 18px; border-left: none; border-bottom: 3px solid transparent; }
    .main-content { padding: 25px 20px; }
    .sales-banner { flex-direction: column; gap: 15px; text-align: center; }
}
</style>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />

<div class="admin-wrapper">

    <div class="sidebar">
        <div class="sidebar-title">Admin Panel</div>
        <nav class="sidebar-nav">
            <a href="#" class="active" onclick="showSection('dashboard'); return false;">
                <span class="nav-icon">📊</span> Dashboard
            </a>
            <a href="#" onclick="showSection('add-product'); return false;">
                <span class="nav-icon">➕</span> Add New Product
            </a>
            <hr class="sidebar-divider" />
            <a href="#" onclick="showSection('products'); return false;">
                <span class="nav-icon">📦</span> All Products
            </a>
            <a href="#" onclick="showSection('members'); return false;">
                <span class="nav-icon">👥</span> Member Records
            </a>
            <a href="#" onclick="showSection('transactions'); return false;">
                <span class="nav-icon">🧾</span> Transactions
            </a>
            <hr class="sidebar-divider" />
            <a href="#" onclick="showSection('reports'); return false;">
                <span class="nav-icon">📈</span> Report Module
            </a>
            <hr class="sidebar-divider" />
            <a href="LoginPage.aspx">
                <span class="nav-icon">🚪</span> Logout
            </a>
        </nav>
    </div>

    <div class="main-content">

        <!-- DASHBOARD -->
        <div id="section-dashboard" class="section-view">
            <div class="page-header">
                <h1>Admin Dashboard</h1>
                <p>Welcome back! Here's an overview of the Sales &amp; Inventory System.</p>
            </div>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-icon blue">📦</div>
                    <div class="stat-info"><h3>5</h3><p>Total Products</p></div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon green">👥</div>
                    <div class="stat-info">
                        <h3><asp:Label ID="lblMemberCount" runat="server" Text="0" /></h3>
                        <p>Registered Members</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon orange">🧾</div>
                    <div class="stat-info">
                        <h3><asp:Label ID="lblTxnCount" runat="server" Text="0" /></h3>
                        <p>Transactions</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon purple">💰</div>
                    <div class="stat-info">
                        <h3>₱<asp:Label ID="lblTotalSales" runat="server" Text="0.00" /></h3>
                        <p>Total Sales</p>
                    </div>
                </div>
            </div>

            <div class="section-panel">
                <div class="panel-header">
                    <h2>Stock Overview</h2>
                    <asp:Button ID="btnGoAddProduct" runat="server" Text="+ Add Product"
                        CssClass="btn-primary"
                        OnClientClick="showSection('add-product'); return false;" />
                </div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Product ID</th><th>Product Name</th>
                            <th>Price</th><th>SRP</th><th>Stocks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>MSE</td><td>Mouse</td><td>₱350.00</td><td>₱402.50</td><td><span class="badge badge-green">100</span></td></tr>
                        <tr><td>PRN</td><td>Printer Ink</td><td>₱7,500.00</td><td>₱8,625.00</td><td><span class="badge badge-green">100</span></td></tr>
                        <tr><td>PRNDT</td><td>Printer Dot Matrix</td><td>₱5,000.00</td><td>₱5,750.00</td><td><span class="badge badge-green">100</span></td></tr>
                        <tr><td>MNTRLc</td><td>LCD Monitor</td><td>₱6,500.00</td><td>₱7,475.00</td><td><span class="badge badge-green">100</span></td></tr>
                        <tr><td>MNTRLe</td><td>LED Monitor</td><td>₱7,500.00</td><td>₱8,625.00</td><td><span class="badge badge-green">100</span></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- ADD NEW PRODUCT -->
        <div id="section-add-product" class="section-view" style="display:none;">
            <div class="page-header">
                <h1>Add New Product</h1>
                <p>Fill in the details below to add a product to the inventory.</p>
            </div>
            <div class="section-panel">
                <div class="panel-header"><h2>Product Details</h2></div>
                <div class="form-grid">
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
                        <asp:TextBox ID="txtPrice" runat="server" placeholder="e.g. 350.00" TextMode="Number" />
                    </div>
                    <div class="form-group">
                        <label>Stocks</label>
                        <asp:TextBox ID="txtStocks" runat="server" placeholder="e.g. 100" TextMode="Number" />
                    </div>
                </div>
                <asp:Label ID="lblSRPPreview" runat="server"
                    style="display:block; margin-bottom:20px; color:#64748b; font-size:14px;">
                    SRP will be calculated automatically (Price + 15%).
                </asp:Label>
                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product"
                    CssClass="btn-primary" OnClick="btnAddProduct_Click" />
                <asp:Label ID="lblAddMsg" runat="server"
                    style="display:block; margin-top:15px; font-size:14px;" />
            </div>
        </div>

        <!-- ALL PRODUCTS -->
        <div id="section-products" class="section-view" style="display:none;">
            <div class="page-header">
                <h1>All Products</h1>
                <p>View and manage your full product catalog.</p>
            </div>
            <div class="section-panel">
                <div class="panel-header">
                    <h2>Product List</h2>
                    <asp:Button ID="btnAddProduct2" runat="server" Text="+ Add Product"
                        CssClass="btn-primary"
                        OnClientClick="showSection('add-product'); return false;" />
                </div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Product ID</th><th>Name</th><th>Price</th>
                            <th>SRP</th><th>Stocks</th><th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>MSE</td><td>Mouse</td><td>₱350.00</td><td>₱402.50</td><td>100</td>
                            <td><button class="btn-edit">Edit</button><button class="btn-danger">Delete</button></td></tr>
                        <tr><td>PRN</td><td>Printer Ink</td><td>₱7,500.00</td><td>₱8,625.00</td><td>100</td>
                            <td><button class="btn-edit">Edit</button><button class="btn-danger">Delete</button></td></tr>
                        <tr><td>PRNDT</td><td>Printer Dot Matrix</td><td>₱5,000.00</td><td>₱5,750.00</td><td>100</td>
                            <td><button class="btn-edit">Edit</button><button class="btn-danger">Delete</button></td></tr>
                        <tr><td>MNTRLc</td><td>LCD Monitor</td><td>₱6,500.00</td><td>₱7,475.00</td><td>100</td>
                            <td><button class="btn-edit">Edit</button><button class="btn-danger">Delete</button></td></tr>
                        <tr><td>MNTRLe</td><td>LED Monitor</td><td>₱7,500.00</td><td>₱8,625.00</td><td>100</td>
                            <td><button class="btn-edit">Edit</button><button class="btn-danger">Delete</button></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- MEMBER RECORDS -->
        <div id="section-members" class="section-view" style="display:none;">
            <div class="page-header">
                <h1>Member Records</h1>
                <p>All registered users and their membership types.</p>
            </div>
            <div class="section-panel">
                <div class="panel-header"><h2>Members</h2></div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Member ID</th><th>Full Name</th><th>Email</th>
                            <th>Membership</th><th>Date Registered</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Literal ID="litMembers" runat="server"></asp:Literal>
                        <tr><td>001</td><td>Juan dela Cruz</td><td>juan@example.com</td>
                            <td><span class="badge badge-silver">Silver</span></td><td>2026-01-10</td></tr>
                        <tr><td>002</td><td>Maria Santos</td><td>maria@example.com</td>
                            <td><span class="badge badge-gold">Gold</span></td><td>2026-02-14</td></tr>
                        <tr><td>003</td><td>Pedro Reyes</td><td>pedro@example.com</td>
                            <td><span class="badge badge-platinum">Platinum</span></td><td>2026-03-01</td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- TRANSACTIONS -->
        <div id="section-transactions" class="section-view" style="display:none;">
            <div class="page-header">
                <h1>Transactions</h1>
                <p>Complete history of all orders and purchases.</p>
            </div>
            <div class="section-panel">
                <div class="panel-header"><h2>Transaction Log</h2></div>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Txn ID</th><th>Date &amp; Time</th><th>Member</th>
                            <th>Products</th><th>Subtotal</th><th>VAT (10%)</th>
                            <th>Discount</th><th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Literal ID="litTransactions" runat="server"></asp:Literal>
                        <tr>
                            <td>#TXN001</td><td>2026-05-25 09:14 AM</td><td>Maria Santos</td>
                            <td>Mouse × 2, LCD Monitor × 1</td>
                            <td>₱7,200.00</td><td>₱720.00</td><td>₱0.00</td><td>₱7,920.00</td>
                        </tr>
                        <tr>
                            <td>#TXN002</td><td>2026-05-25 11:30 AM</td><td>Pedro Reyes</td>
                            <td>LED Monitor × 2</td>
                            <td>₱15,000.00</td><td>₱1,500.00</td><td>₱2,475.00</td><td>₱14,025.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- REPORT MODULE -->
        <div id="section-reports" class="section-view" style="display:none;">
            <div class="page-header">
                <h1>Report Module</h1>
                <p>Sales summary, stock chart, and membership breakdown.</p>
            </div>

            <div class="sales-banner">
                <div>
                    <h2>Total Sales Revenue</h2>
                    <div class="amount">₱<asp:Label ID="lblReportSales" runat="server" Text="21,945.00" /></div>
                    <div class="sub">As of <asp:Label ID="lblReportDate" runat="server" /></div>
                </div>
                <div>
                    <asp:Button ID="btnPrintReport" runat="server" Text="🖨 Print Report"
                        CssClass="btn-primary"
                        OnClientClick="window.print(); return false;" />
                </div>
            </div>

            <div class="section-panel">
                <div class="tabs">
                    <button class="tab-btn active" onclick="switchTab(this,'tab-chart')">📊 Stock Chart</button>
                    <button class="tab-btn" onclick="switchTab(this,'tab-sales')">💰 Total Sales</button>
                    <button class="tab-btn" onclick="switchTab(this,'tab-membership')">👥 Members by Type</button>
                </div>

                <div id="tab-chart" class="tab-content active">
                    <h3 style="margin-bottom:20px; color:#0f172a; font-size:17px;">Available Stock per Product</h3>
                    <div class="bar-chart">
                        <div class="bar-group">
                            <div class="bar-value">100</div>
                            <div class="bar" style="height:140px;"></div>
                            <div class="bar-label">Mouse</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar-value">100</div>
                            <div class="bar" style="height:140px;"></div>
                            <div class="bar-label">Printer<br/>Ink</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar-value">100</div>
                            <div class="bar" style="height:140px;"></div>
                            <div class="bar-label">Dot<br/>Matrix</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar-value">100</div>
                            <div class="bar" style="height:140px;"></div>
                            <div class="bar-label">LCD<br/>Monitor</div>
                        </div>
                        <div class="bar-group">
                            <div class="bar-value">100</div>
                            <div class="bar" style="height:140px;"></div>
                            <div class="bar-label">LED<br/>Monitor</div>
                        </div>
                    </div>
                </div>

                <div id="tab-sales" class="tab-content">
                    <h3 style="margin-bottom:20px; color:#0f172a; font-size:17px;">Sales Summary</h3>
                    <table class="data-table">
                        <thead>
                            <tr><th>Product Name</th><th>Units Sold</th><th>Revenue</th></tr>
                        </thead>
                        <tbody>
                            <asp:Literal ID="litSalesReport" runat="server"></asp:Literal>
                            <tr><td>Mouse</td><td>2</td><td>₱700.00</td></tr>
                            <tr><td>LCD Monitor</td><td>1</td><td>₱6,500.00</td></tr>
                            <tr><td>LED Monitor</td><td>2</td><td>₱15,000.00</td></tr>
                        </tbody>
                        <tfoot>
                            <tr style="font-weight:700; color:#2563eb; border-top:2px solid #e2e8f0;">
                                <td colspan="2" style="padding:14px 16px;">Grand Total</td>
                                <td style="padding:14px 16px;">
                                    ₱<asp:Label ID="lblGrandTotal" runat="server" Text="22,200.00" />
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

                <div id="tab-membership" class="tab-content">
                    <h3 style="margin-bottom:20px; color:#0f172a; font-size:17px;">Members per Membership Type</h3>
                    <table class="data-table">
                        <thead>
                            <tr><th>Membership</th><th>Discount</th><th>Members</th><th>Names</th></tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="badge badge-silver">Silver</span></td>
                                <td>5%</td><td>1</td><td>Juan dela Cruz</td>
                            </tr>
                            <tr>
                                <td><span class="badge badge-gold">Gold</span></td>
                                <td>10%</td><td>1</td><td>Maria Santos</td>
                            </tr>
                            <tr>
                                <td><span class="badge badge-platinum">Platinum</span></td>
                                <td>15%</td><td>1</td><td>Pedro Reyes</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    function showSection(name) {
        document.querySelectorAll('.section-view').forEach(function (el) {
            el.style.display = 'none';
        });
        var target = document.getElementById('section-' + name);
        if (target) target.style.display = 'block';
        document.querySelectorAll('.sidebar-nav a').forEach(function (a) {
            a.classList.remove('active');
        });
        if (event.currentTarget) event.currentTarget.classList.add('active');
    }

    function switchTab(btn, tabId) {
        document.querySelectorAll('.tab-btn').forEach(function (b) { b.classList.remove('active'); });
        document.querySelectorAll('.tab-content').forEach(function (t) { t.classList.remove('active'); });
        btn.classList.add('active');
        document.getElementById(tabId).classList.add('active');
    }

    window.onload = function () {
        var lbl = document.getElementById('<%= lblReportDate.ClientID %>');
        if (lbl) lbl.innerText = new Date().toLocaleDateString('en-PH', {
            year: 'numeric', month: 'long', day: 'numeric',
            hour: '2-digit', minute: '2-digit'
        });
    };
</script>

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="NavBarContent">
    <div class="header">
        <div class="logo">
            Sales Inventory System
        </div>
        <div class="nav">
            <a href="AdminPage.aspx">Dashboard</a>
            <a href="HomePage.aspx">Logout</a>
        </div>
    </div>
</asp:Content>
