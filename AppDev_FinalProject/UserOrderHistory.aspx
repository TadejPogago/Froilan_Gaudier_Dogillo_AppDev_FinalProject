<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserOrderHistory.aspx.cs" Inherits="AppDev_FinalProject.UserOrderHistory" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:#f4f7fb;
}

/* PAGE */
.history-page{
    width:100%;
    min-height:100vh;
    padding:50px;
}

/* TITLE */
.history-title{
    font-size:40px;
    font-weight:700;
    color:#0f172a;
    margin-bottom:35px;
}

/* CARD */
.history-card{
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

/* TABLE */
.history-table{
    width:100%;
    border-collapse:collapse;
}

.history-table th{
    background:#2563eb;
    color:white;
    padding:18px;
    text-align:left;
    font-size:15px;
}

.history-table td{
    padding:18px;
    border-bottom:1px solid #e2e8f0;
    color:#334155;
    font-size:15px;
}

.history-table tr:hover{
    background:#f8fafc;
}

/* TOTAL */
.total-text{
    color:#2563eb;
    font-weight:700;
}

/* EMPTY */
.empty-message{
    text-align:center;
    padding:40px;
    color:#64748b;
    font-size:18px;
}

@media(max-width:768px){

    .history-page{
        padding:20px;
    }

    .history-title{
        font-size:30px;
    }

    .history-card{
        overflow:auto;
    }

    .history-table{
        min-width:700px;
    }

}

</style>

<div class="history-page">

    <h1 class="history-title">
        Order History
    </h1>

    <div class="history-card">

        <asp:GridView
            ID="gvOrders"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="history-table"
            GridLines="None"
            EmptyDataText="No Order History Found">

            <Columns>

                <asp:BoundField
                    DataField="OrderID"
                    HeaderText="Order ID" />

                <asp:BoundField
                    DataField="ProductName"
                    HeaderText="Product Name" />

                <asp:BoundField
                    DataField="Price"
                    HeaderText="Price"
                    DataFormatString="₱{0:N2}" />

                <asp:BoundField
                    DataField="Quantity"
                    HeaderText="Quantity" />

                <asp:BoundField
                    DataField="Total"
                    HeaderText="Total"
                    DataFormatString="₱{0:N2}" />

                <asp:BoundField
                    DataField="OrderDate"
                    HeaderText="Transaction Date"
                    DataFormatString="{0:MMMM dd, yyyy hh:mm tt}" />

            </Columns>

        </asp:GridView>

    </div>

</div>

</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="NavBarContent">
    <div class="header">
        <div class="logo">
            Sales Inventory System
        </div>
        <div class="nav">
            <a href="UserPage.aspx">Dashboard</a>
            <a href="UserOrderHistory.aspx">OrderHistory</a>
            <a href="UserPageMan.aspx">Profile</a> 
            <a href="HomePage.aspx">Logout</a>
        </div>
    </div>
</asp:Content>

