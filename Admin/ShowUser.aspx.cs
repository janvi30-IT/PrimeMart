using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace PrimeMart.Admin
{
    public partial class ShowUser : System.Web.UI.Page
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
                    using (SqlCommand cmd = new SqlCommand("SELECT Username, First_Name, Last_Name, Role, IsActive FROM Usertbl", con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        GridViewUsers.DataSource = dt;
                        GridViewUsers.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string username = GridViewUsers.DataKeys[e.RowIndex].Value.ToString();
                string role = (GridViewUsers.Rows[e.RowIndex].FindControl("ddlRole") as DropDownList).SelectedValue;
                bool isActive = (GridViewUsers.Rows[e.RowIndex].FindControl("chkStatus") as CheckBox).Checked;

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE Usertbl SET Role = @Role, IsActive = @IsActive WHERE Username = @Username", con))
                    {
                        cmd.Parameters.AddWithValue("@Role", role);
                        cmd.Parameters.AddWithValue("@IsActive", isActive);
                        cmd.Parameters.AddWithValue("@Username", username);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                GridViewUsers.EditIndex = -1;
                BindGridView();
                lblMessage.Text = "User updated successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            BindGridView();
        }
    }
}