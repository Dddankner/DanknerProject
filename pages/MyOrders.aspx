<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="pages_MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        .grd1{
            width:80vh;
            font-size:2.4vh;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <asp:GridView ID="grdOrders" runat="server" AutoGenerateColumns="False" CssClass="bordered highlight white grd1">
        <Columns>
            <asp:BoundField DataField="OrderPrice" HeaderText="מחיר הזמנה" />
            <asp:BoundField DataField="MovieSeatsAmount" HeaderText="מספר כרטיסים" />
            <asp:BoundField DataField="MovieSeats" HeaderText="כיסאות שהוזמנו" />
            <asp:BoundField DataField="CityName" HeaderText="קולנוע" />
            <asp:BoundField DataField="MovieName" HeaderText="שם הסרט" />
        </Columns>
    </asp:GridView>
        </center>
</asp:Content>

