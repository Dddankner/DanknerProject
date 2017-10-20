<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="pages_LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>
            <td>
                <asp:TextBox ID="Mail" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="MailLbl" runat="server" Text="מייל"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="Pass" runat="server" CssClass="txtBox"></asp:TextBox>
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
        </center>
</asp:Content>

