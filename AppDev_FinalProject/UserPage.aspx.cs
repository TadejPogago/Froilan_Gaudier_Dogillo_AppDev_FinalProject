using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataHelper;

namespace AppDev_FinalProject
{
    public partial class UserPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("LoginPage.aspx");
                return;
            }

            if (!IsPostBack)
            {
                if (Session["Cart"] == null)
                {
                    Session["Cart"] = new List<CartItem>();
                }

                BindCart();
            }
        }

        protected void btnMouse_Click(object sender, EventArgs e)
        {
            AddToCart("Mouse", "MSE", 350);
        }

        protected void btnInk_Click(object sender, EventArgs e)
        {
            AddToCart("Printer Ink", "PRN", 7500);
        }

        protected void btnPrinter_Click(object sender, EventArgs e)
        {
            AddToCart("Printer Dot Matrix", "PRNDT", 5000);
        }

        protected void btnLCD_Click(object sender, EventArgs e)
        {
            AddToCart("LCD Monitor", "MNTRLc", 6500);
        }

        protected void btnLED_Click(object sender, EventArgs e)
        {
            AddToCart("LED Monitor", "MNTRLe", 7500);
        }

        protected void btnCompute_Click(object sender, EventArgs e)
        {
            List<CartItem> cart =
                (List<CartItem>)Session["Cart"];

            double subtotal = 0;

            foreach (CartItem item in cart)
            {
                subtotal += item.Total;
            }

            double vat = subtotal * 0.10;

            double discount = 0;

            string membership =
                Session["MembershipType"]?.ToString();

            if (subtotal >= 10000 && membership != null)
            {
                if (membership == "Silver")
                    discount = subtotal * 0.05;

                else if (membership == "Gold")
                    discount = subtotal * 0.10;

                else if (membership == "Platinum")
                    discount = subtotal * 0.15;
            }

            double total = subtotal + vat - discount;

            lblSubtotal.Text = "₱" + subtotal.ToString("N2");
            lblVAT.Text = "₱" + vat.ToString("N2");
            lblDiscount.Text = "₱" + discount.ToString("N2");
            lblTotal.Text = "₱" + total.ToString("N2");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Order Confirmed Successfully!');</script>");
        }

        private void AddToCart(string name, string id, double price)
        {
            List<CartItem> cart = (List<CartItem>)Session["Cart"];

            CartItem item = cart.Find(x => x.ProductId == id);

            if (item == null)
            {
                cart.Add(new CartItem
                {
                    ProductName = name,
                    ProductId = id,
                    Price = price,
                    Quantity = 1
                });
            }
            else
            {
                item.Quantity++;
            }

            Session["Cart"] = cart;

            BindCart();
        }
        private void BindCart()
        {
            rptCart.DataSource = Session["Cart"];
            rptCart.DataBind();
        }

    }
}