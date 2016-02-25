<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateRenter.aspx.cs" Inherits="InstrumentRental.AdminUpdateRenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <article>
        <header class="adminArticleHeader">
            Update/Delete Renter Account
        </header>
        <asp:GridView ID="GV_Instrument" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="gvFull" ForeColor="Black" PageSize="5" DataKeyNames="Renter_ID" DataSourceID="SDS_Renter">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Renter_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Renter_ID" />
                <asp:BoundField DataField="Renter_UserName" HeaderText="User Name" SortExpression="Renter_UserName" />
                <asp:BoundField DataField="Renter_Email" HeaderText="Email" SortExpression="Renter_Email" />
                <asp:BoundField DataField="Renter_FirstName" HeaderText="First Name" SortExpression="Renter_FirstName" />
                <asp:BoundField DataField="Renter_LastName" HeaderText="Last Name" SortExpression="Renter_LastName" />
                <asp:BoundField DataField="Renter_Address" HeaderText="Address" SortExpression="Renter_Address" />
                <asp:BoundField DataField="Renter_City" HeaderText="City" SortExpression="Renter_City" />
                <asp:BoundField DataField="Renter_State" HeaderText="State" SortExpression="Renter_State" />
                <asp:BoundField DataField="Renter_Zip" HeaderText="Zip" SortExpression="Renter_Zip" />
                <asp:BoundField DataField="Renter_Password" HeaderText="Password" SortExpression="Renter_Password" />
            </Columns>
            
        </asp:GridView>
    </article>
    <asp:SqlDataSource ID="SDS_Renter" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" DeleteCommand="DELETE FROM [Renter] WHERE [Renter_ID] = ?" InsertCommand="INSERT INTO [Renter] ([Renter_ID], [Renter_UserName], [Renter_Email], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip], [Renter_Password]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Renter_ID], [Renter_UserName], [Renter_Email], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip], [Renter_Password] FROM [Renter]" UpdateCommand="UPDATE [Renter] SET [Renter_UserName] = ?, [Renter_Email] = ?, [Renter_FirstName] = ?, [Renter_LastName] = ?, [Renter_Address] = ?, [Renter_City] = ?, [Renter_State] = ?, [Renter_Zip] = ?, [Renter_Password] = ? WHERE [Renter_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Renter_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Renter_ID" Type="Int32" />
            <asp:Parameter Name="Renter_UserName" Type="String" />
            <asp:Parameter Name="Renter_Email" Type="String" />
            <asp:Parameter Name="Renter_FirstName" Type="String" />
            <asp:Parameter Name="Renter_LastName" Type="String" />
            <asp:Parameter Name="Renter_Address" Type="String" />
            <asp:Parameter Name="Renter_City" Type="String" />
            <asp:Parameter Name="Renter_State" Type="String" />
            <asp:Parameter Name="Renter_Zip" Type="String" />
            <asp:Parameter Name="Renter_Password" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Renter_UserName" Type="String" />
            <asp:Parameter Name="Renter_Email" Type="String" />
            <asp:Parameter Name="Renter_FirstName" Type="String" />
            <asp:Parameter Name="Renter_LastName" Type="String" />
            <asp:Parameter Name="Renter_Address" Type="String" />
            <asp:Parameter Name="Renter_City" Type="String" />
            <asp:Parameter Name="Renter_State" Type="String" />
            <asp:Parameter Name="Renter_Zip" Type="String" />
            <asp:Parameter Name="Renter_Password" Type="String" />
            <asp:Parameter Name="Renter_ID" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
