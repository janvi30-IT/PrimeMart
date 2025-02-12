using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace PrimeMart
{
    public partial class Categories_form : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnDbConnection();
        }
        protected void fnDbConnection()
        {
            string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            conn = new SqlConnection(strcon);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();


            }
            else
            {
                Response.Write("fail");

            }

        }



        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            string categoryName = txtCategoryName.Text.Trim();

            // Validate inputs
            if (string.IsNullOrEmpty(categoryName))
            {
                lblMessage.Text = "Category Name is required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string imagePath = "";
            if (fuImage.HasFile)
            {
                // Ensure the folder exists
                string uploadFolder = Server.MapPath("~/Uploads/CategoryImages/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                // Save image file
                string fileName = Path.GetFileName(fuImage.FileName);
                string fileExtension = Path.GetExtension(fileName);
                string newFileName = "Category_" + DateTime.Now.Ticks + fileExtension;
                imagePath = "/Uploads/CategoryImages/" + newFileName;
                fuImage.SaveAs(uploadFolder + newFileName);
            }
            else
            {
                lblMessage.Text = "Please upload an image.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            // Insert into database
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "INSERT INTO Categoriestbl (Category_Name, ImageURL) VALUES (@CategoryName, @ImageURL)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryName", categoryName);
                    cmd.Parameters.AddWithValue("@ImageURL", imagePath);

                    conn.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    conn.Close();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Category added successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;

                        // Clear Fields
                        txtCategoryName.Text = "";

                        // Refresh GridView
                        //LoadCategories();
                    }
                    else
                    {
                        lblMessage.Text = "Error adding category.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }
    }
}
    
