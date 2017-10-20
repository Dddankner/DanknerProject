<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Update.aspx.cs" Inherits="pages_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .reg td {
            direction: rtl;
            height: auto;
        }
    </style>
    <style type="text/css">
        .txtBox{
            border-top:hidden;
            border-right-style:hidden;
            border-left-style:hidden;
        }
        .txtBox:focus{
            border:none;
            border-bottom-color:Highlight;
        }
    </style>
    <script type="text/javascript" lang="ja">

        function ValidateHobbies(source, args) {
            var chkListModules = document.getElementById('<%= cbxHobbies.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }

            args.IsValid = false;
        }
        function CheckPhoto(source, args)
        {
            if (document.getElementById("uploadBox").value != "") {
                var type = "";
                for (var i = document.getElementById("uploadBox").value.LastIndexOf("."); i < document.getElementById("uploadBox").value.length; i++) {
                    type += document.getElementById("uploadBox").value.charAt(i);
                }
                alert(type);
            }
            else
                args.IsValid = true;
        }
    </script>
    <link href="css/reg.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <table class="reg">

            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtfName" placeholder="שם פרטי" CssClass="txtBox" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblFname" Text="שם פרטי"></asp:Label>
                </td>
                <td rowspan="9">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    <asp:label ID="lblEror" runat="server"></asp:label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtlName" placeholder="שם משפחה" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblLname" Text="שם משפחה"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtMail" placeholder="מייל" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblMail" Text="מייל"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtPass" placeholder="סיסמא" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblPass" Text="סיסמא"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtRePass" placeholder="אימות סיסמא" TextMode="Password" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lbRePass" Text="אימות סיסמא"></asp:Label>
                </td>
            </tr>
            <%--<tr>
                <td>
                    <asp:TextBox runat="server" ID="txtPhone" placeholder="טלפון" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblPhone"  Text="טלפון" ></asp:Label>
                </td>
            </tr>--%>
            <tr>
                <td>
                    <asp:TextBox runat="server" placeholder="תאריך לידה" ID="txtDate" CssClass="txtBox"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblDate" Text="תאריך לידה"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList runat="server" ID="rbtGender">
                        <asp:ListItem Text="זכר"></asp:ListItem>
                        <asp:ListItem Text="נקבה"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblGender" Text="מגדר"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList runat="server" ID="cbxHobbies">
                        <asp:ListItem Text="כדורגל"></asp:ListItem>
                        <asp:ListItem Text="כדורסל"></asp:ListItem>
                        <asp:ListItem Text="טניס"></asp:ListItem>
                        <asp:ListItem Text="גולף"></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblHobbies" Text="תחביבים"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:FileUpload runat="server" ID="photoUpload" />
                </td>
                <td>
                    <asp:Label runat="server" ID="lblUpload" Text="העלאת תמונה"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:DropDownList runat="server" ID="cities">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblCity" Text="עיר"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtNotes"></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblNote" Text="הערות"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnSend" Text="שלח" OnClick="btnSend_Click" />
                </td>
            </tr>
        </table>
        <asp:RequiredFieldValidator ID="validateFname" ControlToValidate="txtfName" runat="server" ErrorMessage="חובה למלא שם פרטי">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateValidFname" ControlToValidate="txtfName" runat="server" ErrorMessage="שם פרטי לא תקין" ValidationExpression="[א-ת]{2,8}">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validatelName" ControlToValidate="txtlName" runat="server" ErrorMessage="חובה למלא שם משפחה">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateVlidLname" ControlToValidate="txtlName" runat="server" ErrorMessage="שם משפחה לא תקין" ValidationExpression="[א-ת]{2,8}">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validateMail" ControlToValidate="txtMail" runat="server" ErrorMessage="חובה מלא מייל">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validateValidMail" ControlToValidate="txtMail" runat="server" ErrorMessage="מייל לא תקין" ValidationExpression="\w+\@\w+\.com">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validatePass" ControlToValidate="txtPass" runat="server" ErrorMessage="חובה למלא סיסמא">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validatePassLength" ControlToValidate="txtPass" runat="server" ErrorMessage="אורך סיסמא 6-10" ValidationExpression="\w{6,10}">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="validaterePass" ControlToValidate="txtRepass" runat="server" ErrorMessage="חובה למלא אימות סיסמא">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="validaterePassLength" ControlToValidate="txtRepass" runat="server" ErrorMessage="אורך אימות סיסמא 6-10" ValidationExpression="\w{6,10}">&nbsp</asp:RegularExpressionValidator>
        <asp:CompareValidator ID="ComparePasses" ControlToCompare="txtPass" ControlToValidate="txtRepass" runat="server" ErrorMessage="סיסמא אינה זהה לאימות סיסמא">&nbsp</asp:CompareValidator>
        <asp:RequiredFieldValidator ID="validateGender" ControlToValidate="rbtGender" runat="server" ErrorMessage="חובה למלא מגדר">&nbsp</asp:RequiredFieldValidator>
        <asp:CustomValidator runat="server" id="CustomHobbies" ErrorMessage="חובה למלא תחביב" ClientValidationFunction="ValidateHobbies">&nbsp</asp:CustomValidator>
        <asp:RequiredFieldValidator runat="server" ID="validateCiies" ControlToValidate="cities" InitialValue="-בחר עיר-" ErrorMessage="עיר לא מולאה">&nbsp</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="CheckDate" ControlToValidate="txtDate" runat="server" ErrorMessage="חובה למלא תאריך">&nbsp</asp:RequiredFieldValidator>
        <%--<asp:CompareValidator ID="CheckDateValid" ControlToValidate="txtDate" runat="server" Operator="LessThanEqual" Type="Date" ErrorMessage="תאריך צריך להיות dd/mm/yyyy">&nbsp</asp:CompareValidator>--%>
        <asp:RegularExpressionValidator ID="PhotoCheck" ControlToValidate="photoUpload" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.GIF|.jpg|.JPG|.jpeg|.JPEG)$" runat="server" ErrorMessage="חייב להעלות תמונה">&nbsp</asp:RegularExpressionValidator>
    </center>
</asp:Content>

