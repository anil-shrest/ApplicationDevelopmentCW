using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StayBeautifulSMS
{
    public partial class PurchaseHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT cs.Customer_Id ""Customer Id"", cs.customer_name ""Customer Name"", ps.purchase_id ""Purchase Id"", it.item_price ""Item Price"", pd.purchased_quantity*it.item_price as ""Line Total"", ps.purchased_date ""Purchase Date"", ps.user_id ""User Id"", pd.item_id ""Item Id"", it.item_name ""Item Name"", pd.purchased_quantity ""Purchased Quantity"", (
                                Select SUM(ite.item_price* prd.purchased_quantity) from Items ite
                                INNER JOIN purchase_detail prd on ite.item_id = prd.item_id
                                INNER JOIN purchase pur on pur.purchase_id = prd.purchase_id
                                where pur.purchase_id = ps.purchase_id group by pur.purchase_id) as ""Total Amount""
                                FROM Customer cs
                                INNER JOIN Purchase ps ON cs.customer_id = ps.customer_id
                                INNER JOIN Purchase_Detail pd on ps.purchase_id = pd.purchase_id
                                LEFT OUTER JOIN Items it ON pd.item_id = it.item_id
                                WHERE ps.purchased_date > CURRENT_TIMESTAMP - 31";
       
            //cmd.CommandText = "SELECT * FROM [customer]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            purchaseHistoryGridView.DataSource = dt;
            purchaseHistoryGridView.DataBind();
        }

        protected void viewBtn_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            String customerid = customerDropDown.SelectedItem.Value;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT cs.Customer_Id ""Customer Id"", cs.customer_name ""Customer Name"", ps.purchase_id ""Purchase Id"", it.item_price ""Item Price"", pd.purchased_quantity*it.item_price as ""Line Total"", ps.purchased_date ""Purchase Date"", ps.user_id ""User Id"", pd.item_id ""Item Id"", it.item_name ""Item Name"", pd.purchased_quantity ""Purchased Quantity"", (
                                Select SUM(ite.item_price* prd.purchased_quantity) from Items ite
                                INNER JOIN purchase_detail prd on ite.item_id = prd.item_id
                                INNER JOIN purchase pur on pur.purchase_id = prd.purchase_id
                                where pur.purchase_id = ps.purchase_id group by pur.purchase_id) as ""Total Amount""
                                FROM Customer cs
                                INNER JOIN Purchase ps ON cs.customer_id = ps.customer_id
                                INNER JOIN Purchase_Detail pd on ps.purchase_id = pd.purchase_id
                                LEFT OUTER JOIN Items it ON pd.item_id = it.item_id
                                WHERE ps.purchased_date > CURRENT_TIMESTAMP - 31 and cs.customer_id='"+customerid+"'";

            //cmd.CommandText = "SELECT * FROM [customer]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            purchaseHistoryGridView.DataSource = dt;
            purchaseHistoryGridView.DataBind();
        }
    }
}