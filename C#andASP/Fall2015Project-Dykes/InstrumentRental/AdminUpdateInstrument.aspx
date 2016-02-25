<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateInstrument.aspx.cs" Inherits="InstrumentRental.AdminUpdateInstrument" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <article>
        <header class="adminArticleHeader">
            Update/Delete Instrument
        </header>
        <asp:GridView ID="GV_Instrument" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="gvFull" DataKeyNames="Instrument_ID" DataSourceID="SDS_Instrument" ForeColor="Black" PageSize="5">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Instrument_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Instrument_ID" />
                <asp:BoundField DataField="Instrument_Type" HeaderText="Type" SortExpression="Instrument_Type" />
                <asp:BoundField DataField="Instrument_Description" HeaderText="Description" SortExpression="Instrument_Description" />
                <asp:BoundField DataField="Instrument_Price" HeaderText="Price" SortExpression="Instrument_Price" />
                <asp:BoundField DataField="Instrument_Photo" HeaderText="Photo" SortExpression="Instrument_Photo" />
                <asp:BoundField DataField="Instrument_Available" HeaderText="Available" SortExpression="Instrument_Available" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
    </article>
    <asp:SqlDataSource ID="SDS_Instrument" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        DeleteCommand="DELETE FROM [Instruments] WHERE [Instrument_ID] = ?" 
        InsertCommand="INSERT INTO [Instruments] ([Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available]) VALUES (?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available] FROM [Instruments]" UpdateCommand="UPDATE [Instruments] SET [Instrument_Type] = ?, [Instrument_Description] = ?, [Instrument_Price] = ?, [Instrument_Photo] = ?, [Instrument_Available] = ? WHERE [Instrument_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
            <asp:Parameter Name="Instrument_Type" Type="String" />
            <asp:Parameter Name="Instrument_Description" Type="String" />
            <asp:Parameter Name="Instrument_Price" Type="Double" />
            <asp:Parameter Name="Instrument_Photo" Type="String" />
            <asp:Parameter Name="Instrument_Available" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Instrument_Type" Type="String" />
            <asp:Parameter Name="Instrument_Description" Type="String" />
            <asp:Parameter Name="Instrument_Price" Type="Double" />
            <asp:Parameter Name="Instrument_Photo" Type="String" />
            <asp:Parameter Name="Instrument_Available" Type="Int16" />
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
