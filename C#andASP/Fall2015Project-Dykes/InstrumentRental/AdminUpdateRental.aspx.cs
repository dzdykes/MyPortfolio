using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace InstrumentRental
{
    public partial class AdminUpdateRental : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            try
            {
                LabelMessage.Text = "";
                DataView dv = (DataView)SDS_Rental.Select(DataSourceSelectArguments.Empty);
                LabelRenterID.Text = dv[0][1].ToString();
                LabelInstrumentID.Text = dv[0][2].ToString();
                TB_Cost.Text = dv[0][4].ToString();
                TB_Date.Text = dv[0][3].ToString();
            }
            catch
            {

            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SDS_Rental.Update();
                LabelMessage.Text = "Rental Update Sucessful";
            }
            catch
            {
                LabelMessage.Text = "ERROR: Could not update Rental!";
            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            try
            {
                SDS_InstrumentUpdate.Update();
                SDS_Rental.Delete();
                LabelMessage.Text = "Rental Deleted";
                ClearFields();
            }
            catch
            {
                LabelMessage.Text = "ERROR Rental could not be deleted!";
            }
        }

        protected void ClearFields()
        {
            TB_RentalID.Text = "";
            TB_Date.Text = "";
            TB_Cost.Text = "";
            LabelInstrumentID.Text = "";
            LabelRenterID.Text = "";
        }
    }
}