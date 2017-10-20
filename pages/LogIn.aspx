<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="pages_LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <asp:TextBox ID="Mail" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="MailLbl" runat="server" Text="מייל"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="Pass" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Passlbl" runat="server" Text="סיסמא"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="LogInBtn" runat="server" Text="התחבר" OnClick="LogInBtn_Click"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

