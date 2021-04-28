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
    public partial class Unsold_Items : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }
        protected void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT it.item_id ""Item_ID"", item_name ""Name"",br.Brand_Name ""Brand"", ct.category_name ""Category"", it.item_price ""Price"", it.stocked_date ""Stocked Date"", it.available_quantity ""Stock Quantity"" FROM Items it
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
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable("Items");
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            unsoldItemsGrid.DataSource = dt;
            unsoldItemsGrid1.DataSource = dt;
            unsoldItemsGrid.DataBind();
            unsoldItemsGrid1.DataBind();
        }

        //protected void unsoldItemsGrid1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != unsoldItemsGrid1.EditIndex)
        //    {
        //        (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
        //    }
        //}

        protected void unsoldItemsGrid1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(unsoldItemsGrid1.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OleDbConnection con = new OleDbConnection(constr))
            {
                using (OleDbCommand cmd = new OleDbCommand("UPDATE Purchase_Detail set item_id=NULL Where item_id=" + ID))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (OleDbCommand cmd = new OleDbCommand("UPDATE Stock set item_id=NULL Where item_id=" + ID))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (OleDbCommand cmd = new OleDbCommand("DELETE FROM Items WHERE item_id =" + ID))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void unsoldItemsGrid1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != unsoldItemsGrid1.EditIndex)
            {
                (e.Row.Cells[0].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
    }
}