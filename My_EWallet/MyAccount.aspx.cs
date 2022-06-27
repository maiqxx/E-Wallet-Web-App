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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            myAccountGV.Visible = false;
            lblStartDate.Visible = false;
            lblEndDate.Visible = false;
            txtStartDate.Visible = false;
            txtEndDate.Visible = false;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            myAccountGV.Visible = true;

            string email = Session["email"].ToString();
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                SqlCommand cmd = new SqlCommand();
                string sql = "SELECT ID, TYPE, SENDTO, TDATE, AMT FROM TRANSACTBL WHERE EMAIL = '" + email + "'";
                cmd.CommandText = sql;
                cmd.Connection = db;
                DataTable dt = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(dt);
                myAccountGV.DataSource = dt;
                myAccountGV.DataBind();

                int count = myAccountGV.Rows.Count;
                if (count == 0)
                {
                    Response.Write("<script>alert('No activity found.')</script>");
                }


                db.Close();
            }



        }

        protected void myAccountGV_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnCustom_Click(object sender, EventArgs e)
        {
            lblEndDate.Visible = true;
            lblStartDate.Visible = true;
            txtEndDate.Visible = true;
            txtStartDate.Visible = true;
        }
        void notVisible()
        {
            lblEndDate.Visible = false;
            lblStartDate.Visible = false;
            txtEndDate.Visible = false;
            txtStartDate.Visible = false;
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {

        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEndDate_TextChanged(object sender, EventArgs e)
        {

        }


    }
}