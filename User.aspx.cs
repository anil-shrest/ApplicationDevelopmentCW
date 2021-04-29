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
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////default data load
            if (!this.IsPostBack)
            {
                if (User.Identity.Name == "admin")
                {
                    this.BindGrid();
                }
                else {
                    this.UserGrid();
                }
                
            }
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT user_Id, user_address ""User Address"",User_Name ""User Name"", user_contact ""User Contact"", user_email ""User Email"", user_username ""User Username"", user_password ""Password"", user_type ""User Type"" FROM [App Dev CW2].[dbo].[User]";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            adminGridView.DataSource = dt;
            adminGridView.DataBind();
        }
        private void UserGrid() {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string username = User.Identity.Name;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT user_Id, user_address ""User Address"",User_Name ""User Name"", user_contact ""User Contact"", user_email ""User Email"", user_username ""User Username"" ,user_type ""User Type"" FROM [App Dev CW2].[dbo].[User] WHERE user_username='"+username+"'";
            cmd.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            using (OleDbDataReader sdr = cmd.ExecuteReader())
            {
                dt.Load(sdr);
            }
            con.Close();
            userGridView.DataSource = dt;
            userGridView.DataBind();
        }

 

        protected void userGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = adminGridView.Rows[e.RowIndex];
            int ID = Convert.ToInt32(adminGridView.DataKeys[e.RowIndex].Values[0]);
            string address = (row.Cells[2].Controls[0] as TextBox).Text;
            string name = (row.Cells[3].Controls[0] as TextBox).Text;
            string contact = (row.Cells[4].Controls[0] as TextBox).Text;
            string email = (row.Cells[5].Controls[0] as TextBox).Text;
            string username = (row.Cells[6].Controls[0] as TextBox).Text;
            string password = (row.Cells[7].Controls[0] as TextBox).Text;
            string type = (row.Cells[8].Controls[0] as TextBox).Text;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(constr))
            {
                using (OleDbCommand cmd = new OleDbCommand("Update [App Dev CW2].[dbo].[User] SET user_name = '" + name + "',user_address='"+address+ "',user_username='" + username + "',user_contact='" +contact + "',user_email='" + email + "', user_password='" + password + "', user_type='" + type + "' where user_id = " + ID))
                {
                    cmd.Connection = con;
                    con.Open();

                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            adminGridView.EditIndex = -1;
            this.BindGrid();
        }

        protected void userGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            adminGridView.EditIndex = -1;
            this.BindGrid();
        }

        protected void userGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(adminGridView.DataKeys[e.RowIndex].Values[0]);
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OleDbConnection con = new OleDbConnection(constr))
            {
                //OleDbCommand cmd1 = new OleDbCommand("UPDATE Items SET category_id = NULL WHERE category_id = " + ID);
                OleDbCommand cmd2 = new OleDbCommand("DELETE FROM [App Dev CW2].[dbo].[User] WHERE user_id = " + ID);
                //cmd1.Connection = con;
                cmd2.Connection = con;
                con.Open();
                //cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                con.Close();
            }
            this.BindGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtUserName.Text.ToString();
            string contact = txtUserContact.Text.ToString();
            string username = txtUserUsername.Text.ToString();
            string address = txtUserAddress.Text.ToString();
            string email = txtUserEmail.Text.ToString();
            string password = txtPassword.Text.ToString();
            
            

            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


            using (OleDbConnection con = new OleDbConnection(constr))
            {
                using (OleDbCommand cmd = new OleDbCommand("Insert into [App Dev CW2].[dbo].[User](user_name,user_username,user_email,user_contact,user_password,user_address) Values('" + name + "','"+username+ "','" + email + "','" + contact + "','" + password + "','" + address + "')"))
                {
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    txtUserAddress.Text = "";
                    txtUserContact.Text = "";
                    txtUserEmail.Text = "";
                    txtUserName.Text = "";
                    

                }
            }

            this.BindGrid();
        }

        protected void adminGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != adminGridView.EditIndex)
            {
                (e.Row.Cells[0].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";

            }
        }

        protected void adminGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            adminGridView.EditIndex = e.NewEditIndex;
            this.BindGrid();
        }
    }
}