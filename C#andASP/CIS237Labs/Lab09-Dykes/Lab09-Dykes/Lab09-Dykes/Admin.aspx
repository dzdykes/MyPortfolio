<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Lab09_Dykes.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="fullArticle">
        <header class="fullArticleHeading">
            System Message
        </header>
        <table class="fullArticleTable">
            <tr>
                <td>
                    System Message:
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBoxMessage" runat="server" Font-Size="1.2em" Width="85%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonSetMessage" runat="server" Text="Set Message" CssClass="addButton" OnClick="ButtonSetMessage_Click" />
                    <asp:Button ID="ButtonDeleteMessage" runat="server" Text="Delete Message" CssClass="addButton" OnClick="ButtonDeleteMessage_Click" />
                </td>
            </tr>
        </table>
    </article>
</asp:Content>
