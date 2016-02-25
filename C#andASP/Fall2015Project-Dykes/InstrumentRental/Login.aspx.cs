using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace InstrumentRental
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["NU"].Equals("1888"))
                {
                    PanelLogin.Visible = true;
                    PanelSignUp.Visible = false;
                }
                else if (Request.QueryString["NU"].Equals("1889"))
                {
                    PanelLogin.Visible = false;
                    PanelSignUp.Visible = true;
                }

                if(Request.QueryString["NU"].Equals("86"))
                {
                    Response.Cookies["BandFlyRenter"].Expires = DateTime.Now;
                    Session["RenterID"] = null;
                }

                if(Request.QueryString["UN"]!=null)
                {
                    TB_LoginUN.Text = Request.QueryString["UN"].ToString();
                }
            }
            catch { }
        }

        protected void MenuSignIn_MenuItemClick(object sender, MenuEventArgs e)
        {
            Response.Redirect("Login.aspx?NU=1888");
        }

        protected void Button_SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?NU=1889");
        }

        protected void Button_SignIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx?NU=1888");
        }

        protected void ButtonSignUpConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                if(Page.IsValid)
                {
                    SDS_Renter.Insert();
                    Response.Redirect("Login.aspx?NU=1888&UN="+TB_UserName.Text);
                    LabelMessage2.Text = "Thanks for sign up. Please sign in to start renting.";
                }
            }
            catch 
            {
                LabelEmailError.Visible = true;
            }
        }

        protected void SetCookie()
        {
            Response.Cookies["BandFlyRenter"]["RID"] = Session["RenterID"].ToString();
            Response.Cookies["BandFlyRenter"]["UN"] = TB_LoginUN.Text;
            Response.Cookies["BandFlyRenter"]["PW"] = TB_LoginPW.Text;
            Response.Cookies["BandFlyRenter"].Expires = DateTime.Now.AddDays(100);
        }

        protected void Button_SignInConfirm_Click(object sender, EventArgs e)
        {
            if(TB_LoginUN.Text.Equals("admin")&&TB_LoginPW.Text.Equals("admin123"))
            {
                Response.Redirect("DefaultAdmin.aspx");
            }
            try
            {
                DataView dv;
                SDS_RenterLogin.Select(DataSourceSelectArguments.Empty);
                dv = (DataView)SDS_RenterLogin.Select(DataSourceSelectArguments.Empty);
                DataRow dr;
                dr = dv.Table.Rows[0];
                if (dr.ItemArray[1].ToString().Equals(TB_LoginUN.Text)
                    && dr.ItemArray[3].ToString().Equals(TB_LoginPW.Text))
                {
                    Session["RenterID"] = dr.ItemArray[0].ToString();
                    if (CB_Remember.Checked)
                    {
                        SetCookie();
                    }
                    else
                    {
                        Response.Cookies["BandFlyRenter"].Expires = DateTime.Now;
                    }
                    Response.Redirect("DefaultPublic.aspx");
                }
                else
                {
                    LabelMessage2.Text = "Login not found! " + dr.ItemArray[1].ToString() + "" + dr.ItemArray[3].ToString();
                }
            }
            catch
            {
                LabelMessage2.Text = "Could not sign in. Check the user name or password.";
            }
        }
    }
}