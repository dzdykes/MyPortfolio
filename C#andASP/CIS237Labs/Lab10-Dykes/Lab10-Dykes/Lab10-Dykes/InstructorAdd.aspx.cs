using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab10_Dykes
{
    public partial class InstructorAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UploadPath"] = Server.MapPath("images/");
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            if(FileUploadPhoto.PostedFile.ToString().Equals(""))
            {
                LabelPhoto.Text = "noimage.jpg";
                FileUploadPhoto.PostedFile.SaveAs(Session["UploadPath"] + "noimage.jpg");
                SDS_Instructor.Insert();
                LabelMessage.Text = TextBoxLastName.Text + " was updated!";
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
                        SDS_Instructor.Insert();
                        LabelMessage.Text = TextBoxLastName.Text + " was added!";
                    }
                    else
                    {
                        LabelPhoto.Text = "noimage.jpg";
                        FileUploadPhoto.PostedFile.SaveAs(Session["UploadPath"] + "noimage.jpg");
                        SDS_Instructor.Insert();
                        LabelMessage.Text = TextBoxLastName.Text + " was added with no image!";
                    }
                }
                catch
                {
                    LabelMessage.Text = "ERROR: " + TextBoxLastName.Text + " was NOT added!";
                }
            }   
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
    }
}