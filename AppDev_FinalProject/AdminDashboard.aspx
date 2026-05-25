<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="AppDev_FinalProject.WebForm4" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <asp:Panel ID="Panel1" runat="server" style="padding:20px;">    
                    <h2>Admin Dashboard</h2>

<div class="dashboard">

    <div class="card">
        <h3>Total Products</h3>
        <h1><asp:Label ID="lbltotalProducts" runat="server" Text="Label"></asp:Label></h1>
    </div>

    <div class="card">
        <h3>Total Members</h3>
        <h1><asp:Label ID="lbltotalmember" runat="server" Text="Label"></asp:Label></h1>
    </div>

    <div class="card">
        <h3>Total Sales</h3>
        <h1><asp:Label ID="lbltotalsales" runat="server" Text="Label"></asp:Label></h1>
    </div>

</div>
                    
    <h2>Add Product</h2>

    <asp:TextBox
        runat="server"
        CssClass="textbox"
        placeholder="Product Name" />

                        <br />

    <asp:TextBox
        runat="server"
        CssClass="textbox"
        placeholder="Price" />

                        <br />
                        <asp:TextBox runat="server" CssClass="textbox" placeholder="Stocks" />
                        <br />
                        <asp:Button runat="server" CssClass="btn-primary" Text="Save Product" />
                        <br />



                </asp:Panel>
            </asp:Content>

