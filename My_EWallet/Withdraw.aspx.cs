using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_EWallet
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            string userEmail = Session["email"].ToString();
            double amt = Convert.ToDouble(txtAmtToWithdraw.Text);
            double currBalance = Convert.ToDouble(Session["bal"].ToString());
            string type = "W";
            string sendto = "";

            try
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        //checks the user's current balance 
                        if (currBalance < amt)
                        {
                            //if current balance is not enough
                            Response.Write("<script>alert('Your current balance is not enough for cash out.')</script>");
                            Response.Redirect("Transaction");

                        }
                        else
                        {
                            //if current balance is enough
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "INSERT INTO TRANSACTBL (TYPE, TDATE, AMT, SENDTO, EMAIL)" + "VALUES (@type, @date, @amt, @sendto, @email)";
                            cmd.Parameters.AddWithValue("@type", type);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@amt", amt);
                            cmd.Parameters.AddWithValue("@sendto", sendto);
                            cmd.Parameters.AddWithValue("@email", userEmail);
                            var ctr = cmd.ExecuteNonQuery();

                            if (ctr >= 1)
                            {
                                //calls setBalance() function to update the user's balance
                                setBalance();
                            }
                            else
                            {
                                Response.Write("<script>alert('Sorry, something went wrong...')</script>");
                                Response.Redirect("Transaction");
                            }

                        }


                    }

                }

            }
            catch (Exception)
            {
                Response.Write("<script>alert('Sorry, something went wrong...')</script>");
                //Response.Redirect("Default");
            }

            //this function updates user's balance
            void setBalance()
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE USERTBL SET BALANCE = '" + (Convert.ToDouble(Session["bal"]) - amt) + "' WHERE EMAIL = '" + userEmail + "' ";
                        var ctr = cmd.ExecuteNonQuery();

                        if (ctr >= 1)
                        {
                            Response.Write("<script>alert('Transaction Completed.')</script>");
                            Response.Redirect("Transaction");
                        }
                        else
                        {
                            Response.Write("<script>alert('Transaction Failed.')</script>");
                            Response.Redirect("Transaction");
                        }


                    }
                }
            }
        }
    }
}