using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab09_Dykes
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSetMessage_Click(object sender, EventArgs e)
        {
            Application["SystemMessage"] = TextBoxMessage.Text;
            Response.Redirect("Default.aspx");
        }

        protected void ButtonDeleteMessage_Click(object sender, EventArgs e)
        {
            Application["SystemMessage"] = "";
            Response.Redirect("Default.aspx");
        }
    }
}