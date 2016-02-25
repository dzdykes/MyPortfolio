<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InstrumentRental.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="css/Styles.css" rel="stylesheet" />
</head>
<body>
    <form id="formLogin" runat="server">
    <div id="DivWrapper">
        <nav class="loginNav">
            <article class="mainMenu">
                <asp:Menu ID="Menu" runat="server" BackColor="white"  
                    DynamicHorizontalOffset="2" 
                    Font-Names="Verdana" 
                    Font-Size="1em" ForeColor="#666666" 
                    Orientation="Horizontal" 
                    RenderingMode="Table" 
                    StaticEnableDefaultPopOutImage="False" 
                    StaticSubMenuIndent="10px" 
                    Width="15%">
                    <DynamicHoverStyle BackColor="white" ForeColor="#650707" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#E3EAEB" BorderStyle="Solid" />
                    <DynamicSelectedStyle BackColor="#1C5E55" />
                    <Items>
                        <asp:MenuItem Text=" | Menu" Value="Menu" ImageUrl="~/images/icons/menuIcon.gif">
                            <asp:MenuItem Text="Home" Value="Home" NavigateUrl="DefaultPublic.aspx"></asp:MenuItem>
                            <asp:MenuItem Text="Browse Instruments" Value="Browse Instruments" NavigateUrl="~/PublicBrowseInstruments.aspx"></asp:MenuItem>
                        </asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="White" />
                </asp:Menu>
            </article>
            <article class="signInMenu">
                <asp:Menu ID="MenuSignIn" runat="server" CssClass="signIn" 
                    Orientation="Horizontal" 
                    BackColor="White" 
                    DynamicHorizontalOffset="2" 
                    Font-Names="Verdana" Font-Size="1em" ForeColor="#666666" StaticSubMenuIndent="10px" Width="19.5%" OnMenuItemClick="MenuSignIn_MenuItemClick">
                    <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#E3EAEB" />
                    <DynamicSelectedStyle BackColor="#1C5E55" />
                    <Items>
                        <asp:MenuItem Text=" | Sign In" Value="Sign In" ImageUrl="~/images/icons/signInIcon.gif"></asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="White" />
                </asp:Menu>
            </article>
        </nav>
        <header class="loginHeader">
            BandFly Rentals
            <br />
            <span style="font-size:.5em">
                Fast and Easy Instrument Rentals.
            </span>
        </header>
        <section class="loginSection">
            <article class="loginButtonArticle">
                <asp:Button ID="Button_SignUp" runat="server" Text="New User? Sign Up" CssClass="loginButton" OnClick="Button_SignUp_Click" />
                or
                <asp:Button ID="Button_SignIn" runat="server" Text="Sign In" CssClass="loginButton" OnClick="Button_SignIn_Click" CausesValidation="False" />
            </article>
            <asp:Panel ID="PanelSignUp" runat="server" CssClass="signUpPanel" Visible="false">
                <table class="signUpTable">
                    <thead>
                        <tr>
                            <th colspan="2">
                                Sign Up For Free!
                            </th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="LabelMessage" runat="server" Text="* Indicates required field"></asp:Label>
                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td style="text-align:right;">
                                * User Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_UserName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">
                                * Email Address:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_Email" runat="server"></asp:TextBox>
                                <br />
                                <asp:Label ID="LabelEmailError" runat="server" CssClass="errorLabel" Text="Email associated with an exsiting account" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">
                                How did you find us?
                            </td>
                            <td>
                                <asp:RadioButtonList ID="RBL_HowFound" runat="server">
                                    <asp:ListItem Text="Socail Media" Value="Socail Media"></asp:ListItem>
                                    <asp:ListItem Text="TV" Value="TV"></asp:ListItem>
                                    <asp:ListItem Text="Radio" Value="Radio"></asp:ListItem>
                                    <asp:ListItem Text="Internet Search" Value="Internet"></asp:ListItem>
                                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">
                                * Password:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_Password" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">
                                * Confirm Password:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_ConfirmPW" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                <asp:Button ID="ButtonSignUpConfirm" runat="server" Text="Sign Up" OnClick="ButtonSignUpConfirm_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="color:lightcoral">
                                <asp:ValidationSummary ID="VS_NewUser" runat="server"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!--Validation-->
                
                <!--User Name-->
                <asp:RequiredFieldValidator ID="RFV_UserName" runat="server"
                    ControlToValidate="TB_UserName"
                    Display="None"
                    ErrorMessage="User Name is required.">
                </asp:RequiredFieldValidator>
                <!--Email Address-->
                <asp:RequiredFieldValidator ID="RFV_Email" runat="server"
                    ControlToValidate="TB_Email"
                    Display="None"
                    ErrorMessage="Email is required.">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    Display="None"
                    ControlToValidate="TB_Email"
                    ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
                    ErrorMessage="Not a valid email.">
                </asp:RegularExpressionValidator>
                <!--Password-->
                <asp:RequiredFieldValidator ID="RFV_Password" runat="server"
                    ControlToValidate="TB_Password"
                    Display="None"
                    ErrorMessage="Password is required.">
                </asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="TB_Password"
                    ControlToCompare="TB_ConfirmPW"
                    Display="None"
                    ErrorMessage="Password fields must match.">
                </asp:CompareValidator>
                <asp:RegularExpressionValidator ID="REV_Password" runat="server" 
                    ControlToValidate="TB_Password"
                    Display="None"
                    ValidationExpression="^[^-\s]{8,20}$"
                    ErrorMessage="Password must be between 8 and 20 characters" >
                </asp:RegularExpressionValidator>
            </asp:Panel>
            <asp:Panel ID="PanelLogin" runat="server" CssClass="signUpPanel" Visible="False">
                <table class="signUpTable">
                    <thead>
                        <tr>
                            <th colspan="2">
                                Welcome Back Sign In!
                            </th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <td colspan="2">
                            </td>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td style="text-align:right;">
                                User Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_LoginUN" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">
                                Password:
                            </td>
                            <td>
                                <asp:TextBox ID="TB_LoginPW" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                <asp:CheckBox ID="CB_Remember" Checked="true" runat="server" Text="Remember Me"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                <asp:Button ID="Button_SignInConfirm" runat="server" Text="Sign In" OnClick="Button_SignInConfirm_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="LabelMessage2" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
        </section>
    </div>
        <asp:SqlDataSource ID="SDS_Renter" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
            DeleteCommand="DELETE FROM [Renter] WHERE [Renter_ID] = ?" 
            InsertCommand="INSERT INTO [Renter] ([Renter_UserName], [Renter_Email], [Renter_HowFound], [Renter_Password]) VALUES (?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
            SelectCommand="SELECT [Renter_ID], [Renter_UserName], [Renter_Email], [Renter_HowFound], [Renter_Password] FROM [Renter]" 
            UpdateCommand="UPDATE [Renter] SET [Renter_UserName] = ?, [Renter_Email] = ?, [Renter_HowFound] = ?, [Renter_Password] = ? WHERE [Renter_ID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="Renter_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="TB_UserName" Name="Renter_UserName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_Email" Name="Renter_Email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="RBL_HowFound" Name="Renter_HowFound" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="TB_Password" Name="Renter_Password" PropertyName="Text" Type="String" />
                <asp:Parameter Name="Renter_ID" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Renter_UserName" Type="String" />
                <asp:Parameter Name="Renter_Email" Type="String" />
                <asp:Parameter Name="Renter_HowFound" Type="String" />
                <asp:Parameter Name="Renter_Password" Type="String" />
                <asp:Parameter Name="Renter_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SDS_RenterLogin" runat="server" ConnectionString="<%$ ConnectionStrings:BandRentalDB %>" 
            ProviderName="<%$ ConnectionStrings:BandRentalDB.ProviderName %>" 
            SelectCommand="SELECT [Renter_ID], [Renter_UserName], [Renter_Email], [Renter_Password] FROM [Renter] WHERE (([Renter_Password] = ?) AND ([Renter_UserName] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TB_LoginPW" Name="Renter_Password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="TB_LoginUN" Name="Renter_UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
