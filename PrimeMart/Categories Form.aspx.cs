using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace PrimeMart
{
    public partial class Categories_Form : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnDBConnection();
        }
        public void fnDBConnection()
        {
            try
            {
                string strconn = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                conn = new SqlConnection(strconn);
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("connection successful");
                }
                else
                {
                    Response.Write("fail");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
                throw;
            }

        }
    }
}
