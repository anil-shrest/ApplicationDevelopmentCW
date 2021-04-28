using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace StayBeautifulSMS
{
    public partial class LowStock : System.Web.UI.Page
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
            cmd.CommandText = @"SELECT item_id, item_name ""Item Name"", available_quantity ""Available Quantity"", stocked_date ""Date of Stock"" from items WHERE available_quantity < 10";
            //cmd.CommandText = "SELECT * FROM [customer]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            lowStockGridView.DataSource = dt;
            lowStockGridView.DataBind();
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            String selectedCategory = sortCategoryDropDown.SelectedItem.Value;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            if (selectedCategory == "Item Name")
            {
                cmd.CommandText = @"SELECT item_id, item_name ""Item Name"", available_quantity ""Quantity Available"", stocked_date ""Stock Date"" from items Order By item_name";
            }
            else if (selectedCategory == "Stocked Date")
            {
                cmd.CommandText = @"SELECT it.item_id, it.item_name ""Item Name"", it.item_price ""Item Price"", it.available_quantity ""Quantity Available"", st.stock_id ""Stock Id"", st.date_of_stock ""Stock Date"" FROM Items it
                                    INNER JOIN (
                                    SELECT stock_id, item_id, date_of_stock, ROW_NUMBER() OVER(PARTITION BY item_id ORDER BY date_of_stock DESC) rn FROM Stock) st 
                                    ON st.item_id = it.item_id and rn=1
                                    Order By st.date_of_stock";
            }
            else if (selectedCategory == "Stock Quantity") {
                cmd.CommandText = @"SELECT item_id, item_name ""Item Name"", available_quantity ""Quantity Available"", stocked_date ""Stock Date"" from items where available_quantity < 10 Order By available_quantity";
            }
            //cmd.CommandText = "SELECT * FROM [customer]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            lowStockGridView.DataSource = dt;
            lowStockGridView.DataBind();
        }

        protected void lowStockGridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void lowStockGridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }

        protected void lowStockGridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void lowStockGridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }
    }
}