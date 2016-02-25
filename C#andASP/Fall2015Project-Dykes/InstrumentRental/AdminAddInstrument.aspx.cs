using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InstrumentRental
{
    public partial class AdminAddInstrument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UploadPath"] = Server.MapPath("images/instruments/");
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if (FileUpload_Photo.PostedFile.ToString().Equals(""))
            {
                LabelPhoto.Text = "defaultimage.jpg";
                FileUpload_Photo.PostedFile.SaveAs(Session["UploadPath"] + "defaultimage.jpg");
                SDS_Instruments.Insert();
                LabelMessage.Text = "The new " + TB_Type.Text + " was added.";
            }
            else
            {
                try
                {
                    // both file size and file type must be correct
                    if (!Check_FileLength() && !Check_FileType())
                    {
                        LabelPhoto.Text = FileUpload_Photo.FileName.ToString();
                        FileUpload_Photo.PostedFile.SaveAs(Session["UploadPath"] + LabelPhoto.Text);
                        SDS_Instruments.Insert();
                        LabelMessage.Text = "A new " + TB_Type.Text + " was added.";
                    }
                    else
                    {
                        LabelPhoto.Text = "defaultimage.jpg";
                        FileUpload_Photo.PostedFile.SaveAs(Session["UploadPath"] + "defaultimage.jpg");
                        SDS_Instruments.Insert();
                        LabelMessage.Text = "The new " + TB_Type.Text + " was added with no image.";
                    }
                }
                catch
                {
                    LabelMessage.Text = "ERROR: The " + TB_Type.Text + " was NOT added!";
                }
            }
        }

        protected bool Check_FileType()
        {
            bool errors = false;
            try
            {
                if (FileUpload_Photo.PostedFile.ContentType == "image/png" ||
                    FileUpload_Photo.PostedFile.ContentType == "image/jpeg" ||
                    FileUpload_Photo.PostedFile.ContentType == "image/pjpeg")
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
                if (FileUpload_Photo.PostedFile.ContentLength > 100000)
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
    }
}