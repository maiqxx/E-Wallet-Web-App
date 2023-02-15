using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace My_EWallet
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string connDB = WebConfigurationManager.ConnectionStrings["connDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckForPageSkipping();
        }

        void CheckForPageSkipping()
        {

            if (HttpContext.Current.Session["email"] == null)
                Response.Redirect("Login.aspx");
        }

    }
}