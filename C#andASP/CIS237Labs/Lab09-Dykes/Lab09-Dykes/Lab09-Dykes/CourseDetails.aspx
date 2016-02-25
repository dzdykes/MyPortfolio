<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="Lab09_Dykes.CourseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="fullArticle">
        <asp:DetailsView ID="DV_CourseDetails" runat="server" CssClass="gvUD" AutoGenerateRows="False" DataSourceID="SDS_CourseDetails" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
            <Fields>
                <asp:BoundField DataField="Course_ID" HeaderText="Course ID" SortExpression="Course_ID" />
                <asp:BoundField DataField="Section_ID" HeaderText="Section ID" SortExpression="Section_ID" />
                <asp:BoundField DataField="Course_Name" HeaderText="Course_Name" SortExpression="Course_Name" />
                <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
                <asp:BoundField DataField="Start_Time" HeaderText="Start Time" SortExpression="Start_Time" DataFormatString="{0:t}" />
                <asp:BoundField DataField="End_Time" HeaderText="End Time" SortExpression="End_Time" DataFormatString="{0:t}" />
                <asp:BoundField DataField="Semester_Term" HeaderText="Term" SortExpression="Semester_Term" />
                <asp:BoundField DataField="Semester_Year" HeaderText="Year" SortExpression="Semester_Year" />
                <asp:BoundField DataField="Last_Name" HeaderText="Instructor" SortExpression="Last_Name" />
                <asp:BoundField DataField="Course_Description" HeaderText="Course Description" SortExpression="Course_Description" />
                <asp:BoundField DataField="Course_Credits" HeaderText="Credits" SortExpression="Course_Credits" />
                <asp:BoundField DataField="Room_Number" HeaderText="Room Number" SortExpression="Room_Number" />
                <asp:BoundField DataField="Begin_Date" HeaderText="Begin Date" SortExpression="Begin_Date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="End_Date" HeaderText="End Date" SortExpression="End_Date" DataFormatString="{0:d}" />
            </Fields>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        </asp:DetailsView>
    </article>
    <asp:SqlDataSource ID="SDS_CourseDetails" runat="server" ConnectionString="<%$ ConnectionStrings:collegeDB %>" ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" SelectCommand="SELECT [Course_ID], [Section_ID], [Course_Name], [Days], [Start_Time], [End_Time], [Semester_Term], [Semester_Year], [Last_Name], [Course_Description], [Course_Credits], [Room_Number], [Begin_Date], [End_Date] FROM [Query_ScheduleList] WHERE ([Schedule_ID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Schedule_ID" QueryStringField="SID" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
