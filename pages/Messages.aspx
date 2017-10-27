<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="pages_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>            
            <td> <%if (m1.memberManager)
                     { %><asp:DropDownList ID="ddlMembers" runat="server"></asp:DropDownList><%} %> 
                <%else
    { %> <asp:DropDownList ID="ddlManager" runat="server"></asp:DropDownList><%} %>
            </td>
            <td> שלח אל </td>
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

