<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="AdminAddInstrument.aspx.cs" Inherits="InstrumentRental.AdminAddInstrument" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="centeredTable">
        <thead>
            <tr>
                <td colspan="2">
                    Add an Instrument
                </td>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelMessage" runat="server"></asp:Label>
                </td>
            </tr>
        </tfoot>
        <tbody>
            <tr>
                <td class="centeredTableColorBox">
                    *Type:
                </td>
                <td>
                    <asp:TextBox ID="TB_Type" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="centeredTableColorBox">
                    Description:
                </td>
                <td>
                    <asp:TextBox ID="TB_Description" runat="server" TextMode="MultiLine" Height="63px" Width="217px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="centeredTableColorBox">
                    *Price Per Day:
                </td>
                <td>
                    <asp:TextBox ID="TB_Price" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="centeredTableColorBox">
                    Photo:
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload_Photo" runat="server" />
                    <asp:Label ID="LabelPhoto" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="centeredTableColorBox">
                    &nbsp
                </td>
                <td>
                    <asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="VS_InstrumentAdd" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    * Indicates Required Field
                </td>
            </tr>
        </tbody>
    </table>

    <!--Validation-->
    <!--Type-->
    <asp:RequiredFieldValidator ID="RFV_Type" runat="server" 
        ControlToValidate="TB_Type"
        Display="None"
        ErrorMessage="Type is a required.">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REV_Type" runat="server" 
        ControlToValidate="TB_Type"
        Display="None"
        ValidationExpression="(Saxophone|Clarinet|Guitar|Drum|Flute|Tuba|Keyboard|Piano|Trumpet|Banjo|Violin|Cello|Bass|Cowbell|Harp|Trombone|Xylophone|Triangle|French Horn|Bass|Piccolo|Bassoon|Oboe|Recorder)"
        ErrorMessage="Not a valid type." >
    </asp:RegularExpressionValidator>

    <!--Price-->
    <asp:RequiredFieldValidator ID="RFV_Price" runat="server" 
        ControlToValidate="TB_Price"
        Display="None"
        ErrorMessage="Price is a required.">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TB_Price"
        Display="None"
        ValidationExpression="(?:\d*\.)?\d+"
        ErrorMessage="Price is not valid.">
    </asp:RegularExpressionValidator>

    <asp:SqlDataSource ID="SDS_Instruments" runat="server" 
        ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        DeleteCommand="DELETE FROM [Instruments] WHERE [Instrument_ID] = ?" 
        InsertCommand="INSERT INTO [Instruments] ([Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available]) VALUES (?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available] FROM [Instruments]" 
        UpdateCommand="UPDATE [Instruments] SET [Instrument_Type] = ?, [Instrument_Description] = ?, [Instrument_Price] = ?, [Instrument_Photo] = ?, [Instrument_Available] = ? WHERE [Instrument_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TB_Type" Name="Instrument_Type" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Description" Name="Instrument_Description" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TB_Price" Name="Instrument_Price" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="LabelPhoto" Name="Instrument_Photo" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="1" Name="Instrument_Available" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Instrument_Type" Type="String" />
            <asp:Parameter Name="Instrument_Description" Type="String" />
            <asp:Parameter Name="Instrument_Price" Type="String" />
            <asp:Parameter Name="Instrument_Photo" Type="String" />
            <asp:Parameter Name="Instrument_Available" Type="Int16" />
            <asp:Parameter Name="Instrument_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
