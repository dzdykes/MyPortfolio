<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminUpdateRental.aspx.cs" Inherits="InstrumentRental.AdminUpdateRental" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <article class="article100">
        <header class="adminArticleHeader" style="color:black">
            Update/Delete Rental
        </header>
        <table class="rentalLookUpTable">
            <tr>
                <td>
                    Enter Rental ID:
                </td>
                <td>
                    <asp:TextBox ID="TB_RentalID" runat="server"></asp:TextBox>
                    <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp
                </td>
            </tr>
            <tr>
                <td>
                    Renter ID:
                </td>
                <td>
                    <asp:Label ID="LabelRenterID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Instrument ID:
                </td>
                <td>
                    <asp:Label ID="LabelInstrumentID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Total Cost:
                </td>
                <td>
                    <asp:TextBox ID="TB_Cost" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Return Date:
                </td>
                <td>
                    <asp:TextBox ID="TB_Date" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp
                </td>
                <td>
                    <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                    <asp:Button ID="ButtonDelete" runat="server" Text="Delete" OnClick="ButtonDelete_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </article>
    <asp:SqlDataSource ID="SDS_Rental" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Rental_ID], [Instrument_ID], [Renter_ID], [ReturnDate], [TotalCost] FROM [Rental] WHERE ([Rental_ID] = ?)" DeleteCommand="DELETE FROM [Rental] WHERE [Rental_ID] = ?" InsertCommand="INSERT INTO [Rental] ([Rental_ID], [Instrument_ID], [Renter_ID], [ReturnDate], [TotalCost]) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Rental] SET [ReturnDate] = ?, [TotalCost] = ? WHERE [Rental_ID] = ?">
        <DeleteParameters>
            <asp:ControlParameter ControlID="TB_RentalID" Name="Rental_ID" PropertyName="Text" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Rental_ID" Type="Int32" />
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
            <asp:Parameter Name="Renter_ID" Type="Int32" />
            <asp:Parameter Name="ReturnDate" Type="String" />
            <asp:Parameter Name="TotalCost" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TB_RentalID" Name="Rental_ID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TB_Date" Name="ReturnDate" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Cost" Name="TotalCost" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="TB_RentalID" Name="Rental_ID" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstrumentUpdate" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        DeleteCommand="DELETE FROM [Instruments] WHERE [Instrument_ID] = ?" 
        InsertCommand="INSERT INTO [Instruments] ([Instrument_ID], [Instrument_Available]) VALUES (?, ?)" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Instrument_ID], [Instrument_Available] FROM [Instruments] WHERE ([Instrument_ID] = ?)" 
        UpdateCommand="UPDATE [Instruments] SET [Instrument_Available] = 1 WHERE [Instrument_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
            <asp:Parameter Name="Instrument_Available" Type="Int16" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="LabelInstrumentID" Name="Instrument_ID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="LabelInstrumentID" Name="Instrument_ID" PropertyName="Text" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
