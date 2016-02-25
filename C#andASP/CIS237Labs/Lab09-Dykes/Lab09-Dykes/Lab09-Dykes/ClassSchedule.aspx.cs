using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Lab09_Dykes
{
    public partial class ClassSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["StudentID"]==null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void GV_Schedule_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataView dvSchedule = (DataView)SDS_Semester.Select(DataSourceSelectArguments.Empty);
                String sid = dvSchedule[GV_Schedule.SelectedIndex][0].ToString();
                Response.Redirect("CourseDetails.aspx?SID=" + sid);
            }
            catch { }
        }

    }
}