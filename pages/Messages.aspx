<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="pages_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <style type="text/css">
        .selectDrop{

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>
            <td><asp:DropDownList ID="ddlMembers" runat="server"></asp:DropDownList>
                <%--<select runat="server" multiple="true" id="ddlMembers" ></select>--%>
                <%--<asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>--%>
            </td>
            <td> שלח אל </td>
            <td> <asp:Label runat="server" ID="lblError"></asp:Label> </td>
        </tr>
        <tr>
            <td> <asp:TextBox ID="MessageSub" runat="server"></asp:TextBox> </td>
            <td> נושא </td>
        </tr>
        <tr>
            <td> <asp:TextBox ID="MessageContent" runat="server" TextMode="MultiLine"> </asp:TextBox> </td>
            <td> תוכן </td>
        </tr>
        <tr>
            <td colspan="2"> <asp:Button ID="btnSend" runat="server" Text="שלח" OnClick="btnSend_Click"></asp:Button> </td>
        </tr>
    </table>
        </center>
    <asp:GridView ID="MessagesGrid" runat="server"></asp:GridView>
</asp:Content>

