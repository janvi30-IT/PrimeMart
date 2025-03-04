using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Drawing;

namespace PrimeMart.Admin
{
    public partial class ShowProduct : System.Web.UI.Page
    {
        SqlConnection con;
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            fnDbConnection();

            if (!IsPostBack)
            {
                // Load data only once (on initial page load)
                LoadProducts();
            }
        }
        protected void fnDbConnection()
        {
            con = new SqlConnection(strcon);
            if (con.State != ConnectionState.Open)
            {
                con.Open();


            }
            else
            {
                Response.Write("fail");

            }

        }
        private void LoadProducts()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT * FROM Productstbl";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadProducts();
        }
        //protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    try
        //    {
        //        int Product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        //        GridViewRow row = GridView1.Rows[e.RowIndex];

        //        string productName = (row.FindControl("txtProductName") as TextBox).Text;
        //        string price = (row.FindControl("txtPrice") as TextBox).Text;
        //        string stock = (row.FindControl("txtStock") as TextBox).Text;
        //        string description = (row.FindControl("txtDescription") as TextBox).Text;

        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();

        //            using (SqlCommand cmd = new SqlCommand("UPDATE Productstbl SET Product_Name=@Product_Name, Price=@Price, Stock=@Stock, Description=@Description WHERE Product_id=@Product_id", con))
        //            {
        //                cmd.Parameters.AddWithValue("@Product_id", Product_id);
        //                cmd.Parameters.AddWithValue("@Product_Name", productName);
        //                cmd.Parameters.AddWithValue("@Price", price);
        //                cmd.Parameters.AddWithValue("@Stock", stock);
        //                cmd.Parameters.AddWithValue("@Description", description);

        //                cmd.ExecuteNonQuery();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Log the error or display a message to the user
        //        Response.Write("An error occurred: " + ex.Message);
        //    }

        //    GridView1.EditIndex = -1;
        //    LoadProducts();
        //}
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadProducts();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int Product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
                GridViewRow row = GridView1.Rows[e.RowIndex];

                string productName = (row.FindControl("txtProductName") as TextBox).Text;
                string price = (row.FindControl("txtPrice") as TextBox).Text;
                string stock = (row.FindControl("txtStock") as TextBox).Text;
                string description = (row.FindControl("txtDescription") as TextBox).Text;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("UPDATE Productstbl SET Product_Name=@Product_Name, Price=@Price, Stock=@Stock, Description=@Description WHERE Product_id=@Product_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Product_id", Product_id);
                        cmd.Parameters.AddWithValue("@Product_Name", productName);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Stock", stock);
                        cmd.Parameters.AddWithValue("@Description", description);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showSuccessModal('Product updated successfully!');", true);
            }
            catch (Exception ex)
            {
                // Log the error or display a message to the user
                Response.Write("An error occurred: " + ex.Message);
            }

            GridView1.EditIndex = -1;
            LoadProducts();
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Productstbl WHERE Product_id=@Product_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Product_id", Product_id);
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showSuccessModal('Product deleted successfully!');", true);
            }
            catch (Exception ex)
            {
                // Log the error or display a message to the user
                Response.Write("An error occurred: " + ex.Message);
            }

            LoadProducts();
        }
    }
}
    //    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //    {
    //        int Product_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

//        try
//        {
//            // Use a new connection for this operation
//            using (SqlConnection con = new SqlConnection(strcon))
//            {
//                con.Open(); // Open the connection

//                using (SqlCommand cmd = new SqlCommand("DELETE FROM Productstbl WHERE Product_id=@Product_id", con))
//                {
//                    cmd.Parameters.AddWithValue("@Product_id", Product_id);
//                    cmd.ExecuteNonQuery(); // Execute the delete command
//                }
//            } // The connection is automatically closed here
//        }
//        catch (Exception ex)
//        {
//            // Log the error or display a message to the user
//            Response.Write("An error occurred: " + ex.Message);
//        }

//        // Refresh the GridView
//        LoadProducts();
//    }
//}
//}
