using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace InstrumentRental
{
    public partial class RentInstrument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                try
                {
                    if (!Session["RenterID"].ToString().Equals(""))
                    {
                        DataView dvRenter = (DataView)SDS_Renter.Select(DataSourceSelectArguments.Empty);
                        TB_FN.Text = dvRenter[0][3].ToString();
                        TB_LN.Text = dvRenter[0][4].ToString();
                        TB_EM.Text = dvRenter[0][2].ToString();
                        TB_AD.Text = dvRenter[0][5].ToString();
                        TB_CI.Text = dvRenter[0][6].ToString();
                        TB_ST.Text = dvRenter[0][7].ToString();
                        TB_ZC.Text = dvRenter[0][8].ToString();
                    }
                }
                catch
                {
                    Response.Redirect("Login.aspx");
                }

            }
        }

        protected void ButtonConfirm_Click(object sender, EventArgs e)
        {
            LabelTotalCost.Text = getTotalCost().ToString();
            SDS_RenterUpdate.Update();
            SDS_RentalInsert.Insert();
            SDS_InstrumentUpdate.Update();
            DataView dvInst = (DataView)SDS_RentalSelect.Select(DataSourceSelectArguments.Empty);
            Session["RentalID"] = dvInst[0][0];
            Response.Redirect("ConfirmPage.aspx");
        }

        protected double getTotalCost()
        {
            DataView dvInst = (DataView)SDS_Instrument.Select(DataSourceSelectArguments.Empty);
            double p = Double.Parse(dvInst[0][3].ToString());
            DateTime d = DateTime.Parse(TB_RD.Text);
            TimeSpan dur = d - DateTime.Now;
            int days = dur.Days;
            double dd = Double.Parse(days.ToString());
            return (p * dd);
        }
    }
}