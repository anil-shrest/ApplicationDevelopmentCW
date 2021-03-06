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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string email = User.Identity.Name.ToString();
            string current_pw = txtCurrentPw.Text.ToString();
            string new_pw1 = txtNewPw1.Text.ToString();
            string new_pw2 = txtNewPw2.Text.ToString();
            string password;
            string constr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (OleDbConnection con = new OleDbConnection(constr))
            {
                using (OleDbCommand cmd = new OleDbCommand("SELECT user_password FROM [App Dev CW2].[dbo].[User] WHERE user_username = '" + email + "'"))
                {
                    cmd.Connection = con;
                    con.Open();
                    var usr = cmd.ExecuteReader();
                    usr.Read();
                    password = usr.GetString(0);
                    con.Close();
                }
                if (password == current_pw)
                {
                    if (new_pw1 == new_pw2)
                    {
                        using (OleDbCommand cmd2 = new OleDbCommand("Update [App Dev CW2].[dbo].[User] SET user_password = '" + new_pw1 + "' where user_username = '" + email + "'"))
                        {
                            cmd2.Connection = con;
                            con.Open();
                            cmd2.ExecuteNonQuery();
                            con.Close();
                        }
                        string script = "alert('Password successfully changed'); ";
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), "ClosePopup", script, true);

                        System.Diagnostics.Debug.WriteLine("Item quantity specified not available.");
                    }
                    else
                    {
                        string script = "alert(\"Password fields did not match\"); ";
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "ConfirmSubmit", script);

                        ClientScript.RegisterOnSubmitStatement(this.GetType(),
                                              "ConfirmSubmit", script);
                        System.Diagnostics.Debug.WriteLine("Item quantity specified not available.");
                    }

                }
                else
                {
                    string script = "alert(\"Incorrect current password\"); ";
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "ConfirmSubmit", script);

                    ClientScript.RegisterOnSubmitStatement(this.GetType(),
                                          "ConfirmSubmit", script);
                    System.Diagnostics.Debug.WriteLine("Item quantity specified not available.");
                }
            }
        }
    }
}