using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace PrimeMart.Admin
{
    public partial class Product_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        // Load categories into the dropdown list
        private void LoadCategories()
        {
            string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT Categories_id, Category_name FROM Categoriestbl";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    ddlCategory.DataSource = cmd.ExecuteReader();
                    ddlCategory.DataTextField = "Category_name";
                    ddlCategory.DataValueField = "Categories_id";
                    ddlCategory.DataBind();
                }
            }

            // Add default "Select Category" option
            ddlCategory.Items.Insert(0, new ListItem("Select Category", ""));
        }

        // Handle form submission
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                string categoryID = ddlCategory.SelectedValue;
                string productName = txtProductName.Text.Trim();
                decimal price = Convert.ToDecimal(txtPrice.Text);
                int stock = Convert.ToInt32(txtStock.Text);
                string description = txtDescription.Text.Trim();
                string imagePath = "Images/default.jpg"; // Default image path

                // Handle file upload
                if (fuProductImage.HasFile)
                {
                    string fileExtension = Path.GetExtension(fuProductImage.FileName).ToLower();
                    string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (Array.Exists(allowedExtensions, ext => ext == fileExtension))
                    {
                        // Generate a unique file name to avoid conflicts
                        string fileName = Path.GetFileNameWithoutExtension(fuProductImage.FileName);
                        string extension = Path.GetExtension(fuProductImage.FileName);
                        string uniqueFileName = fileName + "_" + Guid.NewGuid().ToString("N") + extension;

                        // Save the file to the Images folder
                        imagePath = "Images/" + uniqueFileName;
                        string savePath = Server.MapPath("~/" + imagePath);
                        fuProductImage.SaveAs(savePath);
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Only .jpg, .jpeg, .png, .gif files are allowed.";
                        return;
                    }
                }

                // Insert product into the database
                using (SqlConnection conn = new SqlConnection(strcon))
                {
                    string query = "INSERT INTO Productstbl (Categories_id, Product_Name, Price, Stock, Description, ImagePath) " +
                                   "VALUES (@CategoryID, @ProductName, @Price, @Stock, @Description, @ImagePath)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@CategoryID", categoryID);
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Stock", stock);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@ImagePath", imagePath);

                        try
                        {
                            conn.Open();
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Green;
                                lblMessage.Text = "Product added successfully!";
                                ClearFields();
                            }
                            else
                            {
                                lblMessage.ForeColor = System.Drawing.Color.Red;
                                lblMessage.Text = "Error adding product.";
                            }
                        }
                        catch (Exception ex)
                        {
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                            lblMessage.Text = "An error occurred: " + ex.Message;
                        }
                    }
                }
            }
        }

        // Clear form fields after successful submission
        private void ClearFields()
        {
            ddlCategory.SelectedIndex = 0;
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtStock.Text = "";
            txtDescription.Text = "";
            fuProductImage.Dispose(); // Clear the file upload control
        }

        // Custom validation for file upload
        protected void ValidateFileUpload(object source, ServerValidateEventArgs args)
        {
            if (fuProductImage.HasFile)
            {
                string fileExtension = Path.GetExtension(fuProductImage.FileName).ToLower();
                string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
                args.IsValid = Array.Exists(allowedExtensions, ext => ext == fileExtension);
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}