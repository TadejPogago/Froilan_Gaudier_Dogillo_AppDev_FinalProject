<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="AppDev_FinalProject.WebForm2" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <asp:Panel ID="Panel1" runat="server" style="padding:20px;">

<style>

.profile-container{
    width:100%;
    min-height:100vh;
    padding:50px;
    background:#f4f7fb;
    display:flex;
    justify-content:center;
    align-items:flex-start;
    font-family:'Poppins', sans-serif;
}

.profile-card{
    width:450px;
    background:white;
    border-radius:20px;
    padding:40px;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
}

.profile-title{
    font-size:30px;
    font-weight:700;
    margin-bottom:25px;
    color:#0f172a;
    text-align:center;
}

.input-group{
    margin-bottom:20px;
}

.input-group label{
    display:block;
    margin-bottom:6px;
    font-size:14px;
    color:#475569;
}

.textbox{
    width:100%;
    padding:12px;
    border:1px solid #e2e8f0;
    border-radius:10px;
    outline:none;
    font-size:15px;
}

.textbox:focus{
    border-color:#2563eb;
}

.btn-primary{
    width:100%;
    padding:12px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#2563eb,#3b82f6);
    color:white;
    font-weight:600;
    cursor:pointer;
    margin-top:10px;
    transition:0.3s;
}

.btn-primary:hover{
    transform:scale(1.03);
}

.register-link{
    display:block;
    margin-top:18px;
    text-align:center;
    color:#2563eb;
    text-decoration:none;
    font-size:14px;
    font-weight:500;
}

.register-link:hover{
    text-decoration:underline;
}

</style>

<div class="profile-container">

    <div class="profile-card">

        <div class="profile-title">
            Login
        </div>

        <div class="input-group">
            <label>Username</label>

            <asp:TextBox
                ID="txtUsername"
                runat="server"
                CssClass="textbox"
                placeholder="Enter Username" />
        </div>

        <div class="input-group">
            <label>Password</label>

            <asp:TextBox
                ID="txtPassword"
                runat="server"
                CssClass="textbox"
                placeholder="Enter Password"
                TextMode="Password"
                OnTextChanged="txtPassword_TextChanged" />
        </div>

        <asp:Button
            ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn-primary"
            OnClick="btnLogin_Click" />

        <asp:LinkButton
            ID="LinkReg"
            runat="server"
            CssClass="register-link"
            OnClick="LinkReg_Click">
            Register Here
        </asp:LinkButton>

    </div>

</div>

    </asp:Panel>

</asp:Content>

<asp:Content ID="Content2"
runat="server"
ContentPlaceHolderID="NavBarContent">

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

