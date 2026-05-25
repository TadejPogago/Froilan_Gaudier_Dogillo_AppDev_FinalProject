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

    <asp:TextBox
        ID="txtPassword"
        runat="server"
        CssClass="textbox"
        TextMode="Password"
        placeholder="Password" OnTextChanged="txtPassword_TextChanged" />

    <asp:Button
        ID="btnLogin"
        runat="server"
        Text="Login"
        CssClass="btn-primary" />

</div>
   </asp:Panel>
</asp:Content>

