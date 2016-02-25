<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="PublicBrowseInstruments.aspx.cs" Inherits="InstrumentRental.PublicBrowseInstruments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="article100">
        <header class="publicArticleHeader">    
            Search by Type:
            <asp:DropDownList ID="DDL_Type" runat="server" AppendDataBoundItems="True" DataSourceID="SDS_Type" DataTextField="Instrument_Type" 
                DataValueField="Instrument_Type" OnSelectedIndexChanged="DDL_Type_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="--Select Type--" Value="11"></asp:ListItem>
            </asp:DropDownList>
            </header>
        <asp:GridView ID="GV_InstrumentSearch" runat="server" 
            AutoGenerateColumns="False" CssClass="gv80"
            DataKeyNames="Instrument_ID" DataSourceID="SDS_InstrumentSearch"
            AllowPaging="True" AllowSorting="True" 
            CellPadding="5" CellSpacing="5" 
            ForeColor="White" PageSize="5" BorderStyle="None" 
            GridLines="Horizontal" Visible="False" OnSelectedIndexChanged="GV_InstrumentSearch_SelectedIndexChanged">
            <Columns>
                <asp:ImageField DataImageUrlField="Instrument_Photo" 
                    DataImageUrlFormatString="images/instruments/{0}" 
                    ControlStyle-CssClass="img50" ShowHeader="False">
                    <ControlStyle CssClass="img35"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="Instrument_Type" SortExpression="Instrument_Type"
                     ShowHeader="False" HeaderText="Type" 
                    ItemStyle-CssClass="coloredcolGv" >
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Bottom" />
<ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Instrument_Description" SortExpression="Instrument_Description" ShowHeader="False" HeaderText="Description" >
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Bottom" />
                </asp:BoundField>
                <asp:BoundField DataField="Instrument_Price" SortExpression="Instrument_Price" ShowHeader="False" DataFormatString="{0:C}" HeaderText="Price/Day" ItemStyle-CssClass="coloredcolGv">
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Middle" />
<ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField SelectText="Rent Me" ShowSelectButton="True" >
                <ControlStyle CssClass="rentMe" />
                <ItemStyle Width="80px" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GV_Instruments" runat="server" 
            AutoGenerateColumns="False" CssClass="gv80" 
            DataKeyNames="Instrument_ID" DataSourceID="SDS_Instruments" 
            OnSelectedIndexChanged="GV_Instruments_SelectedIndexChanged" 
            AllowPaging="True" AllowSorting="True" 
            CellPadding="5" CellSpacing="5" 
            ForeColor="White" PageSize="5" BorderStyle="None" GridLines="Horizontal">
            <Columns>
                <asp:ImageField DataImageUrlField="Instrument_Photo" 
                    DataImageUrlFormatString="images/instruments/{0}" 
                    ControlStyle-CssClass="img50" ShowHeader="False">
                    <ControlStyle CssClass="img35"></ControlStyle>
                </asp:ImageField>
                <asp:BoundField DataField="Instrument_Type" SortExpression="Instrument_Type"
                     ShowHeader="False" HeaderText="Type" 
                    ItemStyle-CssClass="coloredcolGv" >
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Bottom" />
<ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="Instrument_Description" SortExpression="Instrument_Description" ShowHeader="False" HeaderText="Description" >
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Bottom" />
                </asp:BoundField>
                <asp:BoundField DataField="Instrument_Price" SortExpression="Instrument_Price" ShowHeader="False" DataFormatString="{0:C}" HeaderText="Price/Day" ItemStyle-CssClass="coloredcolGv">
                <HeaderStyle Font-Bold="False" Font-Size="Small" VerticalAlign="Middle" />
<ItemStyle CssClass="coloredcolGv"></ItemStyle>
                </asp:BoundField>
                <asp:CommandField SelectText="Rent Me" ShowSelectButton="True" >
                <ControlStyle CssClass="rentMe" />
                <ItemStyle Width="80px" />
                </asp:CommandField>
            </Columns>
            <EditRowStyle BorderStyle="None" />
        </asp:GridView>
    </article>
    <asp:SqlDataSource ID="SDS_Instruments" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available] FROM [Instruments] WHERE ([Instrument_Available] = ?)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Instrument_Available" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Type" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT DISTINCT [Instrument_Type] FROM [Instruments] WHERE ([Instrument_Available] = ?)">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Instrument_Available" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstrumentSearch" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
        ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
        SelectCommand="SELECT [Instrument_ID], [Instrument_Type], [Instrument_Description], [Instrument_Price], [Instrument_Photo], [Instrument_Available] FROM [Instruments] WHERE (([Instrument_Available] = ?) AND ([Instrument_Type] = ?))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Instrument_Available" Type="Int16" />
            <asp:ControlParameter ControlID="DDL_Type" Name="Instrument_Type" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstrumentID" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Instrument_ID] FROM [Instruments] WHERE ([Instrument_ID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GV_Instruments" Name="Instrument_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_InstrumentID2" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" SelectCommand="SELECT [Instrument_ID] FROM [Instruments] WHERE ([Instrument_ID] = ?)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GV_InstrumentSearch" Name="Instrument_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
