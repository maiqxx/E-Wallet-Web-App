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
    public partial class WebForm8 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnConfirmPass_Click(object sender, EventArgs e)
        {
            string userEmail = Session["email"].ToString();
            //double amt = Convert.ToDouble(txtAmountToSend.Text);





        }








    }
}