using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrimeMart
{
    public partial class ComputerMobileAccessories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadComputerMobileAppliences();
            }
        }

        private void LoadComputerMobileAppliences()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
        SELECT Product_ID, Product_Name, Price, ImagePath 
        FROM Productstbl 
        WHERE Categories_id = (SELECT Categories_id FROM Categoriestbl WHERE Category_Name = 'Computer & Mobile Accessories')";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    dlProducts.DataSource = dt;
                    dlProducts.DataBind();
                }
            }
        }

    }
}