<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/SitePublic.Master" AutoEventWireup="true" 
    CodeBehind="CreateAccount.aspx.cs" Inherits="Lab11_Dykes.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                    State:
                </td>
                <td class="auto-style1">
                    <asp:DropDownList ID="DDL_State" runat="server">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
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
                    Zipcode:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxZip" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Date of Birth:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxDOB" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Height:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxHeight" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Weight:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxWeight" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Primary Phone:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email Address:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEmailAddress" runat="server"
                        TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword" runat="server"
                        TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password Again:
                </td>
                <td>
                    <asp:TextBox ID="TextBoxPassword2" runat="server"
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
            <tr>
                <td colspan="2" style="color:darkred">
                    <asp:ValidationSummary ID="VS_CreateAccount" runat="server" />
                </td>
            </tr>
        </table>
    </article>
    <!-- Validation -->

    <!-- First Name -->
    <asp:RequiredFieldValidator ID="RFV_FirstName" runat="server" 
        ControlToValidate="TextBoxFirstName"
        Display="None"
        ErrorMessage="First Name is required.">
    </asp:RequiredFieldValidator>

    <!-- Last Name -->
    <asp:RequiredFieldValidator ID="RFV_LastName" runat="server" 
        ControlToValidate="TextBoxLastName"
        Display="None"
        ErrorMessage="Last Name is required.">
    </asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CustomValidator1" runat="server" 
        ControlToValidate="TextBoxLastName"
        OnServerValidate="ValidateLastName"
        Display="None"
        ErrorMessage="Last Name must be at least 3 characters">
    </asp:CustomValidator>

    <!--Street-->
    <asp:RequiredFieldValidator ID="RFV_Street" runat="server" 
        ControlToValidate="TextBoxStreet"
        Display="None"
        ErrorMessage="Street Name is required">
    </asp:RequiredFieldValidator>

    <!--City-->
    <asp:RequiredFieldValidator ID="RVF_City" runat="server" 
        ControlToValidate="TextBoxCity"
        Display="None"
        ErrorMessage="City Name is required">
    </asp:RequiredFieldValidator>

    <!--State-->
    <asp:RequiredFieldValidator ID="RFV_State" runat="server" 
        ControlToValidate="DDL_State"
        Display="None"
        ErrorMessage="State is required">
    </asp:RequiredFieldValidator>

    <!--Zip-->
    <asp:RequiredFieldValidator ID="RFV_Zip" runat="server" 
        ControlToValidate="TextBoxZip"
        Display="None"
        ErrorMessage="Zip code is required">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REV_Zip" runat="server" 
        ControlToValidate="TextBoxZip"
        ValidationExpression="^[\s\S]{5,9}$"
        Display="None"
        ErrorMessage="Zip code must be 5 to 9 characters">
    </asp:RegularExpressionValidator>

    <!-- Email -->
    <asp:RequiredFieldValidator ID="RFV_Email" runat="server" 
        ControlToValidate="TextBoxEmailAddress"
        Display="None"
        ErrorMessage="Email Address is Required">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REV_Email" runat="server" 
        ControlToValidate="TextBoxEmailAddress"
        ValidationExpression="^(?(&quot;&quot;)(&quot;&quot;.+?&quot;&quot;@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$"
        Display="None"
        ErrorMessage="Must be a valid email address">
    </asp:RegularExpressionValidator>

    <!--Phone-->
    <asp:RequiredFieldValidator ID="RFV_Phone" runat="server"
        ControlToValidate="TextBoxPhone" 
        Display="None"
        ErrorMessage="Phone number is required">
    </asp:RequiredFieldValidator>

    <!--DOB-->
    <asp:RequiredFieldValidator ID="RFV_DOB" runat="server" 
        ControlToValidate="TextBoxDOB"
        Display="None"
        ErrorMessage="Birth Date is required">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REV_DOB" runat="server" 
        ControlToValidate="TextBoxDOB"
        Display="None"
        ValidationExpression="^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$"
        ErrorMessage="Birth Date must be valid date">
    </asp:RegularExpressionValidator>

    <!-- Height -->
    <asp:CompareValidator ID="CV_Height" runat="server" 
        ControlToValidate="TextBoxHeight"
        Operator="DataTypeCheck"
        Type="Integer"
        Display="None"
        ErrorMessage="Height must be an integer.">
    </asp:CompareValidator>
    <asp:RangeValidator ID="RV_Height" runat="server" 
        ControlToValidate="TextBoxHeight"
        MaximumValue="84"
        MinimumValue="36"
        Display="None"
        ErrorMessage="Height Must be between 36 inches and 84 inches.">
    </asp:RangeValidator>
    
    <!-- Weight -->
    <asp:CompareValidator ID="CV_Weight" runat="server" 
        ControlToValidate="TextBoxWeight"
        Operator="DataTypeCheck"
        Type="Integer"
        Display="None"
        ErrorMessage="Weight must be an integer.">
    </asp:CompareValidator>
    <asp:RangeValidator ID="RV_Weight" runat="server"
        ControlToValidate="TextBoxWeight"
        MaximumValue="250"
        MinimumValue="150"
        Display="None"
        ErrorMessage="Weight Must be between 150 and 250 pounds">
    </asp:RangeValidator>

    <!--Password-->
    <asp:RequiredFieldValidator ID="RFV_Password" runat="server" 
        ControlToValidate="TextBoxPassword"
        Display="None"
        ErrorMessage="Password is required">
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="REV_Password" runat="server" 
        ControlToValidate="TextBoxPassword"
        Display="None"
        ValidationExpression="^[\s\S]{8,}$"
        ErrorMessage="Password must be at least 8 characters">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CV_Password" runat="server" 
        ControlToValidate="TextBoxPassword"
        ControlToCompare="TextBoxPassword2"
        Display="None"
        ErrorMessage="Password and Password Again must match">
    </asp:CompareValidator>

    <asp:SqlDataSource ID="SDS_StudentAccount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:collegeDB %>" 
        DeleteCommand="DELETE FROM [Student_Accounts] WHERE [Student_ID] = ?" 
        InsertCommand="INSERT INTO [Student_Accounts] ([First_Name], [Last_Name], [Street], [City], [State], [ZipCode], [Primary_Phone], [Email_Address], [Password], [BirthDate], [Height], [Weight]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
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
            <asp:ControlParameter ControlID="TextBoxDOB" Name="BirthDate" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxHeight" Name="Height" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBoxWeight" Name="Weight" PropertyName="Text" />
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
