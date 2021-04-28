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
    public partial class SearchItemDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////default data load
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
            cmd.CommandText = @"SELECT i.item_id ""Item Id"", i.item_name ""Item Name"", i.available_quantity ""Available Quantity"", c.category_name ""Category Name"", b.brand_name ""Brand Name"" from Items i join category c on i.category_id = c.category_id join brand b on b.brand_id = i.brand_id";
            //cmd.CommandText = "SELECT * FROM [customer]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            searchGridView.DataSource = dt;
            searchGridView.DataBind();
        }

        protected void searchBtn_Click1(object sender, EventArgs e)
        {
            string item_id = itemsddl.SelectedValue.ToString();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT i.item_id ""Item Id"", i.item_name ""Item Name"", i.available_quantity ""Available Quantity"", c.category_name ""Category Name"", b.brand_name ""Brand Name"" from Items i join category c on i.category_id = c.category_id join brand b on b.brand_id = i.brand_id where item_id=" + item_id + " ";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();

            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }

            con.Close();

            searchGridView.DataSource = dt;
            searchGridView.DataBind();
        }
    }
}
