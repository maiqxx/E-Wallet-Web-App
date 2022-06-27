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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            pnlConfirmTransfer.Visible = false;
        }

        //Enabling the panel to be displayed for confirmation
        protected void btnSendMoney_Click(object sender, EventArgs e)
        {

            //string userEmail = Session["email"].ToString();
            double amt = Convert.ToDouble(txtAmountToSend.Text);
            pnlConfirmTransfer.Visible = true;
            string lblConfirm = "You are about to send " + amt + " pesos.";
            lblConfirmTransfer.Text = lblConfirm;
            string recipient = txtSendToEm.Text;

            try
            {

                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        // this cmd will aselect the sum of the reciever's balance (converted in a double data type) and assign it to a local variable
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT (BALANCE) AS TOTALBAL FROM USERTBL WHERE EMAIL = '" + recipient + "' ";
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            double recieverBal = Convert.ToDouble(reader["TOTALBAL"].ToString()); //reciever's balance is assigned to recieverBal 
                            //double updatedBal = recieverBal + amt;
                            Session["updatedBal"] = recieverBal + amt;
                            reader.Close();

                        }
                        else
                        {
                            Response.Write("<script>alert('Unable to send money.')</script>");
                        }

                        cmd.CommandText = "UPDATE USERTBL SET BALANCE = '" + Convert.ToDouble(Session["updatedBal"]) + "' WHERE EMAIL = '" + txtSendToEm.Text + "'";
                        var ctr = cmd.ExecuteNonQuery();
                        if (ctr >= 1)
                        {
                            Response.Write("<script>alert('Processing the transaction...')</script>");
                            //Response.Redirect("Transaction");
                        }
                        else
                        {
                            Response.Write("<script>alert('Unable to send money.')</script>");
                            Response.Redirect("Transaction");
                        }


                    }
                    //db.Close();
                }



            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Oops! Something went wrong, please try again...')</script>");
                Response.Write(ex);
            }




        }

        //Method that sets the user's balance and the reciever's balance
        //when button clicked in the panel, this must execute
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string userEmail = Session["email"].ToString();
            double amt = Convert.ToDouble(txtAmountToSend.Text);
            pnlConfirmTransfer.Visible = true;
            string lblConfirm = "You are about to send " + amt;
            lblConfirmTransfer.Text = lblConfirm;
            btnSendMoney.Enabled = false;

            string type = "S";
            string sendto = txtSendToEm.Text;
            double balance = Convert.ToDouble(Session["bal"].ToString());


            try
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERTBL WHERE EMAIL = '" + sendto + "'";
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.HasRows)
                        {
                            checkBalance();
                            reader.Close();
                        }
                        else
                        {
                            Response.Write("<script>alert('You entered an unregistered user.')</script>");
                        }


                    }
                }


            }

            catch (Exception ex)
            {
                //execute to handle errors
                Response.Write("<script>alert('Oops! Something went wrong, please try again...')</script>");
                Response.Write(ex);
                Response.Redirect("Transaction");
            }


            //Function that will check the user's balance before sending the recipient
            //This function also records the transaction of the user and will update the user's current balance
            void checkBalance()
            {
                //If balance is not enough, the code inside the if-block will execute
                //otherwise, the else-block will execute
                if (balance < amt)
                {
                    Response.Write("<script>alert('You have insufficient balance!')</script>");
                    Response.Redirect("Transaction");
                }
                else
                {
                    //this else-block will record the user's transaction and update the user's current balance
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
                                setUserBalance();

                            }
                            else
                            {
                                //executes when unable to insert the user's transaction
                                Response.Write("<script>alert('Oooppss.. Something wrong!')</script>");
                                Response.Redirect("Transaction");
                            }

                            //add a method here that will check the user's current balance,  bc balance must not exceeded 10,000

                        }
                        db.Close();
                    }

                }
            }

            //Function that sets/updates the user's balance
            void setUserBalance()
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
                            // setRecieverTransact();  //this method will be called after updating the user's balance
                            Response.Write("<script>alert('Transaction Completed.')</script>");
                            Response.Redirect("Transaction");
                        }
                        else
                        {
                            Response.Write("<script>alert('Transaction Failed.')</script>");
                            Response.Redirect("Transaction");
                        }


                    }
                    db.Close();
                }
            }




            /*
             * CASTING THIS CODE
             * 
             * 

            //this method will record recipient's transaction and sets the recipient's balance
            void setRecieverTransact()
            {
                string transactType = "R";
                //string userEmail = Session["email"].ToString();
                //double amt = Convert.ToDouble(txtAmountToSend.Text);

                try
                {

                    using (var db = new SqlConnection(connDB))
                    {
                        db.Open();
                        using (var cmd = db.CreateCommand())
                        {
                            cmd.CommandText = "INSERT INTO TRANSACTBL (TYPE, TDATE, AMT, SENDTO, EMAIL) "
                                + " VALUES (@type,@date,@amt,@sendto, @email)";
                            cmd.Parameters.AddWithValue("@type", transactType);
                            cmd.Parameters.AddWithValue("@date", DateTime.Now);
                            cmd.Parameters.AddWithValue("@amt", txtAmountToSend.Text);
                            cmd.Parameters.AddWithValue("@email", txtSendToEm.Text);
                            var ctr = cmd.ExecuteNonQuery();
                            if (ctr >= 1)
                            {

                                Response.Write("<script>alert('Transaction Completed.')</script>");
                            }
                            else
                            {
                                Response.Write("<script>alert('Transaction Failed.')</script>");
                            }

                        }
                        db.Close();
                    }



                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Oops! Something went wrong, please try again...')</script>");
                    Response.Write(ex);
                    Response.Redirect("Transaction");
                }



                */










            

        }
    }
}