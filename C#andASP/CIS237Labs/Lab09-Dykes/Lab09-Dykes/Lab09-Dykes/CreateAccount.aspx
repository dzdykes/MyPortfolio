<%@ Page Title="" Language="C#" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="Lab09_Dykes.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <article class="fullArticle">
        <header class="fullArticleHeading">
            Create Account
        </header>
        <table class="fullArticleTable">
            <tr>
                <td>
                    First Name:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Last Name:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Street:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxStreet" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    City:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxCity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    State
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DDL_State" runat="server">
                        <asp:ListItem Text="MD" Value="MD"></asp:ListItem>
                        <asp:ListItem Text="PA" Value="PA"></asp:ListItem>
                        <asp:ListItem Text="WV" Value="WV"></asp:ListItem>
                        <asp:ListItem Text="VA" Value="VA"></asp:ListItem>
                        <asp:ListItem Text="DE" Value="DE"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Zipcode
                </td>
                <td>
                    <asp:TextBox ID="TextBoxZipcode" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Primary Phone
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmailAddress" runat="server"
                        TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server"
                        TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp
                </td>
                <td>
                    <asp:Button ID="ButtonCreateAccount" runat="server" Text="Create Acount" OnClick="ButtonCreateAccount_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelConfirm" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </article>
    <asp:SqlDataSource ID="SDS_StudentAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        DeleteCommand="DELETE FROM [Student_Accounts] WHERE [Student_ID] = ?" 
        InsertCommand="INSERT INTO [Student_Accounts] ([First_Name], [Last_Name], [Street], [City], [State], [ZipCode], [Primary_Phone], [Email_Address], [Password]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
        SelectCommand="SELECT [Student_ID], [First_Name], [Last_Name], [Street], [City], [State], [ZipCode], [Primary_Phone], [Email_Address], [Password] FROM [Student_Accounts]" 
        UpdateCommand="UPDATE [Student_Accounts] SET [First_Name] = ?, [Last_Name] = ?, [Street] = ?, [City] = ?, [State] = ?, [ZipCode] = ?, [Primary_Phone] = ?, [Email_Address] = ?, [Password] = ? WHERE [Student_ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Student_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBoxFirstName" Name="First_Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxLastName" Name="Last_Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxStreet" Name="Street" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DDL_State" Name="State" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextBoxZipcode" Name="ZipCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxPhone" Name="Primary_Phone" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxEmailAddress" Name="Email_Address" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="TextBoxPassword" Name="Password" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="First_Name" Type="String" />
            <asp:Parameter Name="Last_Name" Type="String" />
            <asp:Parameter Name="Street" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Primary_Phone" Type="String" />
            <asp:Parameter Name="Email_Address" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Student_ID" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
