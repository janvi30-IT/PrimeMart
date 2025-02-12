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
                string query = "INSERT INTO Producttbl (Category_id, Product_Name, Price, Stock, Description, ImagePath) " +
                               "VALUES (@CategoryID, @ProductName, @Price, @Stock, @Description, @ImagePath)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                    cmd.Parameters.AddWithValue("@Stock", Convert.ToInt32(txtStock.Text));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());

                    // Save uploaded image and store the path
                    if (fuProductImage.HasFile)
                    {
                        string filePath = "~/ProductImages/" + fuProductImage.FileName;
                        fuProductImage.SaveAs(Server.MapPath(filePath));
                        cmd.Parameters.AddWithValue("@ImagePath", filePath);
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