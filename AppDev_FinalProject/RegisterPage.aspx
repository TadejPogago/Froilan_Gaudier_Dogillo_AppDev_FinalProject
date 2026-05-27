<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="AppDev_FinalProject.WebForm3" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <asp:Panel ID="Panel1" runat="server" style="padding:20px;">    

<div class="form-card">

    <h2>Create Account</h2>

    <asp:TextBox
        ID="txtUser"
        runat="server"
        CssClass="textbox"
        placeholder="Username" />

    <br />
    <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" placeholder="Password" TextMode="Password" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Member Type"></asp:Label>
    <asp:DropDownList ID="ddlMembership" runat="server" CssClass="textbox">
        <asp:ListItem>Silver</asp:ListItem>
        <asp:ListItem>Gold</asp:ListItem>
        <asp:ListItem>Platinum</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Button ID="btnRegister" runat="server" CssClass="btn-primary" Text="Register" OnClick="btnRegister_Click" />

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
        </div>
    </div>
</asp:Content>


