<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="InstructorAdd.aspx.cs" Inherits="Lab10_Dykes.InstructorAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="fullArticle">
        <table class="fullArticleTable">
            <thead>
                <tr>
                    <th colspan="2">
                        Add an Instructor
                    </th>
                </tr>
            </thead>
            <tr>
                <td class="fullArticleColoredBox">
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="fullArticleColoredBox">
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="fullArticleColoredBox">
                    Office Number:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxOffice" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="fullArticleColoredBox">
                    Phone Number:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="fullArticleColoredBox">
                    Email Address:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="fullArticleColoredBox">
                    Photo
                </td>
                <td>
                    <asp:Label ID="LabelPhoto" runat="server"></asp:Label>
                    <br />
                    <asp:FileUpload ID="FileUploadPhoto" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp
                </td>
                <td>
                    <asp:Button ID="ButtonAdd" runat="server" Text="Add" class="addButton" OnClick="ButtonAdd_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </article>
    <asp:SqlDataSource ID="SDS_Instructor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        DeleteCommand="DELETE FROM [Instructor] WHERE [Instructor_ID] = ?" 
        InsertCommand="INSERT INTO [Instructor] ([First_Name], [Last_Name], [Office_Number], [Phone_Number], [Email_Address], [Instructor_Photo]) VALUES (?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Instructor_ID], [First_Name], [Last_Name], [Office_Number], [Phone_Number], [Email_Address], [Instructor_Photo] FROM [Instructor]" 
        UpdateCommand="UPDATE [Instructor] SET [First_Name] = ?, [Last_Name] = ?, [Office_Number] = ?, [Phone_Number] = ?, [Email_Address] = ?, [Instructor_Photo] = ? WHERE [Instructor_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instructor_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxFirstName" Name="First_Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxLastName" Name="Last_Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxOffice" Name="Office_Number" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxPhone" Name="Phone_Number" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxEmail" Name="Email_Address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelPhoto" Name="Instructor_Photo" PropertyName="Text" Type="String" />
            <asp:Parameter Name="Instructor_ID" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Office_Number" Type="String" />
            <asp:Parameter Name="Phone_Number" Type="String" />
            <asp:Parameter Name="Email_Address" Type="String" />
            <asp:Parameter Name="Instructor_Photo" Type="String" />
            <asp:Parameter Name="Instructor_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>