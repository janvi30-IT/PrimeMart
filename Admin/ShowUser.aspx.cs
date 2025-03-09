//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI.WebControls;

//namespace YourNamespace
//{
//    public partial class ShowUser : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                BindGridView();
//            }
//        }

//        private void BindGridView()
//        {
//            // Connection string to your database
//            string connectionString = "YourConnectionStringHere";

//            // SQL query to fetch data
//            string query = "SELECT First_Name, Last_Name, Username, Phone_Number, Address, State, City, Postal_Code FROM Usertbl";

//            // Create a connection and command
//            using (SqlConnection connection = new SqlConnection(connectionString))
//            {
//                using (SqlCommand command = new SqlCommand(query, connection))
//                {
//                    try
//                    {
//                        // Open the connection
//                        connection.Open();

//                        // Execute the query and fetch data into a DataTable
//                        SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
//                        DataTable dataTable = new DataTable();
//                        dataAdapter.Fill(dataTable);

//                        // Bind the DataTable to the GridView
//                        GridView1.DataSource = dataTable;
//                        GridView1.DataBind();
//                    }
//                    catch (Exception ex)
//                    {
//                        // Handle exceptions (e.g., log or display an error message)
//                        Response.Write("An error occurred: " + ex.Message);
//                    }
//                }
//            }
//        }
//    }
//}