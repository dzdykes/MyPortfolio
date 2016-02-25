<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="ClassSchedule.aspx.cs" Inherits="Lab09_Dykes.ClassSchedule" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GV_Schedule" runat="server" AutoGenerateColumns="False" DataSourceID="SDS_Semester" AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="gvUD" ForeColor="#333333" GridLines="None"
        OnSelectedIndexChanged="GV_Schedule_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Schedule_ID" HeaderText="Schedule ID" SortExpression="Schedule_ID" InsertVisible="False" />
            <asp:BoundField DataField="Course_ID" HeaderText="Course ID" SortExpression="Course_ID" />
            <asp:BoundField DataField="Section_ID" HeaderText="Section ID" SortExpression="Section_ID" />
            <asp:BoundField DataField="Course_Name" HeaderText="Course Name" SortExpression="Course_Name" />
            <asp:BoundField DataField="Days" HeaderText="Days" SortExpression="Days" />
            <asp:BoundField DataField="Start_Time" HeaderText="Start Time" SortExpression="Start_Time" />
            <asp:BoundField DataField="End_Time" HeaderText="End Time" SortExpression="End_Time" />
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
    <asp:SqlDataSource ID="SDS_Semester" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Schedule_ID], [Course_ID], [Section_ID], [Course_Name], [Days], [Start_Time], [End_Time] FROM [Query_ScheduleList] WHERE (([Semester_Term] = ?) AND ([Semester_Year] = ?))">
        <SelectParameters>
            <asp:QueryStringParameter Name="Semester_Term" QueryStringField="T" Type="String" />
            <asp:QueryStringParameter Name="Semester_Year" QueryStringField="Y" Type="Int32" />
        </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
