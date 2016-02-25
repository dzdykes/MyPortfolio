using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Lab09_Dykes
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCreateAccount_Click(object sender, EventArgs e)
        {
            try
            {
                SDS_StudentAccount.Insert();
                LabelConfirm.Text = "Account Created!";
                Select_Student();
                SetCookie();
            }
            catch
            {
                LabelConfirm.Text = "Account NOT Created!";
            }
        }

        protected void SetCookie()
        {
            Response.Cookies["StudentAccount"]["SID"] = Session["StudentID"].ToString();
            Response.Cookies["StudentAccount"]["FN"] = TextBoxFirstName.Text;
            Response.Cookies["StudentAccount"]["LN"] = TextBoxLastName.Text;
            Response.Cookies["StudentAccount"]["EM"] = TextBoxEmailAddress.Text;
            Response.Cookies["StudentAccount"]["PW"] = TextBoxPassword.Text;
            Response.Cookies["StudentAccount"]["TS"] = DateTime.Now.ToString();
            Response.Cookies["StudentAccount"].Expires = DateTime.Now.AddDays(100);
        }
        
        protected void Select_Student()
        {
            DataView dv;
            SDS_StudentAccount.Select(DataSourceSelectArguments.Empty);
            dv = (DataView)SDS_StudentAccount.Select(DataSourceSelectArguments.Empty);
            DataRow dr;
            dr = dv.Table.Rows[0];
            Session["StudentID"] = dr.ItemArray[0];
        }
    }
}