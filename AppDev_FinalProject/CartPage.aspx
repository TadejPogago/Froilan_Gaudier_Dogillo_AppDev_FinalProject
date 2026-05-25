<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CartPage.aspx.cs" Inherits="AppDev_FinalProject.CartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
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

            <!-- ITEM -->
            <div class="checkout-item">

                <div class="product-details">

                    <img src="Images/mouse.png" />

                    <div>

                        <h3>Mouse</h3>

                        <p>MSE</p>

                    </div>

                </div>

                <div class="product-price">
                    ₱350
                </div>

                <div class="product-qty">
                    2
                </div>

                <div class="product-total">
                    ₱700
                </div>

            </div>

            <!-- ITEM -->
            <div class="checkout-item">

                <div class="product-details">

                    <img src="Images/lcd.png" />

                    <div>

                        <h3>LCD Monitor</h3>

                        <p>MNTRLc</p>

                    </div>

                </div>

                <div class="product-price">
                    ₱6500
                </div>

                <div class="product-qty">
                    1
                </div>

                <div class="product-total">
                    ₱6500
                </div>

            </div>

        </div>

        <!-- RIGHT SIDE -->
        <div class="summary-card">

            <h2>Order Summary</h2>

            <div class="summary-row">

                <span>Subtotal</span>

                <span>₱7200</span>

            </div>

            <div class="summary-row">

                <span>VAT (10%)</span>

                <span>₱720</span>

            </div>

            <div class="summary-row">

                <span>Discount</span>

                <span>₱0</span>

            </div>

            <div class="summary-total">

                <span>Total</span>

                <span>₱7920</span>

            </div>

            <asp:Button
                ID="btnConfirm"
                runat="server"
                Text="Confirm Order"
                CssClass="checkout-btn" />

        </div>

    </div>

</div>

</asp:Content>
