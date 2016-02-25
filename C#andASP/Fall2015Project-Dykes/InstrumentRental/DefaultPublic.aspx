<%@ Page Title="Home" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="DefaultPublic.aspx.cs" Inherits="InstrumentRental.DefaultPublic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="publicArticleHeader">
        <asp:HyperLink ID="HL_About" runat="server" NavigateUrl="#About" CssClass="inPageLink">About Us</asp:HyperLink>|
        <asp:HyperLink ID="HL_Contact" runat="server" NavigateUrl="#Contact" CssClass="inPageLink">Contact Us</asp:HyperLink>

    </header>
    <hr />
    <article class="article100">
        <header class="publicArticleHeader">
            Click on any picture to start renting today!
        </header>
        <table class="defaultTable">
            <tr>
                <td>
                    <asp:AdRotator ID="AR_Instrument1" runat="server" DataSourceID="XDS_Instruments" CssClass="img35" />
                </td>
                <td>
                    <asp:AdRotator ID="AR_Instrument2" runat="server" DataSourceID="XDS_Instruments" CssClass="img35"/>
                </td>
                <td>
                    <asp:AdRotator ID="AR_Instrument3" runat="server" DataSourceID="XDS_Instruments" CssClass="img35"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:AdRotator ID="AR_Instrument4" runat="server" DataSourceID="XDS_Instruments" CssClass="img35" />
                </td>
                <td>
                    <asp:AdRotator ID="AR_Instrument5" runat="server" DataSourceID="XDS_Instruments" CssClass="img35"/>
                </td>
                <td>
                    <asp:AdRotator ID="AR_Instrument6" runat="server" DataSourceID="XDS_Instruments" CssClass="img35"/>
                </td>
            </tr>
        </table>
    </article>
    <hr />
    <article class="article100" id="About">
        <header class="publicArticleHeader">
            About Us:
        </header>
        <section class="aboutSection">
            BandFly Rental Service was founded in 2015. The idea was to spread the art of music by creating fast and easy intrument rentals. Our low prices and great service
            are the reason we will be the number one intrument rental site by 2016. Because we dont have to have a fancy store we can keep our prices low. Also, many of our
            intruments were donated or bought at wholesale and we pass the savings onto you. Thank you for your continued business. We look forward to continue serving music
            lovers all across the USA!
        </section>
    </article>
    <hr />
    <article class="article100" id="Contact">
        <header class="publicArticleHeader">
            Contact Us:
        </header>
        <table class="centeredTable">
            <tr>
                <td class="coloredcolGv">
                    Phone:
                </td>
                <td>
                    1 (555) 555 5555
                </td>
            </tr>
            <tr>
                <td class="coloredcolGv">
                    Email:
                </td>
                <td>
                    BandFlyRental@fakeemail.com
                </td>
            </tr>
        </table>
    </article>
    <asp:XmlDataSource ID="XDS_Instruments" runat="server" DataFile="~/XMLInstrument.xml"></asp:XmlDataSource>
</asp:Content>