<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="pages_LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <style type="text/css">
        .notes {
            background-color: none;
            color: red;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>
            <td>
                <asp:TextBox ID="Mail" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="MailLbl" runat="server" Text="מייל"></asp:Label>
            </td>
            <td rowspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"></asp:ValidationSummary>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="Pass" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Passlbl" runat="server" Text="סיסמא"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Button ID="LogInBtn" runat="server" Text="התחבר" OnClick="LogInBtn_Click"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:RequiredFieldValidator ID="validateMail" ControlToValidate="Mail" runat="server" ErrorMessage="חובה מלא מייל">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateValidMail" ControlToValidate="Mail" runat="server" ErrorMessage="מייל לא תקין" ValidationExpression="\w+\@\w+\.com">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validatePass" ControlToValidate="Pass" runat="server" ErrorMessage="חובה למלא סיסמא">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validatePassLength" ControlToValidate="Pass" runat="server" ErrorMessage="אורך סיסמא 6-10" ValidationExpression="\w{6,10}">&nbsp</asp:RegularExpressionValidator>
        </center>
</asp:Content>

