<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreditCardFromOrders.aspx.cs" Inherits="pages_CreditCardFromOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        input::placeholder {
            text-align: right !important;
        }
        .notes {
            background-color: none;
            color: red;
            display: block;
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
                    <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16" placeholder="מספר כרטיס"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:TextBox ID="txtCardCVV" runat="server" placeholder="CVV" MaxLength="3"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:TextBox ID="txtMonth" runat="server" placeholder="חודש" MaxLength="2"></asp:TextBox>
                </div>
                <div class="col s6">
                    <asp:TextBox ID="txtYear" runat="server" placeholder="שנה" MaxLength="2"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:ValidationSummary ID="ValidationSummary1" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Label runat="server" ID="lblError"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button runat="server" ID="btnAddCard" Text="הוסף" CssClass="btn waves-effect waves-light" OnClick="btnAddCard_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
         <%-- ולידציה --%>
        <asp:RequiredFieldValidator ID="numMust" ControlToValidate="txtCardNumber" runat="server" ErrorMessage="חובה להכניס מספר כרטיס">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="checkNumIsNums" ControlToValidate="txtCardNumber" ValidationExpression="[1-9]{16}" runat="server" ErrorMessage="מספר כרטיס הוא 16 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="CVVMust" runat="server" ControlToValidate="txtCardCVV" ErrorMessage="חובה להכניס את הספרות">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CVVOnlyNums" ValidationExpression="[0-9]{3}" ControlToValidate="txtCardCVV" runat="server" ErrorMessage="מורכב רק 3 ספרות וספרות בלבד CVV">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="monthMust" runat="server" ControlToValidate="txtMonth" ErrorMessage="חובה למלא חודש">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="MonthOnlyNums" runat="server" ControlToValidate="txtMonth" ValidationExpression="[0-9]{2}" ErrorMessage="חודש מורכב מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="yearMust" runat="server" ControlToValidate="txtYear" ErrorMessage="חובה למלא שנה">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="yearOnlyNums" ValidationExpression="[0-9]{2}" ControlToValidate="txtYear" runat="server" ErrorMessage="השנה מורכבת מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>    
    </center>
</asp:Content>

