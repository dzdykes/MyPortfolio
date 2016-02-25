using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Lab10_Dykes
{
    public partial class InstructorPhotoUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UploadPath"] = Server.MapPath("images/");
        }

        protected void GV_Instructors_SelectedIndexChanged(object sender, EventArgs e)
        {
            PanelInstructor.Visible = true;
            DataView dvInstructor = (DataView)SDS_InstructorSelect.Select(DataSourceSelectArguments.Empty);
            LabelFN.Text = dvInstructor[0][0].ToString();
            LabelLN.Text = dvInstructor[0][1].ToString();
            LabelOffice.Text = dvInstructor[0][2].ToString();
            LabelPhone.Text = dvInstructor[0][3].ToString();
            LabelEmail.Text = dvInstructor[0][4].ToString();
            LabelPhoto.Text = dvInstructor[0][5].ToString();
        }

        protected bool Check_FileType()
        {
            bool errors = false;
            try
            {
                if (FileUploadPhoto.PostedFile.ContentType == "image/png" ||
                    FileUploadPhoto.PostedFile.ContentType == "image/jpeg" ||
                    FileUploadPhoto.PostedFile.ContentType == "image/pjpeg")
                {
                    errors = false;
                }
                else
                {
                    LabelMessage.Text = "Incorrect File Type!";
                    errors = true;
                }
            }
            catch
            {
                LabelMessage.Text = "Error uploading photo- check file type.";
            }
            return errors;
        }

        protected bool Check_FileLength()
        {
            bool errors = false;
            try
            {
                if (FileUploadPhoto.PostedFile.ContentLength > 100000)
                {
                    LabelMessage.Text = "Photo size is too large";
                    errors = true;
                }
                else
                {
                    errors = false;
                }
            }
            catch
            {
                LabelMessage.Text = "Error Uploading Photo!";
            }

            return errors;

        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            if(CB_RemovePhoto.Checked)
            {
                LabelPhoto.Text = "noimage.jpg";
                FileUploadPhoto.PostedFile.SaveAs(Session["UploadPath"] + "noimage.jpg");
                SDS_InstructorsUpdate.Update();
                LabelMessage.Text = LabelLN.Text + " was updated!";
            }
            else
            {
                try
                {
                    // both file size and file type must be correct
                    if (!Check_FileLength() && !Check_FileType())
                    {
                        LabelPhoto.Text = FileUploadPhoto.FileName.ToString();
                        FileUploadPhoto.PostedFile.SaveAs(Session["UploadPath"] + LabelPhoto.Text);
                        SDS_InstructorsUpdate.Update();
                        LabelMessage.Text = LabelLN.Text + " was updated!";
                    }
                }
                catch
                {
                    LabelMessage.Text = "ERROR: " + LabelLN.Text + " was NOT updated!";
                }
            }
            
        }
    }
}