using System;
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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGridView(); //calls the function FillGridView()
            }
        }

        //to select all the data in USERTBL
        void FillGridView()
        {
            string specifiedField = "User";
            DataTable dt = new DataTable();
            using (SqlConnection db = new SqlConnection(connDB))
            {
                db.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM USERTBL WHERE ROLE = '"+ specifiedField + "'", db);
                adapter.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                usersGV.DataSource = dt;
                usersGV.DataBind();
            }
            else
            {
                //if there's no data, this will execute
                dt.Rows.Add(dt.NewRow());
                usersGV.DataSource = dt;
                usersGV.DataBind();
                usersGV.Rows[0].Cells.Clear();
                usersGV.Rows[0].Cells.Add(new TableCell());
                usersGV.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                usersGV.Rows[0].Cells[0].Text = "No Registered Users Found!";
                usersGV.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }



        protected void usersGV_RowEditing(object sender, GridViewEditEventArgs e)
        {
            usersGV.EditIndex = e.NewEditIndex;
            FillGridView();
        }

        protected void usersGV_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //string specifiedField = "User";
            try
            {
                using (SqlConnection db = new SqlConnection(connDB))
                {
                    db.Open();
                    string query = "UPDATE USERTBL SET LNAME = @lname, FNAME = @fname, EMAIL = @email, BDATE = @bdate, USRNAME = @usrname, BALANCE = @balance WHERE ID = @Id ";
                    SqlCommand cmd = new SqlCommand(query, db);
                    cmd.Parameters.AddWithValue("@lName", (usersGV.Rows[e.RowIndex].FindControl("txtLastName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@fName", (usersGV.Rows[e.RowIndex].FindControl("txtFirstName") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@eMail", (usersGV.Rows[e.RowIndex].FindControl("txtEmail") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@bdate", (usersGV.Rows[e.RowIndex].FindControl("txtDOB") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@usrname", (usersGV.Rows[e.RowIndex].FindControl("txtUsername") as TextBox).Text.Trim());
                    cmd.Parameters.AddWithValue("@balance", (usersGV.Rows[e.RowIndex].FindControl("txtBalance") as TextBox).Text.ToString());
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(usersGV.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    usersGV.EditIndex = -1;
                    FillGridView();
                    lblSuccessMessage.Text = "Selected User Updated!";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void usersGV_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {

                if (e.CommandName.Equals("AddNew"))
                {
                    using (SqlConnection db = new SqlConnection(connDB))
                    {
                        db.Open();
                        string query = "INSERT INTO USERTBL(LNAME, FNAME, EMAIL, BDATE, USRNAME, BALANCE" +
                            " VALUES (@lName,@fName, @eMail, @bdate,@usrname, @balance)";
                        SqlCommand cmd = new SqlCommand(query, db);
                        cmd.Parameters.AddWithValue("@lName", (usersGV.FooterRow.FindControl("txtLastNameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@fName", (usersGV.FooterRow.FindControl("txtFirstNameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@eMail", (usersGV.FooterRow.FindControl("txtEmailFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@bdate", (usersGV.FooterRow.FindControl("txtDOBFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@usrname", (usersGV.FooterRow.FindControl("txtUsernameFooter") as TextBox).Text.Trim());
                        cmd.Parameters.AddWithValue("@balance", (usersGV.FooterRow.FindControl("txtBalanceFooter") as TextBox).Text.Trim());
                        cmd.ExecuteNonQuery();
                        FillGridView();
                        lblSuccessMessage.Text = "New User Added!";
                        lblErrorMessage.Text = "";

                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void usersGV_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            usersGV.EditIndex = -1;
            FillGridView();
        }

        protected void usersGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (SqlConnection db = new SqlConnection(connDB))
                {
                    db.Open();
                    string query = "DELETE FROM USERTBL WHERE ID = @Id";
                    SqlCommand cmd = new SqlCommand(query, db);
                    cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(usersGV.DataKeys[e.RowIndex].Value.ToString()));
                    cmd.ExecuteNonQuery();
                    FillGridView();
                    lblSuccessMessage.Text = "Selected Row Deleted";
                    lblErrorMessage.Text = "";
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string specifiedField = "User";
                using (SqlConnection db = new SqlConnection(connDB))
                {
                    db.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sql = "SELECT * FROM USERTBL WHERE ROLE = '" + specifiedField + "' AND LNAME LIKE '%"+ txtSearchBar.Text + "%' OR FNAME LIKE '%" + txtSearchBar.Text + "%' OR EMAIL LIKE '%" + txtSearchBar.Text + "%' OR USRNAME LIKE '%" + txtSearchBar.Text + "%' OR BALANCE LIKE '%" + txtSearchBar.Text + "%' ";
                    cmd.CommandText = sql;
                    cmd.Connection = db;
                    DataTable dt = new DataTable();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                    usersGV.DataSource = dt;
                    usersGV.DataBind();

                    int count = usersGV.Rows.Count;
                    if (count == 0)
                    {
                        Response.Write("<script>alert('No activity found.')</script>");
                    }


                    db.Close();
                }



            } 
            catch(Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
}