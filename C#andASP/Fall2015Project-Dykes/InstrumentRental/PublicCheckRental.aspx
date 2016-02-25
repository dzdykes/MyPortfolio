<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="PublicCheckRental.aspx.cs" Inherits="InstrumentRental.PublicCheckRental" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="article100" style="text-align:center">
        <asp:Label ID="Label_NotSignedIn" runat="server" Text="You are not signed in." CssClass="largeLabel"></asp:Label>
        <asp:GridView ID="GV_Rental" runat="server" 
            AllowPaging="True" AllowSorting="True" 
            AutoGenerateColumns="False" CssClass="gv100" 
            DataSourceID="SDS_UserRentals" PageSize="5"
            ForeColor="White" GridLines="Horizontal"
            BorderStyle="None" CellPadding="5" CellSpacing="5">
            <Columns>
                <asp:ImageField DataImageUrlField="Instrument_Photo" 
                    DataImageUrlFormatString="images/instruments/{0}" 
                    ControlStyle-CssClass="img35" ShowHeader="False">
                <ControlStyle CssClass="img35"></ControlStyle>
                    <ItemStyle Width="150px" />
                </asp:ImageField>
                <asp:BoundField DataField="Rental_ID" HeaderText="Confirmation #" 
                    InsertVisible="False" SortExpression="Rental_ID" ItemStyle-CssClass="coloredcolGv">
                    <ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Instrument_ID" HeaderText="Instrument ID" 
                    InsertVisible="False" SortExpression="Instrument_ID" />
                <asp:BoundField DataField="Instrument_Type" HeaderText="Type" 
                    SortExpression="Instrument_Type" ItemStyle-CssClass="coloredcolGv" >
                    <ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Renter_ID" HeaderText="Your ID" 
                    SortExpression="Renter_ID" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" 
                    SortExpression="ReturnDate" ItemStyle-CssClass="coloredcolGv" >
                    <ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" 
                    SortExpression="TotalCost" DataFormatString="{0:C}" />
            </Columns>
        </asp:GridView>
    </article>
    <asp:SqlDataSource ID="SDS_UserRentals" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Instrument_Photo], [Rental_ID], [Instrument_ID], [Instrument_Type], [Renter_ID], [ReturnDate], [TotalCost] FROM [Query_RentalStatus] WHERE ([Renter_ID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
