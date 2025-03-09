using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace PrimeMart.Admin
{
    public partial class ShowCategories : System.Web.UI.Page
    {
        SqlConnection con;
        string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT * FROM Categoriestbl"; // Fetch data from Categoriestbl
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewCategories.DataSource = dt;
                GridViewCategories.DataBind();
            }
        }

        protected void GridViewCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewCategories.EditIndex = e.NewEditIndex;
            LoadCategories();
        }

        protected void GridViewCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewCategories.EditIndex = -1;
            LoadCategories();
        }

        protected void GridViewCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int categoryId = Convert.ToInt32(GridViewCategories.DataKeys[e.RowIndex].Value);
                GridViewRow row = GridViewCategories.Rows[e.RowIndex];

                // Get the updated category name
                string categoryName = (row.FindControl("txtCategoryName") as TextBox).Text;

                // Get the FileUpload control
                FileUpload fileUploadImage = (FileUpload)row.FindControl("fileUploadImage");

                // Get the current image path from the hidden label
                Label lblCurrentImage = (Label)row.FindControl("lblCurrentImage");
                string currentImagePath = lblCurrentImage.Text;

                string newImagePath = currentImagePath; // Default to the current image path

                // Check if a new file is uploaded
                if (fileUploadImage.HasFile)
                {
                    // Validate the file type (optional)
                    string fileExtension = System.IO.Path.GetExtension(fileUploadImage.FileName).ToLower();
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                    {
                        // Define the folder to save the uploaded image
                        string uploadFolder = Server.MapPath("~/Uploads/CategoryImages/");

                        // Generate a unique file name to avoid overwriting existing files
                        string fileName = "Category_" + DateTime.Now.Ticks + fileExtension;

                        // Save the file to the server
                        fileUploadImage.SaveAs(uploadFolder + fileName);

                        // Set the new image path
                        newImagePath = "~/Uploads/CategoryImages/" + fileName;
                    }
                    else
                    {
                        // Show an error message if the file type is invalid
                        ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showSuccessModal('Invalid file type. Only JPG, JPEG, and PNG files are allowed.');", true);
                        return;
                    }
                }

                // Update the database
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("UPDATE Categoriestbl SET Category_Name=@Category_Name, ImageURL=@ImageURL WHERE Categories_id=@Categories_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Categories_id", categoryId);
                        cmd.Parameters.AddWithValue("@Category_Name", categoryName);
                        cmd.Parameters.AddWithValue("@ImageURL", newImagePath);

                        cmd.ExecuteNonQuery();
                    }
                }

                // Show success message
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showSuccessModal('Category updated successfully!');", true);
            }
            catch (Exception ex)
            {
                // Log the error or display a message to the user
                Response.Write("An error occurred: " + ex.Message);
            }

            // Exit edit mode and refresh the GridView
            GridViewCategories.EditIndex = -1;
            LoadCategories();
        }
        protected void GridViewCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int categoryId = Convert.ToInt32(GridViewCategories.DataKeys[e.RowIndex].Value);

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Categoriestbl WHERE Categories_id=@Categories_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Categories_id", categoryId);
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "showSuccessModal('Category deleted successfully!');", true);
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
            }

            LoadCategories();
        }
    }
}