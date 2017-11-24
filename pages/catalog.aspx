<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalog.aspx.cs" Inherits="pages_catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
            
        </ItemTemplate>
    </asp:DataList>
    <asp:Panel runat="server" ID="theaterPrev"></asp:Panel>
</asp:Content>

