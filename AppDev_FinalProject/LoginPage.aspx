<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AppDev_FinalProject.WebForm2" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Panel ID="Panel1"
 runat="server"
 style="padding:20px;">
    <div class="form-card">

    <h2>Login</h2>

    <asp:TextBox
        ID="txtUsername"
        runat="server"
        CssClass="textbox"
        placeholder="Username" />

        <br />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" OnTextChanged="txtPassword_TextChanged" placeholder="Password" TextMode="Password" />
        <br />
        <asp:Button ID="btnLogin" runat="server" CssClass="btn-primary" Text="Login" />
        <asp:LinkButton ID="LinkReg" runat="server">Register Here</asp:LinkButton>

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
           <a href="RegisterPage.aspx">Register</a>
        </div>
    </div>
</asp:Content>


