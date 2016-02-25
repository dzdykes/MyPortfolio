using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstrumentRental
{
    public partial class DefaultAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InstrumentUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUpdateInstrument.aspx");
        }

        protected void InstrumentAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddInstrument.aspx");
        }
    }
}