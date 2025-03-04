using System;
using System.Web.UI;

namespace PrimeMart
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any page initialization logic here
            }
        }
    }
}
