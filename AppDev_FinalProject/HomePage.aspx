<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="AppDev_FinalProject.WebForm1" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
            <asp:Panel ID="Panel1"
    runat="server"
    style="padding:20px;">
    <div class="hero">

    <h1>Sales & Inventory System</h1>

    <p>
        Manage products, orders, inventory and sales in one place.
    </p>

</div>

<div class="feature-grid">

    <div class="card">
        <h3>Fast Ordering</h3>
        <p>Purchase products easily.</p>
    </div>

    <div class="card">
        <h3>Inventory Tracking</h3>
        <p>Monitor available stocks.</p>
    </div>

    <div class="card">
        <h3>Sales Reports</h3>
        <p>Generate sales summaries.</p>
    </div>
</div>
 </asp:Panel>
</asp:Content>


<asp:Content ID="Content2" runat="server" contentplaceholderid="NavBarContent">
    <div class="header">
        <div class="logo">
            Sales Inventory System
        </div>
        <div class="nav">
            <a href="HomePage.aspx">Home</a>
            <a href="LoginPage.aspx">Login</a> 
            <a href="RegisterPage.aspx">Register</a> 
        </div>
    </div>
</asp:Content>



