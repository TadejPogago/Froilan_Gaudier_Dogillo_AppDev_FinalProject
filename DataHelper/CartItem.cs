using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataHelper
{
    public class CartItem
    {
        public string ProductName { get; set; }
        public string ProductId { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }

        public double Total => Price * Quantity;
    }
}
