<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="AppDev_FinalProject.WebForm3" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
                <asp:Panel ID="Panel1" runat="server" style="padding:20px;">    
<style>
   .profile-container {
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
    margin-bottom:15px;
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
}

.btn-update{
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

.btn-update:hover{
    transform:scale(1.03);
}

    .message {
        margin-top: 15px;
        text-align: center;
        font-size: 14px;
        color: #475569;
    }

</style>


<div class="profile-container">
    <div class="profile-card">
        <div class="profile-title">
            Create Account
        </div>



        <div class="input-group">
            <label>Username</label>
            <asp:TextBox ID="txtUser" runat="server" CssClass="textbox" placeholder="Username" />
        </div>



        <div class="input-group">
            <label>Password</label>
            <asp:TextBox ID="txtPass" runat="server" CssClass="textbox" placeholder="Password" TextMode="Password" />
        </div>



        <div class="input-group">
            <label>Membership Type</label>
            <asp:DropDownList ID="ddlMembership" runat="server" CssClass="textbox" Width="470px">
                <asp:ListItem>Silver</asp:ListItem>
                <asp:ListItem>Gold</asp:ListItem>
                <asp:ListItem>Platinum</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-update" OnClick="btnRegister_Click" />
    </div>
</div>
</asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="NavBarContent">



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


