<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="InstructorList.aspx.cs" Inherits="Lab10_Dykes.InstructorList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="fullArticle">
        <header class="fullArticleHeading">
            List of Instructors
        </header>
        <asp:GridView ID="GV_Instructos" runat="server" AutoGenerateColumns="False" DataKeyNames="Instructor_ID" DataSourceID="SDS_Instructors" CellPadding="4" CssClass="gvUD" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Instructor_ID" HeaderText="Instructor_ID" InsertVisible="False" ReadOnly="True" SortExpression="Instructor_ID" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Office_Number" HeaderText="Office_Number" SortExpression="Office_Number" />
                <asp:BoundField DataField="Phone_Number" HeaderText="Phone_Number" SortExpression="Phone_Number" />
                <asp:BoundField DataField="Email_Address" HeaderText="Email_Address" SortExpression="Email_Address" />
                <asp:ImageField DataImageUrlField="Instructor_Photo" HeaderText="Photo" DataImageUrlFormatString="images/{0}">
                    <ControlStyle Width="70%" />
                </asp:ImageField>
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
    <asp:SqlDataSource ID="SDS_Instructors" runat="server" ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Instructor_ID], [First_Name], [Last_Name], [Office_Number], [Phone_Number], [Email_Address], [Instructor_Photo] FROM [Instructor]"></asp:SqlDataSource>
</asp:Content>
