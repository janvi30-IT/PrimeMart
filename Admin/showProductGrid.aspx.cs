using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.IO;

namespace PrimeMart.Admin
{
    public partial class showProductGrid : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Productstbl", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridViewProducts.DataSource = dt;
                        GridViewProducts.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (e.g., log or display an error message)
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewProducts.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridViewProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int product_id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Value);
                string productName = (GridViewProducts.Rows[e.RowIndex].FindControl("txtProductName") as TextBox).Text;
                int price = Convert.ToInt32((GridViewProducts.Rows[e.RowIndex].FindControl("txtPrice") as TextBox).Text);
                int stock = Convert.ToInt32((GridViewProducts.Rows[e.RowIndex].FindControl("txtStock") as TextBox).Text);
                string description = (GridViewProducts.Rows[e.RowIndex].FindControl("txtDescription") as TextBox).Text;

                // Handle image upload
                FileUpload fileUploadImage = (FileUpload)GridViewProducts.Rows[e.RowIndex].FindControl("FileUploadImage");
                HiddenField hdnImagePath = (HiddenField)GridViewProducts.Rows[e.RowIndex].FindControl("hdnImagePath");
                string imagePath = hdnImagePath.Value; // Default to existing image path

                if (fileUploadImage.HasFile) // If a new image is uploaded
                {
                    // Save the new image to the Images folder
                    string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fileUploadImage.FileName);
                    string filePath = "~/Images/" + fileName;
                    fileUploadImage.SaveAs(Server.MapPath(filePath));

                    // Update the image path
                    imagePath = "Images/" + fileName;
                }

                // Update the database
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Productstbl SET Product_Name = @Product_Name, Price = @Price, Stock = @Stock, Description = @Description, ImagePath = @ImagePath WHERE Product_id = @Product_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Product_Name", productName);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Stock", stock);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);
                        cmd.Parameters.AddWithValue("@Product_id", product_id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                GridViewProducts.EditIndex = -1;
                BindGridView();
                lblMessage.Text = "Record updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // Handle exceptions
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridViewProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewProducts.EditIndex = -1;
            BindGridView();
        }

        protected void GridViewProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int product_id = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Productstbl WHERE Product_id = @Product_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Product_id", product_id);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                BindGridView();
                lblMessage.Text = "Record deleted successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                // Handle exceptions
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}