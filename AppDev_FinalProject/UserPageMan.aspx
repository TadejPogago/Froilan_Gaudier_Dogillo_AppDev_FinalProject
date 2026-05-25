<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserPageMan.aspx.cs" Inherits="AppDev_FinalProject.UserPageMan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    margin-bottom:15px;
}

.input-group label{
    display:block;
    margin-bottom:6px;
    font-size:14px;
    color:#475569;
}

.input-group input{
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

.message{
    margin-top:15px;
    text-align:center;
    font-size:14px;
    color:#475569;
}
</style>

<div class="profile-container">

    <div class="profile-card">

        <div class="profile-title">Profile Manager</div>

        <div class="input-group">
            <label>Current Password</label>
            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" />
        </div>

        <div class="input-group">
            <label>New Password</label>
            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" />
        </div>

        <div class="input-group">
            <label>Confirm New Password</label>
            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
        </div>

        <!-- UI ONLY BUTTON (NO CLICK EVENT YET) -->
        <asp:Button ID="btnChangePassword" runat="server" Text="Change Password" CssClass="btn-update" />

        <asp:Label ID="lblMessage" runat="server" CssClass="message" Text="" />

    </div>

</div>
</asp:Content>
