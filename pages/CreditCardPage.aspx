<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreditCardPage.aspx.cs" Inherits="pages_CreditCardPage" %>

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
<asp:ValidationSummary ID="ValidationSummary1" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
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
        <asp:RegularExpressionValidator ID="checkNumIsNums" ControlToValidate="txtCardNumber" ValidationExpression="[1-9]{16}" runat="server" ErrorMessage="מספר כרטיס הוא ספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="CVVMust" runat="server" ControlToValidate="txtCardCVV" ErrorMessage="חובה להכניס את הספרות">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CVVOnlyNums" ValidationExpression="[1-9]{3}" ControlToValidate="txtCardCVV" runat="server" ErrorMessage="מורכב רק מספרות CVV">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="monthMust" runat="server" ControlToValidate="txtMonth" ErrorMessage="חובה למלא חודש">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="MonthOnlyNums" runat="server" ControlToValidate="txtMonth" ValidationExpression="[1-9]{2}" ErrorMessage="חודש מורכב מ 2 ספרות">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="yearMust" runat="server" ControlToValidate="txtYear" ErrorMessage="חובה למלא שנה">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="yearOnlyNums" ValidationExpression="[1-9]{2}" ControlToValidate="txtYear" runat="server" ErrorMessage="השנה מורכבת מ 2 ספרות">&nbsp</asp:RegularExpressionValidator>    
        </center>
</asp:Content>

