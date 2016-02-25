<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="RentInstrument.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="InstrumentRental.RentInstrument" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="article50">
        <header class="publicArticleHeader">
            Instrument Details
        </header>
        <asp:DetailsView ID="DV_Instrument" runat="server" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="Instrument_ID" DataSourceID="SDS_Instrument" ForeColor="Black" GridLines="None" CssClass="dvFull">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <Fields>
                <asp:ImageField DataImageUrlField="Instrument_Photo" 
                    DataImageUrlFormatString="images/instruments/{0}" 
                    ControlStyle-CssClass="img50" ShowHeader="False">
                    <ControlStyle CssClass="img35"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="Instrument_ID" HeaderText="Instrument ID" InsertVisible="False" ReadOnly="True" SortExpression="Instrument_ID" />
                <asp:BoundField DataField="Instrument_Type" HeaderText="Type" SortExpression="Instrument_Type" />
                <asp:BoundField DataField="Instrument_Description" HeaderText="Description" SortExpression="Instrument_Description" />
                <asp:BoundField DataField="Instrument_Price" HeaderText="Price/Day" SortExpression="Instrument_Price" DataFormatString="{0:C}" />
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:DetailsView>
    </article>
    <article class="article50">
        <header class="publicArticleHeader">
            Shipping Information
        </header>
        <table class="detailsTable">
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="TB_FN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="TB_LN" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     Email Address:
                </td>
                <td>
                    <asp:TextBox ID="TB_EM" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Expected Return Date:
                </td>
                <td>
                    <asp:TextBox ID="TB_RD" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Address:
                </td>
                <td>
                    <asp:TextBox ID="TB_AD" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="TB_CI" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    State:
                </td>
                <td>
                    <asp:TextBox ID="TB_ST" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Zip Code:
                </td>
                <td>
                    <asp:TextBox ID="TB_ZC" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp
                </td>
                <td>
                    <asp:Button ID="ButtonConfirm" runat="server" Text="Confirm" OnClick="ButtonConfirm_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelTotalCost" runat="server" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" />
                </td>
            </tr>
        </table>
    </article>
    <!--First Name-->
    <asp:RequiredFieldValidator ID="RFV_FN" runat="server" 
        Display="None"
        ControlToValidate="TB_FN"
        ErrorMessage="First name is required.">
    </asp:RequiredFieldValidator>
    <!--Last Name-->
    <asp:RequiredFieldValidator ID="RFV_LN" runat="server" 
        Display="None"
        ControlToValidate="TB_LN"
        ErrorMessage="Last name is required.">
    </asp:RequiredFieldValidator>
    <!--Email-->
    <asp:RequiredFieldValidator ID="RFV_EM" runat="server" 
        Display="None"
        ControlToValidate="TB_EM"
        ErrorMessage="Email is required.">
    </asp:RequiredFieldValidator>
    <!--Return Date-->
    <asp:RequiredFieldValidator ID="RFV_RD" runat="server" 
        Display="None"
        ControlToValidate="TB_RD"
        ErrorMessage="Return date is required.">
    </asp:RequiredFieldValidator>
    <!--Address-->
    <asp:RequiredFieldValidator ID="RFV_AD" runat="server" 
        Display="None"
        ControlToValidate="TB_AD"
        ErrorMessage="Address is required.">
    </asp:RequiredFieldValidator>
    <!--City-->
    <asp:RequiredFieldValidator ID="RFV_CI" runat="server" 
        Display="None"
        ControlToValidate="TB_CI"
        ErrorMessage="City is required.">
    </asp:RequiredFieldValidator>
    <!--State-->
    <asp:RequiredFieldValidator ID="RFV_ST" runat="server" 
        Display="None"
        ControlToValidate="TB_ST"
        ErrorMessage="State is required.">
    </asp:RequiredFieldValidator>
    <!--Zip-->
    <asp:RequiredFieldValidator ID="RFV_ZC" runat="server" 
        Display="None"
        ControlToValidate="TB_ZC"
        ErrorMessage="Zip code is required.">
    </asp:RequiredFieldValidator>

    <asp:SqlDataSource ID="SDS_Instrument" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo] FROM [Instruments] WHERE ([Instrument_ID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="Instrument_ID" SessionField="InstrumentRent" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Renter" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Renter_ID], [Renter_UserName], [Renter_Email], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip] FROM [Renter] WHERE ([Renter_ID] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_RenterUpdate" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        DeleteCommand="DELETE FROM [Renter] WHERE [Renter_ID] = ?" 
        InsertCommand="INSERT INTO [Renter] ([Renter_ID], [Renter_Email], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Renter_ID], [Renter_Email], [Renter_FirstName], [Renter_LastName], [Renter_Address], [Renter_City], [Renter_State], [Renter_Zip] FROM [Renter] WHERE ([Renter_ID] = ?)" 
        UpdateCommand="UPDATE [Renter] SET [Renter_Email] = ?, [Renter_FirstName] = ?, [Renter_LastName] = ?, [Renter_Address] = ?, [Renter_City] = ?, [Renter_State] = ?, [Renter_Zip] = ? WHERE [Renter_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Renter_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Renter_ID" Type="Int32" />
            <asp:Parameter Name="Renter_Email" Type="String" />
            <asp:Parameter Name="Renter_FirstName" Type="String" />
            <asp:Parameter Name="Renter_LastName" Type="String" />
            <asp:Parameter Name="Renter_Address" Type="String" />
            <asp:Parameter Name="Renter_City" Type="String" />
            <asp:Parameter Name="Renter_State" Type="String" />
            <asp:Parameter Name="Renter_Zip" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TB_EM" Name="Renter_Email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_FN" Name="Renter_FirstName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_LN" Name="Renter_LastName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_AD" Name="Renter_Address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_CI" Name="Renter_City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_ST" Name="Renter_State" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_ZC" Name="Renter_Zip" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_RentalInsert" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" DeleteCommand="DELETE FROM [Rental] WHERE [Rental_ID] = ?" InsertCommand="INSERT INTO [Rental] ([Instrument_ID], [Renter_ID], [ReturnDate], [TotalCost]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Rental_ID], [Instrument_ID], [Renter_ID], [ReturnDate], [TotalCost] FROM [Rental]" UpdateCommand="UPDATE [Rental] SET [Instrument_ID] = ?, [Renter_ID] = ?, [ReturnDate] = ?, [TotalCost] = ? WHERE [Rental_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Rental_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="Instrument_ID" SessionField="InstrumentRent" Type="Int32" />
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
            <asp:ControlParameter ControlID="TB_RD" Name="ReturnDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelTotalCost" Name="TotalCost" PropertyName="Text" Type="Double" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
            <asp:Parameter Name="Renter_ID" Type="Int32" />
            <asp:Parameter Name="ReturnDate" Type="String" />
            <asp:Parameter Name="TotalCost" Type="Double" />
            <asp:Parameter Name="Rental_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_RentalSelect" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Rental_ID], [Instrument_ID], [Renter_ID], [ReturnDate] FROM [Rental] WHERE (([Renter_ID] = ?) AND ([Instrument_ID] = ?) AND ([ReturnDate] = ?))">
        <SelectParameters>
            <asp:SessionParameter Name="Renter_ID" SessionField="RenterID" Type="Int32" />
            <asp:SessionParameter Name="Instrument_ID" SessionField="InstrumentRent" Type="Int32" />
            <asp:ControlParameter ControlID="TB_RD" Name="ReturnDate" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstrumentUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" DeleteCommand="DELETE FROM [Instruments] WHERE [Instrument_ID] = ?" InsertCommand="INSERT INTO [Instruments] ([Instrument_ID], [Instrument_Available]) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Instrument_ID], [Instrument_Available] FROM [Instruments] WHERE ([Instrument_ID] = ?)" UpdateCommand="UPDATE [Instruments] SET [Instrument_Available] = ? WHERE [Instrument_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
            <asp:Parameter Name="Instrument_Available" Type="Int16" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Instrument_ID" SessionField="InstrumentRent" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DefaultValue="0" Name="Instrument_Available" Type="Int16" />
            <asp:SessionParameter Name="Instrument_ID" SessionField="InstrumentRent" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
