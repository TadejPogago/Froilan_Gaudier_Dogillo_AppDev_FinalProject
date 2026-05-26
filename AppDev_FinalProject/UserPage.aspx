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
            .checkout-page{
        padding:40px;
        background:#f4f7fb;
        min-height:100vh;
    }

    .checkout-title{
        font-size:40px;
        font-weight:700;
        color:#0f172a;
        margin-bottom:40px;
    }

    /* LAYOUT */
    .checkout-container{
        display:grid;
        grid-template-columns:2fr 1fr;
        gap:30px;
    }

    /* PRODUCTS */
    .checkout-products{
        background:white;
        border-radius:20px;
        padding:25px;
        box-shadow:0 10px 25px rgba(0,0,0,0.08);
    }

    .checkout-header{
        display:grid;
        grid-template-columns:2fr 1fr 1fr 1fr;
        padding-bottom:20px;
        border-bottom:2px solid #e2e8f0;
        font-weight:600;
        color:#475569;
    }

    /* ITEM */
    .checkout-item{
        display:grid;
        grid-template-columns:2fr 1fr 1fr 1fr;
        align-items:center;
        padding:25px 0;
        border-bottom:1px solid #e2e8f0;
    }

    .product-details{
        display:flex;
        align-items:center;
        gap:20px;
    }

    .product-details img{
        width:90px;
        height:90px;
        object-fit:contain;
        background:#eef2ff;
        padding:10px;
        border-radius:12px;
    }

    .product-details h3{
        font-size:20px;
        color:#0f172a;
    }

    .product-details p{
        color:#64748b;
        font-size:14px;
    }

    .product-price,
    .product-qty,
    .product-total{
        font-size:18px;
        font-weight:600;
        color:#1e293b;
    }

    /* SUMMARY */
    .summary-card{
        background:white;
        border-radius:20px;
        padding:30px;
        height:fit-content;
        box-shadow:0 10px 25px rgba(0,0,0,0.08);
    }

    .summary-card h2{
        margin-bottom:30px;
        color:#0f172a;
    }

    .summary-row{
        display:flex;
        justify-content:space-between;
        margin-bottom:20px;
        font-size:17px;
        color:#475569;
    }

    .summary-total{
        display:flex;
        justify-content:space-between;
        margin-top:30px;
        padding-top:20px;
        border-top:2px solid #e2e8f0;
        font-size:24px;
        font-weight:700;
        color:#2563eb;
    }

    /* BUTTON */
    .checkout-btn{
        width:100%;
        margin-top:30px;
        padding:15px;
        border:none;
        border-radius:14px;
        background:linear-gradient(135deg,#2563eb,#3b82f6);
        color:white;
        font-size:17px;
        font-weight:600;
        cursor:pointer;
        transition:0.3s ease;
    }

    .checkout-btn:hover{
        transform:translateY(-3px);
        box-shadow:0 10px 20px rgba(37,99,235,0.3);
    }
        </style>

    <div class="user-page">

        <h1 class="page-title">
            Hello User, Welcome to our Store!
        </h1>

        <!-- PRODUCTS -->
        <div class="products-container">

            <!-- PRODUCT 1 -->
            <div class="product-card">
                <div class="product-info">
                    <h2>Mouse</h2>
                    <p class="product-id">Product ID: MSE</p>
                    <p class="price">₱350.00</p>
                    <p class="stocks">Stocks: 100</p>
                    <p class="srp">SRP: ₱402.50</p>

                    <asp:Button ID="btnMouse" runat="server" Text="Add To Cart" CssClass="btn-primary" OnClick="btnMouse_Click" />
                </div>
            </div>

            <!-- PRODUCT 2 -->
            <div class="product-card">
                <div class="product-info">
                    <h2>Printer Ink</h2>
                    <p class="product-id">Product ID: PRN</p>
                    <p class="price">₱7500.00</p>
                    <p class="stocks">Stocks: 100</p>
                    <p class="srp">SRP: ₱8625.00</p>

                    <asp:Button ID="btnInk" runat="server" Text="Add To Cart" CssClass="btn-primary" OnClick="btnInk_Click" />
                </div>
            </div>

            <!-- PRODUCT 3 -->
            <div class="product-card">
                <div class="product-info">
                    <h2>Printer Dot Matrix</h2>
                    <p class="product-id">Product ID: PRNDT</p>
                    <p class="price">₱5000.00</p>
                    <p class="stocks">Stocks: 100</p>
                    <p class="srp">₱5750.00</p>

                    <asp:Button ID="btnPrinter" runat="server" Text="Add To Cart" CssClass="btn-primary" OnClick="btnPrinter_Click" />
                </div>
            </div>

            <!-- PRODUCT 4 -->
            <div class="product-card">
                <div class="product-info">
                    <h2>LCD Monitor</h2>
                    <p class="product-id">Product ID: MNTRLc</p>
                    <p class="price">₱6500.00</p>
                    <p class="stocks">Stocks: 100</p>
                    <p class="srp">₱7475.00</p>

                    <asp:Button ID="btnLCD" runat="server" Text="Add To Cart" CssClass="btn-primary" OnClick="btnLCD_Click" />
                </div>
            </div>

            <!-- PRODUCT 5 -->
            <div class="product-card">
                <div class="product-info">
                    <h2>LED Monitor</h2>
                    <p class="product-id">Product ID: MNTRLe</p>
                    <p class="price">₱7500.00</p>
                    <p class="stocks">Stocks: 100</p>
                    <p class="srp">₱8625.00</p>

                    <asp:Button ID="btnLED" runat="server" Text="Add To Cart" CssClass="btn-primary" OnClick="btnLED_Click" />
                </div>
            </div>

        </div>

        <!-- CHECKOUT -->
    <div class="checkout-page">

        <h1 class="checkout-title">
            Checkout Summary
        </h1>

        <div class="checkout-container">

            <!-- LEFT SIDE -->
            <div class="checkout-products">

                <div class="checkout-header">
                    <span>Product</span>
                    <span>Price</span>
                    <span>Qty</span>
                    <span>Amount</span>
                </div>

                <!-- REPEATER -->
                <asp:Repeater ID="rptCart" runat="server">

                    <ItemTemplate>

                        <div class="checkout-item">

                            <div class="product-details">

                                <div>
                                    <h3><%# Eval("ProductName") %></h3>
                                    <p><%# Eval("ProductId") %></p>
                                </div>

                            </div>

                            <div class="product-price">
                                ₱<%# Eval("Price") %></div>

                            <div class="product-qty">
                                <%# Eval("Quantity") %>
                            </div>

                            <div class="product-total">
                                ₱<%# Eval("Total") %></div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>

            </div>

            <!-- RIGHT SIDE -->
            <div class="summary-card">

                <h2>Order Summary</h2>

                <div class="summary-row">
                    <span>Subtotal</span>
                    <asp:Label ID="lblSubtotal" runat="server" Text="₱0.00"></asp:Label>
                </div>

                <div class="summary-row">
                    <span>VAT (10%)</span>
                    <asp:Label ID="lblVAT" runat="server" Text="₱0.00"></asp:Label>
                </div>

                <div class="summary-row">
                    <span>Discount</span>
                    <asp:Label ID="lblDiscount" runat="server" Text="₱0.00"></asp:Label>
                </div>

        <div class="summary-total">
        <span>Total</span>
        <asp:Label ID="lblTotal" runat="server" Text="₱0.00"></asp:Label>
    </div>

    <asp:Button
        ID="btnCompute"
        runat="server"
        Text="Compute Total"
        CssClass="checkout-btn"
        OnClick="btnCompute_Click" />

    <asp:Button
        ID="btnConfirm"
        runat="server"
        Text="Confirm Order"
        CssClass="checkout-btn"
        OnClick="btnConfirm_Click" />
            </div>

        </div>
        </div>
    </div>
    </asp:Content>
    <asp:Content ID="Content2" runat="server" contentplaceholderid="NavBarContent">
        <div class="header">
            <div class="logo">
                Sales Inventory System
            </div>
            <div class="nav">
                <a href="UserPage.aspx">Dashboard</a>
                <a href="UserPageMan.aspx">Profile</a> 
                <a href="HomePage.aspx">Logout</a>
            </div>
        </div>
    </asp:Content>

