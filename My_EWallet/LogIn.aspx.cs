using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.IO;
using System.Web.UI.HtmlControls;

namespace My_EWallet
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Method for Log In button behavior
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userEmail, password;
            int rowCount;

            try
            {

                using (var db = new SqlConnection(connDB))
                {

                    db.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sql = "SELECT * FROM USERTBL";
                    cmd.CommandText = sql;
                    cmd.Connection = db;
                    DataTable dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    adapter.Fill(dt);
                    rowCount = dt.Rows.Count;
                    for (int i = 0; i < rowCount; i++)
                    {
                        userEmail = dt.Rows[i]["EMAIL"].ToString();
                        password = dt.Rows[i]["PSWD"].ToString();

                        if (userEmail == txtEmail.Text && password == txtPswd.Text)
                        {
                            Session["email"] = userEmail;
                            if (dt.Rows[i]["ROLE"].ToString() == "Admin")
                            {
                                getUsername();
                                Response.Redirect("Admin");
                            }
                            else
                            {
                                getBalance();
                                Response.Redirect("Transaction");
                            }

                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid Credentials')</script>");
                        }
                    }

                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

            //Method that gets the user's balance
            void getBalance()
            {
                string email = txtEmail.Text;
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {

                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT BALANCE, USRNAME FROM USERTBL WHERE EMAIL = '" + email + "' ";
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            Session["bal"] = reader["BALANCE"].ToString();
                            Session["username"] = reader["USRNAME"].ToString();
                        }

                    }
                }


            }


            void getUsername()
            {
                string email = txtEmail.Text;
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {

                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT USRNAME AS UN FROM USERTBL WHERE EMAIL = '" + email + "' ";
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            Session["username"] = reader["UN"].ToString();
                        }

                    }
                }
            }



        }
    }
}