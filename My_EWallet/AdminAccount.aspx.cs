﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.HtmlControls;

namespace My_EWallet
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            txtEmail.Text = email;
            string specifiedField = "Admin";
            if (!Page.IsPostBack)
            {
                using (SqlConnection db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        //Selects the current data of the admin
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "SELECT * FROM USERTBL WHERE ROLE = '" + specifiedField + "' AND EMAIL = '" + email + "' ";
                        cmd.Parameters.AddWithValue("@email", Session["email"]);

                        using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult | CommandBehavior.SingleRow))
                        {
                            if (reader.Read())
                            {
                                txtLastname.Text = reader["LNAME"].ToString();
                                txtFirstname.Text = reader["FNAME"].ToString();
                                txtEmail.Text = reader["EMAIL"].ToString();
                                txtDOB.Text = reader["BDATE"].ToString();
                                txtUsername.Text = reader["USRNAME"].ToString();
                                txtPassword.Text = reader["PSWD"].ToString();

                            }
                        }

                    }
                    db.Close();
                }
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            string specifiedField = "Admin";

            try
            {
                using (SqlConnection db = new SqlConnection(connDB))
                {
                    db.Open();
                    using (var cmd = db.CreateCommand())
                    {
                        //updates the admin's data
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = "UPDATE USERTBL SET LNAME = @lname, FNAME = @fname, BDATE = @bdate, USRNAME = @uname, PSWD = @pswd WHERE EMAIL = '" + email + "' AND ROLE = '" + specifiedField + "' ";

                        cmd.Parameters.AddWithValue("@lname", txtLastname.Text);
                        cmd.Parameters.AddWithValue("@fname", txtFirstname.Text);
                        cmd.Parameters.AddWithValue("@bdate", txtDOB.Text);
                        cmd.Parameters.AddWithValue("@uname", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@pswd", txtPassword.Text);

                        // db.Open();
                        // cmd.ExecuteNonQuery();

                        var ctr = cmd.ExecuteNonQuery();
                        if (ctr > 0)
                        {
                            lblSuccess.Text = "Profile successfully updated!";
                            Response.Write("<script>alert('Please log in again.')</script>");
                            Response.Redirect("LogIn.aspx");
                            //Page_Load();
                        }
                        else
                        {
                            Response.Write("<script>alert('Cannot update profile.')</script>");
                        }


                    }


                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Sorry, something went wrong...')</script>");
                Response.Write(ex.ToString());
            }
        }
    }
}