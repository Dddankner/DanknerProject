<%@ Page Title="" Language="C#" Culture="en-GB" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ocv1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <%-- <style type="text/css">
        .reg td {
            padding:7px;
            direction: rtl;
            height: auto;
        }
    </style>
    <style type="text/css">
        .txtBox{
            border:none;
            border-bottom:2px solid #ccc;
            outline:none;
        }
        .txtBox:focus{
            
            border-bottom-color:blue;
        }
    </style>--%>
    <style type="text/css">
        input[type=text]{
            text-align:right;
        }
        .imgCss{
            width:5vw;
            height:5vh;
        }
        .notes {
            background-color: none;
            color: red;
            display: block;
        }

        .redC {
            color: red;
        }
        .Calendar
{
    background-color: black;
    color: white;
    font-family: Courier New;
    font-size: 17px;
    font-weight: bold;
    position:absolute;
    margin-right:6vw;
}
    </style>
    <link href="../Style/Forms.css" rel="stylesheet" />

    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
            $('.modal').modal();
            $('select').material_select();
            $('.datepicker').pickadate({
                selectMonths: true, // Creates a dropdown to control month
                selectYears: 15, // Creates a dropdown of 15 years to control year,
                today: 'Today',
                clear: 'Clear',
                close: 'Ok',
                closeOnSelect: false // Close upon selecting a date,
            });
            $('.tooltipped').tooltip({ delay: 20 });
            $('.tooltipped').tooltip({ position: 'right' });
            //$('#conToDetails').on("Click", function(){
            //    $('#detailsTab').removeClass("disabled");
            //});
        });

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
        function CheckPhoto(source, args) {
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

        function showDate() {
            alert($(".datepicker").datepicker('getDate').toString());
        }

        function conDet(id) {
            $('#detailsTab').removeClass("disabled");
            $('ul.tabs').tabs('select_tab', id);
        }

        function conPers(id) {
            $('#persTab').removeClass("disabled");
            $('ul.tabs').tabs('select_tab', id);
        }

    </script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <%--<link href="css/reg.css" rel="stylesheet" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--<div class="card" style="width:50vh">
            <div class="card-title">
                <h3>הרשמה</h3>
            </div>
            <div class="divider"></div>
            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <li class="tab"><a href="#memberDetails" class="active"> פרטי משתמש </a></li>
                    <li class="tab disabled" id="detailsTab"><a href="#acountDetails"> פרטי חשבון </a></li>
                    <li class="tab disabled" id="persTab"><a href="#personalDetails"> פרטים אישיים </a></li>
                </ul>
            </div>
            <div class="card-content">
                <div id="memberDetails">
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox runat="server" ID="txtMail" TextMode="Email"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtMail") %>'>מייל</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox runat="server" ID="txtPass" TextMode="Password" data-delay="50" CssClass="tooltipped" data-tooltip="סיסמא היא בין 6-10 תווים"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtPass") %>'>סיסמא</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox runat="server" ID="txtRePass" TextMode="Password" data-delay="50" CssClass="tooltipped" data-tooltip="סיסמא היא בין 6-10 תווים"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtRePass") %>'>אימות סיסמא</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <a class="btn" onclick="conDet('acountDetails')"> המשך </a>
                        </div>
                    </div>
                </div>
                <div id="acountDetails">
                    <div class="row">
                        <div class="col s12">
                            <asp:RadioButtonList runat="server" ID="rbtGender">
                                <asp:ListItem Text="זכר"></asp:ListItem>
                                <asp:ListItem Text="נקבה"></asp:ListItem>
                    </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <!-- Modal Trigger -->
                            <a class="waves-effect waves-light btn modal-trigger" href="#hobbiesModal">בחר קטגוריות</a>
                            <!-- Modal Structure -->
                            <div id="hobbiesModal" class="modal">
                                <div class="modal-content" style="text-align:right">
                                    <h4>תחביבים</h4>
                                    <p style="text-align:right">בחר את הקטגוריות האהובות עליך</p>
                                    <asp:CheckBoxList runat="server" ID="cbxCategories"></asp:CheckBoxList>
                                </div>
                                <div class="modal-footer" style="text-align:left">
                                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">אישור</a>
                                </div>
                           </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s9">
                             <asp:FileUpload runat="server" ID="photoUpload" />
                        </div>
                        <div class="col s3">
                            <label>בחר תמונה</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <a class="btn" onclick="conPers('personalDetails')">המשך</a>
                        </div>
                    </div>
                </div>
                <div id="personalDetails">
                    <div class="row">
                        <div class="input-field col s12">
                            <%--<i class="material-icons prefix">account_circle</i>--%>
                            <%--<asp:TextBox runat="server" ID="txtfName"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtFname") %>'>שם פרטי</label>
                        </div>
                    </div>--%>
                    <%--<%--<div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox runat="server" ID="txtlName"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtLname") %>'>שם משפחה</label>
                        </div>
                    </div>--%>
                    <%--<div class="row">
                        <div class="input-field col s12">
                            <asp:DropDownList runat="server" ID="cities"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker tooltipped" data-delay="50" data-tooltip="חובה להיות מעל גיל 13"></asp:TextBox>
                            <label for='<%#ClientID.Equals("txtDate") %>'>תאריך</label>
                        </div>--%>
                    <%--</div>
                    <div class="row">
                        <div class="col s12">
                            <a class="btn" onclick="showDate"> סיים </a>
                        </div>
                    </div>
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"/>
                    <asp:label ID="lblEror" CssClass="redC" runat="server"></asp:label>
            </div>
        </div>--%>
    <table class="tablePopUp" style="width:50vw">

            <tr>
                <td>
                    <asp:TextBox runat="server" ID="txtfName" placeholder="שם פרטי" CssClass="txtBox" ></asp:TextBox>
                </td>
                <td>
                    <asp:Label runat="server" ID="lblFname" Text="שם פרטי"></asp:Label>
                </td>
                <td rowspan="9">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"/>
                    <asp:label ID="lblEror" CssClass="redC" runat="server"></asp:label>
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
                    
                    <ocv1:CalendarExtender id="Cal" runat="server" TargetControlID="txtDate" PopupButtonID="btnDate" Format="dd/MM/yyyy"
                          CssClass="Calendar"></ocv1:CalendarExtender>
                    <%--<asp:TextBox ID="txtDate" runat="server"></asp:TextBox>--%>
                    <asp:ImageButton ID="btnDate" CssClass="imgCss" ImageUrl="~/img/Calicon.png" runat="server" CausesValidation="false"></asp:ImageButton>
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
        <asp:RequiredFieldValidator ID="CheckDate" ControlToValidate="txtDate" runat="server" ErrorMessage="חובה למלא תאריך">&nbsp</asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="validateGender" ControlToValidate="rbtGender" runat="server" ErrorMessage="חובה למלא מגדר">&nbsp</asp:RequiredFieldValidator>
        <asp:CustomValidator runat="server" id="CustomHobbies" ErrorMessage="חובה למלא תחביב" ClientValidationFunction="ValidateHobbies">&nbsp</asp:CustomValidator>
        <asp:RequiredFieldValidator runat="server" ID="validateCiies" ControlToValidate="cities" InitialValue="-בחר עיר-" ErrorMessage="עיר לא מולאה">&nbsp</asp:RequiredFieldValidator>
        <%--<asp:CompareValidator ID="CheckDateValid" ControlToValidate="txtDate" runat="server" Operator="LessThanEqual" Type="Date" ErrorMessage="תאריך צריך להיות dd/mm/yyyy">&nbsp</asp:CompareValidator>--%>
        <asp:RegularExpressionValidator ID="PhotoCheck" ControlToValidate="photoUpload" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.gif|.GIF|.jpg|.JPG|.jpeg|.JPEG|.jfif)$" runat="server" ErrorMessage="חייב להעלות תמונה">&nbsp</asp:RegularExpressionValidator>
    </center>
    \
    <div id="div1" runat="server">
    </div>
</asp:Content>

