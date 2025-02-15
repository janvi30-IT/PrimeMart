using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrimeMart
{
    public partial class Product_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "SELECT Categories_id, Category_Name FROM Categoriestbl";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlCategory.DataSource = reader;
                    ddlCategory.DataTextField = "Category_Name";
                    ddlCategory.DataValueField = "Categories_id";
                    ddlCategory.DataBind();
                }
            }

            // Add default "Select Category" option
            ddlCategory.Items.Insert(0, new ListItem("Select Category", ""));
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ddlCategory.SelectedValue == "")
            {
                lblMessage.Text = "Please select a category.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string strcon = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                string query = "INSERT INTO Productstbl (Categories_id, Product_Name, Price, Stock, Description, ImagePath) " +
                               "VALUES (@Categories_id, @ProductName, @Price, @Stock, @Description, @ImagePath)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Categories_id", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@Stock", Convert.ToInt32(txtStock.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                    if (fuProductImage.HasFile)
                    {
                        string folderPath = Server.MapPath("~/ProductImages/");

                        // Check if the folder exists, if not, create it
                        if (!Directory.Exists(folderPath))
                        {
                            Directory.CreateDirectory(folderPath);
                        }

                        // Generate a unique filename to avoid overwriting
                        string fileName = Path.GetFileNameWithoutExtension(fuProductImage.FileName);
                        string extension = Path.GetExtension(fuProductImage.FileName);
                        string uniqueFileName = fileName + "_" + Guid.NewGuid().ToString("N") + extension;

                        string filePath = Path.Combine(folderPath, uniqueFileName);
                        fuProductImage.SaveAs(filePath);

                        // Store the relative path in the database
                        string dbFilePath = "~/ProductImages/" + uniqueFileName;
                        cmd.Parameters.AddWithValue("@ImagePath", dbFilePath);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ImagePath", DBNull.Value);
                    }


                    conn.Open();
                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Product added successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }
        }
    }
}