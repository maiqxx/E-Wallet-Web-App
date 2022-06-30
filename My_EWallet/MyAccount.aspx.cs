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
            if (!IsPostBack)
            {
                pnlBalance.Visible = true;
                this.FillGridView();
            }

        }

        void FillGridView()
        {
            string email = Session["email"].ToString();
            using (var db = new SqlConnection(connDB))
            {
                db.Open();
                SqlCommand cmd = new SqlCommand();
                string sql = "SELECT ID, TYPE, TDATE, AMT, SENDTO FROM TRANSACTBL WHERE EMAIL = '" + email + "'";
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


        protected void btnViewHistory_Click(object sender, EventArgs e)
        {
            string email = Session["email"].ToString();
            string deposit = "D";
            string withdraw = "W";
            string sendMoney = "S";
            try
            {
                using (var db = new SqlConnection(connDB))
                {
                    db.Open();
                    if (ddlTransactType.SelectedValue == "D")
                    {
                        SqlCommand cmd = new SqlCommand();
                        string sql = "SELECT * FROM TRANSACTBL WHERE EMAIL = '" + email + "' AND TYPE = '" + deposit + "' ";
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
                    else if (ddlTransactType.SelectedValue == "W")
                    {
                        SqlCommand cmd = new SqlCommand();
                        string sql = "SELECT * FROM TRANSACTBL WHERE EMAIL = '" + email + "' AND TYPE = '" + withdraw + "' ";
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
                    else
                    {
                        SqlCommand cmd = new SqlCommand();
                        string sql = "SELECT * FROM TRANSACTBL WHERE EMAIL = '" + email + "' AND TYPE = '" + sendMoney + "' ";
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
            }
            catch (Exception ex)
            {

            }
        }


        protected void ddlTransactType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
