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

namespace My_EWallet
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string lName = txtLname.Text;
            string fname = txtFname.Text;
            string eMail = txtEmail.Text;
            string bdate = txtbdate.Text;
            string uname = txtusrn.Text;
            string pwd = txtpwd.Text;
            double initialBalance = 2000.00;
            try
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        //checks if user is already registered or not
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERTBL WHERE USRNAME = @username OR EMAIL = @email";
                        cmd.Parameters.AddWithValue("@username", uname);
                        cmd.Parameters.AddWithValue("@email", eMail);
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.HasRows)
                        {

                            lblWarning.Visible = true;
                            lblWarning.Text = "* This email is already registered.";
                            rd.Close();
                        }
                        else
                        {
                            rd.Close();

                            //If he/she registers as an admin, then admin's information will be added to USERTBL
                            if (rbtnRole.SelectedValue == "Admin")
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "INSERT INTO USERTBL (LNAME, FNAME, EMAIL, BDATE, USRNAME, PSWD, ROLE) "
                                    + " VALUES (@lName,@fName, @eMail, @bdate,@uname, @pswd, @role)";
                                cmd.Parameters.AddWithValue("@lName", lName);
                                cmd.Parameters.AddWithValue("@fName", fname);
                                cmd.Parameters.AddWithValue("@bdate", bdate);
                                cmd.Parameters.AddWithValue("@uname", uname);
                                cmd.Parameters.AddWithValue("@pswd", pwd);
                                cmd.Parameters.AddWithValue("@role", rbtnRole.SelectedValue.ToString());
                                var ctr = cmd.ExecuteNonQuery();

                                if (ctr >= 1)
                                {
                                    Response.Write("<script>alert('Successfully registered as an admin!')</script>");
                                    Response.Redirect("LogIn");

                                }
                                else
                                {
                                    Response.Write("<script>alert('Sorry, something went wrong... Please try again.')</script>");
                                }
                            }

                            //Else, if he/she registers as user, his/her information will also be recorded in USERTBL
                            else if (rbtnRole.SelectedValue == "User")
                            {
                                cmd.CommandType = CommandType.Text;
                                cmd.CommandText = "INSERT INTO USERTBL (LNAME, FNAME, EMAIL, BDATE, USRNAME, PSWD, BALANCE, ROLE) "
                                    + " VALUES (@lName,@fName, @eMail, @bdate,@uname, @pswd, @balance, @role)";
                                cmd.Parameters.AddWithValue("@lName", lName);
                                cmd.Parameters.AddWithValue("@fName", fname);
                                cmd.Parameters.AddWithValue("@bdate", bdate);
                                cmd.Parameters.AddWithValue("@uname", uname);
                                cmd.Parameters.AddWithValue("@pswd", pwd);
                                cmd.Parameters.AddWithValue("@balance", initialBalance);
                                cmd.Parameters.AddWithValue("@role", rbtnRole.SelectedValue.ToString());
                                var ctr = cmd.ExecuteNonQuery();

                                if (ctr >= 1)
                                {
                                    Response.Write("<script>alert('Congratulations, you created your account successfully!')</script>");
                                    //Response.Write("<script>alert('You received Php 2000.00 as your initial balance!')</script>");
                                    lblInBal.Text = "You received Php 2000.00 as your initial balance!";
                                    Response.Redirect("LogIn");

                                }
                                else
                                {
                                    Response.Write("<script>alert('Sorry, something went wrong... Please try again.')</script>");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('You need to choose a role.')</script>");
                                Response.Redirect("CreateAccount");
                            }




                        }
                        db.Close();
                    }

                }
            } 
            catch (Exception ex)
            {
                //throws
                Response.Write("<script>alert('Uh-oh! Something went wrong!')</script>");
                Response.Write(ex);
            }

        }

        protected void txtbdate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtusrn_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtcpwd_TextChanged(object sender, EventArgs e)
        {

        }

        protected void rbtnRole_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
