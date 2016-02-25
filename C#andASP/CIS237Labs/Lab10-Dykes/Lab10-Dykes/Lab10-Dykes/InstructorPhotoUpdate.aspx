<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="InstructorPhotoUpdate.aspx.cs" Inherits="Lab10_Dykes.InstructorPhotoUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="article40">
        <header class="fullArticleHeading">
            List Instructors
        </header>
        <asp:GridView ID="GV_Instructors" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="gvS" DataKeyNames="Instructor_ID" DataSourceID="SDS_Instructors" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GV_Instructors_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Instructor_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Instructor_ID" />
                <asp:BoundField DataField="First_Name" HeaderText="First Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" SortExpression="Last_Name" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </article>
    <header class="fullArticleHeading">
        Update Photo
    </header>
    <article class="article55">
        <asp:Panel ID="PanelInstructor" runat="server" Visible="false">
            <table>
                <tr>
                    <td class="fullArticleColoredBox">
                        First Name:
                    </td>
                    <td>
                        <asp:Label ID="LabelFN" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Last Name:
                    </td>
                    <td>
                        <asp:Label ID="LabelLN" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Office Number
                    </td>
                    <td>
                        <asp:Label ID="LabelOffice" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Phone Number:
                    </td>
                    <td>
                        <asp:Label ID="LabelPhone" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Email Address:
                    </td>
                    <td>
                        <asp:Label ID="LabelEmail" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Remove Photo
                    </td>
                    <td>
                        <asp:CheckBox ID="CB_RemovePhoto" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        Photo
                    </td>
                    <td>
                        <asp:Label ID="LabelPhoto" runat="server"></asp:Label>
                        <asp:FileUpload ID="FileUploadPhoto" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        &nbsp
                    </td>
                    <td>
                        <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="fullArticleColoredBox">
                        &nbsp
                    </td>
                    <td>
                        <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel> 
    </article>
    <asp:SqlDataSource ID="SDS_Instructors" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Instructor_ID], [First_Name], [Last_Name] FROM [Instructor]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstructorSelect" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [First_Name], [Last_Name], [Office_Number], [Phone_Number], [Email_Address], [Instructor_Photo], [Instructor_ID] FROM [Instructor] WHERE ([Instructor_ID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GV_Instructors" Name="Instructor_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstructorsUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        DeleteCommand="DELETE FROM [Instructor] WHERE [Instructor_ID] = ?" 
        InsertCommand="INSERT INTO [Instructor] ([Instructor_ID], [Instructor_Photo]) VALUES (?, ?)" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Instructor_ID], [Instructor_Photo] FROM [Instructor] WHERE ([Instructor_ID] = ?)" 
        UpdateCommand="UPDATE [Instructor] SET [Instructor_Photo] = ? WHERE [Instructor_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instructor_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Instructor_ID" Type="Int32" />
            <asp:Parameter Name="Instructor_Photo" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GV_Instructors" Name="Instructor_ID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="LabelPhoto" Name="Instructor_Photo" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="GV_Instructors" Name="Instructor_ID" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
