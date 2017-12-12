<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insvitations.aspx.cs" Inherits="pages_Insvitations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <script src="../Content/js/materialize.js"></script>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('select').material_select();

            $("#conToShow").Click( function () {
                $("#detailsLink").removeClass("active");
                $("#seatsLink").addClass("active");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <div class="card" style="width:70vh">
            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <%--<li class="tab"><a href="#final" id="finalLink">סיום והזמנה</a></li>--%>
                    <li class="tab"><a href="#selectSeats" id="seatsLink">בחירת מקומות</a></li>
                    <li class="tab"><a href="#selectDetails" id="detailsLink" class="active">בחירת פרטים</a></li>
                </ul>
            </div>
            <div id="selectDetails">
                <div class="row">
                    <div class="input-field col s12">
                        <asp:DropDownList ID="ddlTheaters" runat="server" CssClass="right-align" OnSelectedIndexChanged="ddlTheaters_SelectedIndexChanged"></asp:DropDownList>
                        <a runat="server" style="display:none;" id="instructionContinue"> להמשך לחץ על בחירת מקומות </a>
                    </div>
                </div>
            </div>
            <div id="selectSeats">
                <asp:Panel runat="server" ID="theaterPrev"></asp:Panel>
            </div>
            <div id="final">

            </div>
        </div>
        
    </center>
</asp:Content>

