using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace InstrumentRental
{
    public partial class PublicBrowseInstruments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GV_Instruments_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dvIntsr = (DataView)SDS_InstrumentID.Select(DataSourceSelectArguments.Empty);
            Session["InstrumentRent"] = dvIntsr[0][0];
            Response.Redirect("RentInstrument.aspx");
        }

        protected void DDL_Type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(!DDL_Type.SelectedValue.ToString().Equals("11"))
            {
                GV_Instruments.Visible = false;
                GV_InstrumentSearch.Visible = true;
            }
            else
            {
                GV_Instruments.Visible = true;
                GV_InstrumentSearch.Visible = false;
            }
            
        }

        protected void GV_InstrumentSearch_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dvIntsr = (DataView)SDS_InstrumentID2.Select(DataSourceSelectArguments.Empty);
            Session["InstrumentRent"] = dvIntsr[0][0];
            Response.Redirect("RentInstrument.aspx");
        }
    }
}