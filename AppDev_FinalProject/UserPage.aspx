<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="AppDev_FinalProject.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins', sans-serif;
}

body{
    background:#f4f7fb;
}

/* PAGE TITLE */
.page-title{
    font-size:40px;
    font-weight:700;
    color:#1e293b;
    margin-bottom:40px;
    text-align:center;
}

/* USER PAGE */
.user-page{
    width:100%;
    padding:40px;
}

/* PRODUCTS GRID */
.products-container{
    display:grid;
    grid-template-columns:repeat(auto-fit, minmax(280px, 1fr));
    gap:30px;
}

/* PRODUCT CARD */
.product-card{
    background:white;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
    transition:0.3s ease;
    position:relative;
}

.product-card:hover{
    transform:translateY(-10px);
    box-shadow:0 15px 35px rgba(37,99,235,0.2);
}

/* IMAGE */
.product-image{
    width:100%;
    height:220px;
    background:#eef2ff;
    display:flex;
    justify-content:center;
    align-items:center;
}

.product-image img{
    width:170px;
    height:170px;
    object-fit:contain;
    transition:0.3s ease;
}

.product-card:hover img{
    transform:scale(1.08);
}

/* INFO */
.product-info{
    padding:25px;
}

.product-info h2{
    font-size:24px;
    color:#0f172a;
    margin-bottom:10px;
}

.product-id{
    color:#64748b;
    font-size:14px;
    margin-bottom:15px;
}

.price{
    font-size:28px;
    font-weight:700;
    color:#2563eb;
    margin-bottom:15px;
}

.stocks,
.srp{
    font-size:15px;
    color:#475569;
    margin-bottom:8px;
}

/* BUTTON */
.btn-primary{
    width:100%;
    margin-top:20px;
    padding:14px;
    border:none;
    border-radius:12px;
    background:linear-gradient(135deg,#2563eb,#3b82f6);
    color:white;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:0.3s ease;
}

.btn-primary:hover{
    background:linear-gradient(135deg,#1d4ed8,#2563eb);
    transform:scale(1.03);
}

/* RESPONSIVE */
@media(max-width:768px){

    .page-title{
        font-size:30px;
    }

    .user-page{
        padding:20px;
    }

}
    </style>

<div class="user-page">

    <h1 class="page-title">
        Hello User, Welcome to our Store!   
    </h1>

    <div class="products-container">

        <!-- PRODUCT 1 -->
        <div class="product-card">
            <div class="product-info">

                <h2>Mouse</h2>

                <p class="product-id">
                    Product ID: MSE
                </p>

                <p class="price">
                    ₱350.00
                </p>

                <p class="stocks">
                    Stocks: 100
                </p>

                <p class="srp">
                    SRP: ₱402.50
                </p>

                <asp:Button
                    ID="btnMouse"
                    runat="server"
                    Text="Add To Cart"
                    CssClass="btn-primary" />

            </div>

        </div>

        <!-- PRODUCT 2 -->
        <div class="product-card">
            <div class="product-info">

                <h2>Printer Ink</h2>

                <p class="product-id">
                    Product ID: PRN
                </p>

                <p class="price">
                    ₱7500.00
                </p>

                <p class="stocks">
                    Stocks: 100
                </p>

                <p class="srp">
                    SRP: ₱8625.00
                </p>

                <asp:Button
                    ID="btnInk"
                    runat="server"
                    Text="Add To Cart"
                    CssClass="btn-primary" />

            </div>

        </div>

        <!-- PRODUCT 3 -->
        <div class="product-card">
            <div class="product-info">

                <h2>Printer Dot Matrix</h2>

                <p class="product-id">
                    Product ID: PRNDT
                </p>

                <p class="price">
                    ₱5000.00
                </p>

                <p class="stocks">
                    Stocks: 100
                </p>

                <p class="srp">
                    SRP: ₱5750.00
                </p>

                <asp:Button
                    ID="btnPrinter"
                    runat="server"
                    Text="Add To Cart"
                    CssClass="btn-primary" />

            </div>

        </div>

        <!-- PRODUCT 4 -->
        <div class="product-card">
            <div class="product-info">

                <h2>LCD Monitor</h2>

                <p class="product-id">
                    Product ID: MNTRLc
                </p>

                <p class="price">
                    ₱6500.00
                </p>

                <p class="stocks">
                    Stocks: 100
                </p>

                <p class="srp">
                    SRP: ₱7475.00
                </p>

                <asp:Button
                    ID="btnLCD"
                    runat="server"
                    Text="Add To Cart"
                    CssClass="btn-primary" />

            </div>

        </div>

        <!-- PRODUCT 5 -->
        <div class="product-card">
            <div class="product-info">

                <h2>LED Monitor</h2>

                <p class="product-id">
                    Product ID: MNTRLe
                </p>

                <p class="price">
                    ₱7500.00
                </p>

                <p class="stocks">
                    Stocks: 100
                </p>

                <p class="srp">
                    SRP: ₱8625.00
                </p>

                <asp:Button
                    ID="btnLED"
                    runat="server"
                    Text="Add To Cart"
                    CssClass="btn-primary" />

            </div>

        </div>

    </div>

</div>
</asp:Content>
