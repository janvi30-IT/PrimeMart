using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PrimeMart
{
    public partial class SignUp_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateDropdowns(); // Populate state, city, and zip on first load
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Fetch values from input fields
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string username = txtUsername.Text.Trim(); // Corrected field
            string password = inputPassword4.Text.Trim();
            string phone = inputPhone.Text.Trim();
            string state = inputState.SelectedItem?.Text ?? "";
            string city = DropDownList1.SelectedItem?.Text ?? "";
            string zip = ddlzip.SelectedItem?.Text ?? "";

            // Retain password value after postback
            inputPassword4.Attributes["value"] = password;

            // Validate input fields
            if (string.IsNullOrWhiteSpace(firstName) || string.IsNullOrWhiteSpace(lastName) ||
                string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(phone) || string.IsNullOrWhiteSpace(state) ||
                string.IsNullOrWhiteSpace(city) || string.IsNullOrWhiteSpace(zip))
            {
                Response.Write("All fields are requried.!!");
                return;
            }

            string address = $"{city}, {state}";

            try
            {
                // Get connection string from Web.config
                string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"INSERT INTO Usertbl 
                        (First_Name, Last_Name, Username, Password, Phone_Number, Address, State, City, Postal_Code) 
                        VALUES (@FirstName, @LastName, @Username, @Password, @Phone, @Address, @State, @City, @Zip)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", firstName);
                        cmd.Parameters.AddWithValue("@LastName", lastName);
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@State", state);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@Zip", zip);

                        conn.Open();
                        int result = cmd.ExecuteNonQuery();
                        conn.Close();

                        if (result > 0)
                        {
                            Response.Write("Registration successfully.");
                            Response.Redirect("HomePage.aspx");
                        }
                        else
                        {
                            Response.Write("Registration failed. Please try again.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void inputState_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateDropdowns();
        }
        private void PopulateDropdowns()
        {
            Dictionary<string, List<string>> cities = new Dictionary<string, List<string>>()
            {
                { "Maharashtra", new List<string> { "Mumbai", "Pune", "Nagpur" } },
                { "Tamil Nadu", new List<string> { "Chennai", "Coimbatore", "Madurai" } },
                { "Delhi", new List<string> { "New Delhi" } },
                { "Gujarat", new List<string> { "Ahmedabad", "Surat", "Vadodara" } },
                { "Uttar Pradesh", new List<string> { "Lucknow", "Kanpur", "Varanasi" } },
                { "Punjab", new List<string> { "Amritsar", "Ludhiana", "Jalandhar" } },
                { "Madhya Pradesh", new List<string> { "Bhopal", "Indore", "Gwalior" } }
            };

            Dictionary<string, List<string>> zipCodes = new Dictionary<string, List<string>>()
            {
                { "Maharashtra", new List<string> { "400001", "411001", "440001" } },
                { "Tamil Nadu", new List<string> { "600001", "641001", "625001" } },
                { "Delhi", new List<string> { "110001" } },
                { "Gujarat", new List<string> { "380001", "395001", "390001" } },
                { "Uttar Pradesh", new List<string> { "226001", "208001", "221001" } },
                { "Punjab", new List<string> { "143001", "141001", "144001" } },
                { "Madhya Pradesh", new List<string> { "462001", "452001", "474001" } }
            };

            string selectedState = inputState.SelectedItem != null ? inputState.SelectedItem.Text : "";

            // Prevent duplicate insertions
            DropDownList1.Items.Clear();
            ddlzip.Items.Clear();

            if (!string.IsNullOrEmpty(selectedState) && cities.ContainsKey(selectedState))
            {
                DropDownList1.DataSource = cities[selectedState];
                DropDownList1.DataBind();

                ddlzip.DataSource = zipCodes[selectedState];
                ddlzip.DataBind();
            }

            DropDownList1.Items.Insert(0, new ListItem("--Select City--", ""));
            ddlzip.Items.Insert(0, new ListItem("--Select Zip Code--", ""));
        }
    }
}