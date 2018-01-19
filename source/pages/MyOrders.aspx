<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" Culture="en-GB" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="pages_MyOrders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ocv1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <style type="text/css">
        .grd1 {
            width: 120vh;
            font-size: 2.4vh;
        }

        .wid {
            width: 50vh;
        }

        input::placeholder {
            text-align: right;
        }

        input {
            text-align: right;
        }

        .notes {
            background-color: none;
            color: red;
            display: block;
        }

        .imgCss {
            border-radius: 50%;
            height: 10vh;
            width: 10vh;
        }
    </style>
    <script type="text/javascript" lang="ja">
        function ConfirmDelete(id) {
            if (confirm("אתה בטוח שברצונך למחוק הזמנה זו?")) {
                window.location.href = "DeleteOrder.aspx?id=" + id;
            }
        }
        $(document).ready(function () {
            $.getJSON("/Content/autocompleteData/GetData.ashx", function (data) {
                $('input.autocomplete').autocomplete({
                    data: JSON.parse(data),
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function (val) {
                        // Callback function when value is autcompleted.
                    },
                    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
                });
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <center>
        <div runat="server" id="grdDiv">
            <div class="card wid">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#byNum">לפי מספר</a></li>
                        <li class="tab"><a href="#byMovie">לפי סרט</a></li>
                        <li class="tab"><a href="#byDate">לפי תאריך</a></li>
                    </ul>
                </div>
                <div id="byNum">
                    <div class="row">
                        <div class="col s2">
                            <asp:Button runat="server" ID="searchByID" Text="חיפוש" OnClick="searchByID_Click"></asp:Button>
                        </div>
                        <div class="col s10">
                            <asp:TextBox runat="server" ID="txtByID" placeholder="מספר הזמנה"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
<asp:ValidationSummary ID="ValidationSummary3" ValidationGroup="idC" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
                        </div>
                    </div>
                </div>
<asp:RequiredFieldValidator ID="idVal" ValidationGroup="idC" ControlToValidate="txtByID" runat="server" ErrorMessage="חובה למלא מספר הזמנה"></asp:RequiredFieldValidator>
                <div id="byMovie">
                    <div class="row">
                        <div class="col s2">
                            <asp:Button runat="server" ID="searchByMovieName" Text="חיפוש" OnClick="searchByMovieName_Click"></asp:Button>
                        </div>
                        <div class="col s10">
                            <asp:TextBox runat="server" ID="txtByMovieName" CssClass="autocomplete" placeholder="שם הסרט"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
<asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="nameC" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
                        </div>
                    </div>
                </div>
<asp:RequiredFieldValidator ID="nameVal" ValidationGroup="nameC" runat="server" ControlToValidate="txtByMovieName" ErrorMessage="חובה למלא שם סרט"></asp:RequiredFieldValidator>
                <div id="byDate">
                    <div class="row">
                        <div class="col s6">
                            <ocv1:CalendarExtender id="Cal" runat="server" TargetControlID="txtDate" PopupButtonID="txtDate" Format="dd/MM/yyyy"></ocv1:CalendarExtender>
                    <asp:TextBox ID="txtDate" runat="server" placeholder="מתאריך"></asp:TextBox>
                        </div>
                        <div class="col s6">
                            <ocv1:CalendarExtender id="calEnd" runat="server" TargetControlID="txtEndDate" PopupButtonID="txtEndDate" Format="dd/MM/yyyy"></ocv1:CalendarExtender>
                    <asp:TextBox ID="txtEndDate" runat="server" placeholder="עד תאריך"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col s12">
                            <asp:Button runat="server" ID="searchByDate" Text="חיפוש" OnClick="searchByDate_Click"></asp:Button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
<asp:ValidationSummary CssClass="notes" DisplayMode="List" ID="ValidationSummary1" ValidationGroup="datec" runat="server"></asp:ValidationSummary>
                        </div>
                    </div>
                </div>
                <div class="card-action">
                    <asp:Button runat="server" ID="btnReset" Text="אפס" OnClick="btnReset_Click"></asp:Button>
                </div>
            </div>
            <asp:RequiredFieldValidator ID="date1Val" runat="server" ValidationGroup="dateC" ControlToValidate="txtDate" ErrorMessage="חובה למלא תאריך התחלה">&nbsp</asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="date2Val" runat="server" ValidationGroup="dateC" ControlToValidate="txtEndDate" ErrorMessage="חובה למלא תאריך סיום">&nbsp</asp:RequiredFieldValidator>

    <asp:GridView ID="grdOrders" runat="server" OnRowDeleting="grdOrders_RowDeleting" AutoGenerateColumns="False" CssClass="bordered highlight white grd1" DataKeyNames="OrderId" OnRowCommand="grdOrders_RowCommand">
        <Columns>
            <asp:ButtonField ButtonType="Button" HeaderText="מחק" Text="מחק" CommandName="delete" />
            <asp:ButtonField ButtonType="Button" HeaderText="חשבונית" Text="חשבונית" CommandName="bill" />
            <asp:BoundField DataField="OrderPrice" HeaderText="מחיר הזמנה" />
            <asp:BoundField DataField="MovieSeatsAmount" HeaderText="מספר כרטיסים" />
            <asp:BoundField DataField="MovieSeats" HeaderText="כיסאות שהוזמנו" />
            <asp:BoundField DataField="CityName" HeaderText="קולנוע" />
            <asp:BoundField DataField="MovieName" HeaderText="שם הסרט" />
        </Columns>
    </asp:GridView>
            </div>
        <div runat="server" id="bill" style="display:none" class="card wid">
            <div class="row" style="text-align:center">
                <a>חשבונית</a>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Image ID="imgPic" runat="server" CssClass="imgCss"></asp:Image>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>מספר הזמנה</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>תאריך הזמנה</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblCardNumber" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>מספר כרטיס אשראי</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblPrice" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>מחיר הזמנה</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblMovie" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>שם הסרט</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Label ID="lblSeats" runat="server"></asp:Label>
                </div>
                <div class="col s6">
                    <a>כיסאות שהוזמנו</a>
                </div>
            </div>
            <div class="row">
                <div class="col s6">
                    <asp:Button ID="btnPrint" runat="server" Text="הדפס" OnClick="btnPrint_Click"></asp:Button>
                </div>
                <div class="col s6"> 
                    <asp:Button ID="btnBack" runat="server" Text="חזור" OnClick="btnBack_Click"></asp:Button>
                </div>
            </div>
        </div>
        </center>
</asp:Content>

