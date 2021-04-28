using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.OleDb;
using System.Configuration;
using System.Diagnostics;

namespace StayBeautifulSMS
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signinBtn_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (OleDbConnection con = new OleDbConnection(constr))
            {
                using (OleDbCommand cmd = new OleDbCommand("SELECT user_password FROM User WHERE user_email=pratistha@gmail.com"))
                {
                    cmd.Connection = con; 
                    con.Open();
                    var pwd = cmd.ExecuteReader();
                    pwd.Read();
                    String password = pwd["user_password"].ToString();
                    System.Diagnostics.Debug.WriteLine(password);
                    System.Diagnostics.Debug.WriteLine("Check check!!!!!");

                    con.Close();
                }
            }

            string name = Request.Form["txtemail"];
            string email = txtemail.Value;

        }


        protected void loginBtn_ServerClick(object sender, EventArgs e)
        {

            // To pass SESSION
            String password1;
            String username;

            // Taking data from HTML input fields
            String email = Request.Form["txtemail"];
            String password = Request.Form["txtPassword"];
            
            
            if (email == "" || password == "")
            {
                string script = "alert('Fields must not be empty!');";
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "ClosePopup", script, true);
            }
            else
            {
                string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                using (OleDbConnection con = new OleDbConnection(constr))
                {
                    using (OleDbCommand cmd = new OleDbCommand("SELECT * FROM [App Dev CW2].[dbo].[User] WHERE user_username='" + email + "'"))
                    {
                        //var cmdUsername = new OleDbCommand("SELECT * FROM User");
                        cmd.Connection = con;
                        con.Open();
                        var userData = cmd.ExecuteReader();


                        while (userData.Read()) {
                            password1 = userData["user_password"].ToString();
                            username = userData["user_username"].ToString();
                            System.Diagnostics.Debug.WriteLine(username);
                            System.Diagnostics.Debug.WriteLine("Check check!!!!!");
                            if (password == password1 && email == username)
                            {
                                                               
                                lowStock(username); //trigger function to check for any items running out of stock and show popup message
                                                    //remove FormsAuthentication from here
                            }
                            else
                            {
                                string script = "alert('Incorrect uername or password1');";
                                ScriptManager.RegisterStartupScript(this.Page, GetType(), "ClosePopup", script, true);

                            }
                        }
                        //string script1 = "alert('Incorrect uername or password2');";
                        //ScriptManager.RegisterStartupScript(this.Page, GetType(), "ClosePopup", script1, true);

                        con.Close();
                    }
                }
            }
        }

        protected void lowStock(string username)
        {
            List<string> lowStock = new List<string>();
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            OleDbCommand cmd = new OleDbCommand();
            OleDbConnection con = new OleDbConnection(constr);
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"Select item_id, item_name from Items where available_quantity < 10";
            var low = cmd.ExecuteReader();
            while (low.Read())
            {
                var id = low.GetInt32(0);
                var name = low.GetString(1);
                lowStock.Add(name);
                Debug.WriteLine("ID:" + id.ToString() + "Item:" + name);
            }

            if (lowStock.Count() > 0)
            {
                Debug.WriteLine("Not Empty");
                string script = "alert(\"Items running out of stock.\");window.location ='LowStock.aspx';"; //replace stockform.aspx with low stock form

                ScriptManager.RegisterStartupScript(this.Page, GetType(), "OpenModalDialog", script, true);
                FormsAuthentication.SetAuthCookie(username, true);
            }
            else
            {
                FormsAuthentication.RedirectFromLoginPage(username, true);
            }

        }
    }
}