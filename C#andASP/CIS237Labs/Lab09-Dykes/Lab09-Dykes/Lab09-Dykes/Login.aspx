<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lab09_Dykes.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="css/Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="formLogin" runat="server">
    <div id="DivWrapper">
        <header class="pageHeading">
            Class Schedules
        </header>
        <section class="mainSection">
            <article class="fullArticle">
                <table class="fullArticleTable">
                    <tr>
                        <td class="fullArticleColoredBox">
                            Email Address:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="fullArticleColoredBox">
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="fullArticleColoredBox">
                            Remember Me:
                        </td>
                        <td>
                            <asp:CheckBox ID="CheckBoxRemember" runat="server" 
                                AutoPostBack="true" Checked="true" OnCheckedChanged="CheckBoxRemember_CheckedChanged"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="fullArticleColoredBox">
                            &nbsp
                        </td>
                        <td>
                            <asp:Button ID="ButtonSignIn" runat="server" CssClass="addButton" Text="Sign In" OnClick="ButtonSignIn_Click" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="LabelError" runat="server"></asp:Label>
            </article>
        </section>
        <footer class="pageFooter">
            CIS-237
        </footer>
    </div>
        <asp:SqlDataSource ID="SDS_StudentAccount" runat="server" 
            ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
            ProviderName="<%$ ConnectionStrings:collegeDB.ProviderName %>" 
            SelectCommand="SELECT [Student_ID], [First_Name], [Last_Name], [Email_Address], [Password] FROM [Student_Accounts] WHERE ([Email_Address] = ?)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxEmail" Name="Email_Address" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
