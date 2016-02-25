using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstrumentRental
{
    public partial class PublicCheckRental : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["RenterID"]!=null)
            {
                Label_NotSignedIn.Visible = false;
            }
            else
            {
                Label_NotSignedIn.Visible = true;
            }

        }
    }
}