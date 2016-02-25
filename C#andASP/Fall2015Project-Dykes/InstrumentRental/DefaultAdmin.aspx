<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="DefaultAdmin.aspx.cs" Inherits="InstrumentRental.DefaultAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:Panel ID="Panel" runat="server" CssClass="smallCenteredPanel">
        <ul>
            <li>
                <asp:HyperLink ID="HL_InstrumentAdd" runat="server" NavigateUrl="~/AdminAddInstrument.aspx">Add an Instrument</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HL_InstrumentUpdate" runat="server" NavigateUrl="~/AdminUpdateInstrument.aspx">Update/Delete an Instrument</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HL_RenterUpdate" runat="server" NavigateUrl="~/AdminUpdateRenter.aspx">Update/Delete Renter</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HL_RentalUpdate" runat="server" NavigateUrl="~/AdminUpdateRental.aspx">Update/Delete Rental</asp:HyperLink>
            </li>
            <li>
                <asp:HyperLink ID="HL_PulicHome" runat="server" NavigateUrl="~/DefaultPublic.aspx">Return to Public Home</asp:HyperLink>
            </li>
        </ul>
    </asp:Panel>
</asp:Content>
