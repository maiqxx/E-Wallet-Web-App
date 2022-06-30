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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["username"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["email"] == null)
                Response.Redirect("Login.aspx");
            if (HttpContext.Current.Session["bal"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            string userEmail = Session["email"].ToString();
            double amt = Convert.ToDouble(txtAmountDept.Text);
            string type = "D";
            string sendto = "";
            double balance = Convert.ToDouble(Session["bal"].ToString());

            try
            {
                if (((amt > 2000) && (amt % 100 != 0)) || ((amt < 100) && (amt % 100 != 0)))
                {
                    Response.Write("<script>alert('Maximum amount to be deposited is 2000.00 only, and minimum amount to be deposited is 100.00 only!')</script>");
                }
                //else if ((amt < 100) && (amt % 100 != 0))
                //{
                //   // Response.Write("<script>alert('Minimum amount to be deposited is 1oo.00 only')</script>");
                //}
                else if ((amt <= 2000)&& (amt % 100 == 0))
                {
                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.CommandText = "INSERT INTO TRANSACTBL (TYPE, TDATE, AMT, SENDTO, EMAIL) "
                                + " VALUES (@type,@date,@amt,@sendto, @email)";
                            cmd.Parameters.AddWithValue("@type", type);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@amt", amt);
                            cmd.Parameters.AddWithValue("@sendto", sendto);
                            cmd.Parameters.AddWithValue("@email", userEmail);
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr >= 1)
                            {
                                setBalance();
                            }
                            else
                            {
                                Response.Write("<script>alert('Oooppss.. Something wRong!')</script>");
                                Response.Redirect("Transaction");
                            }

                            //add a method here that will check the user's current balance,  bc balance must not exceeded 10,000
                            //kulang pa

                        }

                    }
                }
                else
                {
                    Response.Write("<script>alert('Please input the amount to be deposited!')</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }

            

            //Function that sets or updates the user's balance
            void setBalance()
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE USERTBL SET BALANCE = '" + (Convert.ToDouble(Session["bal"]) + amt) + "' WHERE EMAIL = '" + userEmail + "' ";
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