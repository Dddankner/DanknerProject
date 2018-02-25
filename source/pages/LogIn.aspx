<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="pages_LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        .notes {
            background-color: none;
            color: red;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div class="card" style="width:37vw">
            <div class="card-panel">
                <div class="card-title">
                    <h3> התחברות </h3>
                </div>
                <div>

                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <%--<i class="material-icons prefix">account_circle</i>--%>
                        <asp:TextBox ID="Mail" runat="server"></asp:TextBox>
                        <label for='<%#ClientID.Equals("Mail") %>'>מייל</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <asp:TextBox ID="Pass" runat="server" TextMode="Password"></asp:TextBox>
                        <label for='<%#ClientID.Equals("Pass") %>'>סיסמא</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <asp:Button ID="LogInBtn" runat="server" Text="התחבר" CssClass="btn waves-effect waves-light" OnClick="LogInBtn_Click"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"></asp:ValidationSummary>
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    <%--<table class="tablePopUp">
        <tr>
            <td>
                <asp:TextBox ID="Mail" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="MailLbl" runat="server" Text="מייל"></asp:Label>
            </td>
            <td rowspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"></asp:ValidationSummary>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="Pass" runat="server" CssClass="txtBox" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Passlbl" runat="server" Text="סיסמא"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Button ID="LogInBtn" runat="server" Text="התחבר" OnClick="LogInBtn_Click"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>--%>
        <asp:RequiredFieldValidator ID="validateMail" ControlToValidate="Mail" runat="server" ErrorMessage="חובה מלא מייל" BorderColor="Red">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateValidMail" ControlToValidate="Mail" runat="server" ErrorMessage="מייל לא תקין" BorderColor="Red" ValidationExpression="\w+\@\w+\.com">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validatePass" ControlToValidate="Pass" runat="server" ErrorMessage="חובה למלא סיסמא" BorderColor="Red">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validatePassLength" ControlToValidate="Pass" runat="server" ErrorMessage="אורך סיסמא 6-10" BorderColor="Red" ValidationExpression="\w{6,10}">&nbsp</asp:RegularExpressionValidator>
        </center>
</asp:Content>

