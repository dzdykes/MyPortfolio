using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Lab09_Dykes
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["StudentAccount"] != null)
            {
                GetCookie();
            }
        }

        protected void ButtonSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckBoxRemember.Checked)
                {
                    SetCookie();
                }
                Response.Redirect("Default.aspx");
            }
            catch
            {
                LabelError.Text = "Invalid User Name or Password";
            }
        }

        protected void CheckBoxRemember_CheckedChanged(object sender, EventArgs e)
        {
            if(!CheckBoxRemember.Checked)
            {
                DeleteCookie();
            }
        }

        protected void GetCookie()
        {
            if (Request.Cookies["StudentAccount"]["SID"] != null)
            {
                TextBoxEmail.Text = Request.Cookies["StudentAccount"]["EM"].ToString();
            }

            if (Request.Cookies["BookReviewer"]["PW"] != null)
            {
                TextBoxPassword.Attributes.Add("value", Request.Cookies["StudentAccount"]["PW"].ToString());
            }
        }

        protected void DeleteCookie()
        {
            Response.Cookies["StudentAccount"].Expires = DateTime.Now;
            TextBoxEmail.Text = "";
            TextBoxPassword.Attributes.Add("value", "");
        }

        protected void SetCookie()
        {
            DataView dv;
            SDS_StudentAccount.Select(DataSourceSelectArguments.Empty);
            dv = (DataView)SDS_StudentAccount.Select(DataSourceSelectArguments.Empty);
            DataRow dr;
            dr = dv.Table.Rows[0];
            Session["StudentID"] = dr.ItemArray[0];

            Response.Cookies["StudentAccount"]["SID"] = dr.ItemArray[0].ToString();
            Response.Cookies["StudentAccount"]["FN"] = dr.ItemArray[1].ToString();
            Response.Cookies["StudentAccount"]["LN"] = dr.ItemArray[2].ToString();
            Response.Cookies["StudentAccount"]["EM"] = dr.ItemArray[3].ToString();
            Response.Cookies["StudentAccount"]["PW"] = dr.ItemArray[4].ToString();
            Response.Cookies["StudentAccount"]["TS"] = DateTime.Now.ToString();
            Response.Cookies["StudentAccount"].Expires = DateTime.Now.AddDays(100);
        }

    }
}