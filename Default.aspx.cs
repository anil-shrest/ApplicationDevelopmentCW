using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayBeautifulSMS
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            stats();
        }
        protected void stats()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd1 = new OleDbCommand();
            OleDbCommand cmd2 = new OleDbCommand();
            OleDbCommand cmd3 = new OleDbCommand();
            OleDbCommand cmd4 = new OleDbCommand();
            OleDbCommand cmd5 = new OleDbCommand();
            OleDbCommand cmd6 = new OleDbCommand();
            OleDbCommand cmd7 = new OleDbCommand();
            OleDbCommand cmd8 = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd1.Connection = con;
            cmd2.Connection = con;
            cmd3.Connection = con;
            cmd4.Connection = con;
            cmd5.Connection = con;
            cmd6.Connection = con;
            cmd7.Connection = con;
            cmd8.Connection = con;
            cmd1.CommandText = @"SELECT COUNT(brand_id) from Brand";
            cmd2.CommandText = @"SELECT COUNT(item_id) from Items";
            cmd3.CommandText = @"SELECT COUNT(customer_id) from Customer";
            cmd4.CommandText = @"SELECT COUNT(purchase_id) from Purchase where purchased_date >= CURRENT_TIMESTAMP -31";
            cmd5.CommandText = @"SELECT COUNT(category_id) from Category";
            cmd6.CommandText = @"SELECT COUNT(item_id) from items WHERE available_quantity < 10";
            cmd7.CommandText = @"SELECT COUNT(cs.customer_id) FROM Customer cs
                                WHERE cs.customer_id not in ( 
                                    SELECT ps.customer_id FROM Purchase ps
                                    WHERE ps.purchased_date >= CURRENT_TIMESTAMP - 31)";
            cmd8.CommandText = @"SELECT COUNT(it.item_id) FROM Items it
                                INNER JOIN Brand br on it.brand_id = br.brand_id
                                INNER JOIN Category ct on ct.category_id = it.category_id
                                WHERE it.item_id not in (
                                SELECT pd.item_id from Purchase_Detail pd
                                INNER JOIN
                                (
	                                SELECT p.purchase_id from Purchase p
	                                WHERE p.purchased_date >= CURRENT_TIMESTAMP -1
                                ) ps
                                ON pd.purchase_id = ps.purchase_id
                                ) AND it.available_quantity > 0;";

            var brand = cmd1.ExecuteReader();
            brand.Read();
            brands.InnerText = brand.GetInt32(0).ToString();

            var item = cmd2.ExecuteReader();
            item.Read();
            items.InnerText = item.GetInt32(0).ToString();

            var customer = cmd3.ExecuteReader();
            customer.Read();
            customers.InnerText = customer.GetInt32(0).ToString();

            var purchase = cmd4.ExecuteReader();
            purchase.Read();
            purchases.InnerText = purchase.GetInt32(0).ToString();

            var totCategories = cmd5.ExecuteReader();
            totCategories.Read();
            totalCategories.InnerText = totCategories.GetInt32(0).ToString();

            var totLowStock = cmd6.ExecuteReader();
            totLowStock.Read();
            lowStock.InnerText = totLowStock.GetInt32(0).ToString();

            var totInactiveCus = cmd7.ExecuteReader();
            totInactiveCus.Read();
            inactiveCustomer.InnerText = totInactiveCus.GetInt32(0).ToString();

            var totInactiveStock = cmd8.ExecuteReader();
            totInactiveStock.Read();
            unsoldStock.InnerText = totInactiveStock.GetInt32(0).ToString();

            username.InnerText = User.Identity.Name;
            con.Close();
        }
    }
}