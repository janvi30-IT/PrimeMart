using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace PrimeMart
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        private void LoadProducts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT Product_ID, Product_Name, Price, ImagePath 
                    FROM Productstbl 
                    WHERE Categories_id = (SELECT Categories_id FROM Categoriestbl WHERE Category_Name = 'Dals')";

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