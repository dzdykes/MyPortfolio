<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmPage.aspx.cs" Inherits="InstrumentRental.ConfirmPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation</title>
    <link href="css/Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="formConfirmPage" runat="server">
    <div id="DivWrapper">
        <header class="publicHeader">
            Confirmation Page
        </header>
        <asp:DetailsView ID="DV_Confirm" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CssClass="dvFull" DataSourceID="SDS_Confirm" ForeColor="Black" GridLines="Vertical" Width="50%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="Rental_ID" HeaderText="Confirmation Number" InsertVisible="False" SortExpression="Rental_ID"></asp:BoundField>
                <asp:BoundField DataField="Renter_ID" HeaderText="Your ID" SortExpression="Renter_ID" />
                <asp:BoundField DataField="Instrument_ID" HeaderText="Instrument ID" InsertVisible="False" SortExpression="Instrument_ID" />
                <asp:BoundField DataField="Instrument_Type" HeaderText="Instrument Type" SortExpression="Instrument_Type" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" SortExpression="ReturnDate" />
                <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" SortExpression="TotalCost" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Renter_FirstName" HeaderText="First Name" SortExpression="Renter_FirstName" />
                <asp:BoundField DataField="Renter_LastName" HeaderText="Last Name" SortExpression="Renter_LastName" />
                <asp:BoundField DataField="Renter_Address" HeaderText="Street Address" SortExpression="Renter_Address" />
                <asp:BoundField DataField="Renter_City" HeaderText="City" SortExpression="Renter_City" />
                <asp:BoundField DataField="Renter_State" HeaderText="State" SortExpression="Renter_State" />
                <asp:BoundField DataField="Renter_Zip" HeaderText="Zip Code" SortExpression="Renter_Zip" />
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>
        <article style="text-align:center">    
            <asp:HyperLink ID="HL_Home" runat="server" Text="Return Home" NavigateUrl="DefaultPublic.aspx" ></asp:HyperLink>
        </article>
    </div>
        <asp:SqlDataSource ID="SDS_Confirm" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Rental_ID], [Renter_ID], [Instrument_ID], [Instrument_Type], [ReturnDate], [TotalCost], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip] FROM [Query_Confirm] WHERE (([Rental_ID] = ?) AND ([Rental_ID] = ?))">
            <SelectParameters>
                <asp:SessionParameter Name="Rental_ID" SessionField="RentalID" Type="Int32" />
                <asp:SessionParameter Name="Rental_ID2" SessionField="RentalID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
