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
    <script lang="ja" type="text/javascript">
        $(document).ready(function () {
            var url = "CreditCardPage.aspx/GetCardInfo";
            var cID = <%=CreditCardService.GetID(((Members)Session["Member"]).MemberId)%>;
            $.ajax({
                url: url,
                type: "POST",
                data: "{ cardID : " + cID + " }",
                dataType: "JSON",
                contentType: "application/JSON; charset=utf-8",
                success: function (msg) {
                    var data = JSON.parse(msg.d);
                    //var expired = new Date(Date.parse(data.CreditCardExpiery));
                    var date = new Date(parseInt(data.CreditCardExpiery.substr(6)));
                    //var date = new Date(displayDate);
                    //expired = data.CreditCardExpiery;
                    //alert(date);
                    $("#ContentPlaceHolder1_txtCardNumUp").val(data.CreditCardNum);
                    Materialize.updateTextFields();
                    $("#ContentPlaceHolder1_txtCardCVVUp").val(data.CreditCardCVV);
                    Materialize.updateTextFields();
                    $("#ContentPlaceHolder1_txtMonthUp").val(date.getMonth() + 1);
                    Materialize.updateTextFields();
                    $("#ContentPlaceHolder1_txtYearUp").val(date.getFullYear().toString().substr(2));
                    Materialize.updateTextFields();
                },
                error: function (msg, xhr) {
                    alert(msg + ", " + xhr.responseText);
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <%if (!CreditCardService.HaveCard(((Members)Session["Member"]).MemberId)){ %>
    <div class="card" style="width:50vh">
        <span> הכנס כרטיס </span>
        <div class="card-content">
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="16"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtCardNumber") %>'>מספר כרטיס</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <asp:TextBox ID="txtCardCVV" runat="server" MaxLength="3"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtCardCVV") %>'>CVV</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <asp:TextBox ID="txtMonth" runat="server" MaxLength="2"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtMonth") %>'>חודש</label>
                </div>
                <div class="input-field col s6">
                    <asp:TextBox ID="txtYear" runat="server" MaxLength="2"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtYear") %>'>שנה</label>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary1" CssClass="notes" DisplayMode="List" ValidationGroup="add" runat="server"></asp:ValidationSummary>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button runat="server" ID="btnAddCard" Text="הוסף" ValidationGroup="add" CssClass="btn waves-effect waves-light" OnClick="btnAddCard_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
        <%} else { %>
        <div class="card" style="width:70vh" runat="server" id="details">
            <div class="card-title">
                <h3> פרטי הכרטיס </h3>
            </div>
            <div class="card-content">
                <asp:GridView ID="grdCard" runat="server" DataKeyNames="CreditCardId" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="CreditCardExpiery" HeaderText="תוקף" />
                <asp:BoundField DataField="CreditCardCVV" HeaderText="CVV" />
                <asp:BoundField DataField="CreditCardNum" HeaderText="מספר כרטיס" />
            </Columns>
        </asp:GridView>
            </div>
        </div>
        <div class="card" style="width:70vh" runat="server" id="updatePanel">
        <h3> עדכן כרטיס </h3>
        <div class="card-content">
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtCardNumUp" runat="server" MaxLength="16"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtCardNumUp") %>'>מספר כרטיס</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <asp:TextBox ID="txtCardCVVUp" runat="server" MaxLength="3"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtCardCVVUp") %>'>CVV</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s6">
                    <asp:TextBox ID="txtMonthUp" runat="server" MaxLength="2"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtMonthUp") %>'>חודש</label>
                </div>
                <div class="input-field col s6">
                    <asp:TextBox ID="txtYearUp" runat="server" MaxLength="2"></asp:TextBox>
                    <label for='<%#ClientID.Equals("txtYearUp") %>'>שנה</label>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary2" CssClass="notes" ValidationGroup="up" DisplayMode="List" runat="server"></asp:ValidationSummary>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button runat="server" ID="btnUpdate" Text="עדכן" ValidationGroup="up" CssClass="btn waves-effect waves-light" OnClick="btnUpdate_Click"></asp:Button>
                </div>
            </div>
        </div>
    </div>
        <%} %>
         <%-- ולידציה --%>
        <asp:RequiredFieldValidator ID="numMust" ValidationGroup="add" ControlToValidate="txtCardNumber" runat="server" ErrorMessage="חובה להכניס מספר כרטיס">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="checkNumIsNums" ValidationGroup="add" ControlToValidate="txtCardNumber" ValidationExpression="[1-9]{16}" runat="server" ErrorMessage="מספר כרטיס הוא 16 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="CVVMust" runat="server" ValidationGroup="add" ControlToValidate="txtCardCVV" ErrorMessage="חובה להכניס את הספרות">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="CVVOnlyNums" ValidationExpression="[1-9]{3}" ValidationGroup="add" ControlToValidate="txtCardCVV" runat="server" ErrorMessage="מורכב רק 3 ספרות וספרות בלבד CVV">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="monthMust" runat="server" ValidationGroup="add" ControlToValidate="txtMonth" ErrorMessage="חובה למלא חודש">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="MonthOnlyNums" runat="server" ValidationGroup="add" ControlToValidate="txtMonth" ValidationExpression="[0-9]{2}" ErrorMessage="חודש מורכב מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="yearMust" runat="server" ControlToValidate="txtYear" ValidationGroup="add" ErrorMessage="חובה למלא שנה">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="yearOnlyNums" ValidationExpression="[0-9]{2}" ValidationGroup="add" ControlToValidate="txtYear" runat="server" ErrorMessage="השנה מורכבת מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>    
        
        <%-- ולידציה לעידכון --%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="up" ControlToValidate="txtCardNumUp" runat="server" ErrorMessage="חובה להכניס מספר כרטיס">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="up" ControlToValidate="txtCardNumUp" ValidationExpression="[1-9]{16}" runat="server" ErrorMessage="מספר כרטיס הוא 16 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="up" ControlToValidate="txtCardCVVUp" ErrorMessage="חובה להכניס את הספרות">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="[1-9]{3}" ValidationGroup="add" ControlToValidate="txtCardCVVUp" runat="server" ErrorMessage="מורכב רק 3 ספרות וספרות בלבד CVV">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="up" ControlToValidate="txtMonthUp" ErrorMessage="חובה למלא חודש">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationGroup="up" ControlToValidate="txtMonthUp" ValidationExpression="[0-9]{2}" ErrorMessage="חודש מורכב מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtYearUp" ValidationGroup="up" ErrorMessage="חובה למלא שנה">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationExpression="[0-9]{2}" ValidationGroup="up" ControlToValidate="txtYearUp" runat="server" ErrorMessage="השנה מורכבת מ 2 ספרות וספרות בלבד">&nbsp</asp:RegularExpressionValidator>    

    </center>
</asp:Content>

