<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreditCardFromOrders.aspx.cs" Inherits="pages_CreditCardFromOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        input::placeholder {
            text-align: right !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <div class="card" style="width:50vh">
        <span> הכנס כרטיס </span>
        <div class="card-content">
            <div class="row">
                <div class="col s12">
                    <asp:TextBox ID="txtCardNumber" runat="server" placeholder="מספר כרטיס"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:TextBox ID="txtCardCVV" runat="server" placeholder="CVV"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:TextBox ID="txtMonth" runat="server" placeholder="חודש"></asp:TextBox>
                </div>
                <div class="col s6">
                    <asp:TextBox ID="txtYear" runat="server" placeholder="שנה"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button runat="server" ID="btnAddCard" Text="הוסף" CssClass="btn waves-effect waves-light" OnClick="btnAddCard_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
        </center>
</asp:Content>

