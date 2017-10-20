<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="pages_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="tablePopUp">
        <tr>
            <td> שלח אל </td>
            <td> <%if (m1.memberManager)
                     { %><asp:DropDownList ID="ddlMembers" runat="server"></asp:DropDownList><%} %> 
                <%else
    { %> <asp:DropDownList ID="ddlManager" runat="server"></asp:DropDownList><%} %>
            </td>
        </tr>
    </table>
</asp:Content>

