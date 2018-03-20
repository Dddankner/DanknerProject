<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insvitations.aspx.cs" Inherits="pages_Insvitations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <script src="../Content/js/materialize.js"></script>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('select').material_select();
            //$('ul.tabs').tabs('select_tab', '#detailsLink');
            //$("#instructionContinue").on("Click", function () {
            //    //$("#detailsLink").removeClass("active");
            //    //$("#selectDetails").css("display", "none");
            //    //$("#selectSeats").css("display", "normal");
            //    $('ul.tabs').tabs('select_tab', 'seatsLink');
            //});
            $('ul.tabs').tabs();
            //    $("#btnContinue").click( function () {
            //        $('ul.tabs').tabs('select_tab', 'seatsLink');
            //    });
            <%--("#ContentPlaceHolder1_ddlTheaters").change(function {
                <%PanelFill(); %>
            });--%>
            $("#conToSeats").click(function () {
                $.ajax({

                });
            })
        });

        function f(e, args) {

        }

        function alertSeats(id)
        {
            alert('חובה לבחור כיסאות');
            window.location.href = "Insvitations.aspx?MovieId=" + id + "#selectSeats";
        }

        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("עליך להוסיף כרטיס אשראי לפני רכישה. האם ברצונך לעבור לדף הוספת כרטיס?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>
    <style type="text/css">
        .imgCss {
            border-radius: 50%;
            height: 10vh;
            width: 10vh;
        }
        .rightAl{
            text-align:right;
        }
        .notes {
            background-color: none;
            color: red;
            display: block;
        }
        input{
            text-align:right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div class="card" style="width:70vh">
            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <%--<li class="tab"><a href="#final" id="finalLink">סיום והזמנה</a></li>--%>
                    <li class="tab disabled"><a href="#final" id="finalLink">סיום ורכישה</a></li>
                    <li class="tab disabled"><a href="#selectSeats" id="seatsLink">בחירת מקומות</a></li>
                    <li class="tab disabled"><a href="#selectDetails" class="active" id="detailsLink">בחירת פרטים</a></li>
                </ul>
            </div>
            <div id="selectDetails">
                <div class="row">
                    <div class="row">
                        <asp:Image ID="imgDdl" CssClass="imgCss" runat="server"></asp:Image>
                    </div>
                    <div class="input-field col s12">
                        <asp:DropDownList ID="ddlTheaters" runat="server" CssClass="rightAl" OnSelectedIndexChanged="ddlTheaters_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        <%--<span class="btn waves-effect waves-light" id="btnContinue"> המשך </span>--%>
                        <%--<asp:Label runat="server" ID="lblShowID"></asp:Label>--%>
                        <%--<a runat="server" style="display:none;" id="instructionContinue"> להמשך לחץ על בחירת מקומות </a>--%>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <asp:ValidationSummary ID="ValidationSummary1" CssClass="notes" DisplayMode="List" runat="server" ValidationGroup="cityVal"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator ID="validateDrp" ValidationGroup="cityVal" InitialValue="-בחר קולנוע-" ControlToValidate="ddlTheaters" runat="server" ErrorMessage="חובה לבחור קולנוע">&nbsp</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col s12">
                        <asp:Button ID="btnNext" runat="server" Text="המשך" ValidationGroup="cityVal" OnClick="btnNext_Click" CssClass="btn waves-effect waves-light"></asp:Button>
                        <%--<a id="conToSeats" class="btn waves-effect waves-light">המשך</a>--%>
                    </div>
                </div>
            </div>
            <div id="selectSeats">
                <div class="row">
                      <asp:Image ID="imgPanel" runat="server" CssClass="imgCss"></asp:Image>
                </div>
                <asp:Panel runat="server" ID="theaterPrev"></asp:Panel>
                <%--<asp:Button runat="server" ID="btnOrder" Text="בחר" CssClass="btn waves-effect waves-light" OnClick="btnOrder_Click"></asp:Button>--%>
                <%--<a class="btn waves-effect waves-light modal-trigger" href="#modal1"> בחר </a>--%>
                 <%--<a class="waves-effect waves-light btn modal-trigger" href="#modal1">Modal</a>--%>
                <div class="row">
                    <div class="col s6">
                        <asp:Button runat="server" ID="btnConToFinal" CssClass="btn waves-effect waves-light" OnClick="btnConToFinal_Click" Text="המשך"></asp:Button>
                    </div>
                    <div class="col s6">
                        <asp:Button ID="btnBackToCity" runat="server" Text="חזור" CssClass="btn waves-effect waves-light" OnClick="btnBackToCity_Click"></asp:Button>
                    </div>
                </div>
                <asp:Label runat="server" ID="lblShowSeats"></asp:Label>
            </div>
            <div id="final">
                <%if (bool.Parse(Session["final"].ToString()))
                    { %>
                <div class="row">
                    <div class="col s12">
                        <asp:Image ID="imgMovie" runat="server" CssClass="imgCss"></asp:Image>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%= MoviesService.GetMovieByID(int.Parse(Session["MovieId"].ToString())) %></a>
                    </div>
                    <div class="col s6">
                        <a>שם הסרט</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%= TheatersService.GetTheaterCity(int.Parse(Session["valueTheater"].ToString())) %></a>
                    </div>
                    <div class="col s6">
                        <a>קולנוע</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%=Session["Seats"].ToString() %></a>
                    </div>
                    <div class="col s6">
                        <a>הכיסאות שנבחרו הם</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%=Session["seatsNum"].ToString() %></a>
                    </div>
                    <div class="col s6">
                        <a>מספר הכיסאות שבחרת</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%=MoviesService.GetSeatPrice(int.Parse(Session["MovieId"].ToString())) %></a>
                    </div>
                    <div class="col s6">
                        <a>מחיר לכיסא</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col s6">
                        <a><%=MoviesService.GetSeatPrice(int.Parse(Session["MovieId"].ToString())) * int.Parse(Session["seatsNum"].ToString()) %></a>
                    </div>
                    <div class="col s6">
                        <a>מחיר כולל להזמנה</a>
                    </div>
                </div>
                <div class="row">
                    <%if (CreditCardService.HaveCard(((Members)Session["Member"]).MemberId))
                        { %>
                    <div class="col s6">
                        <a><%=CreditCardService.GetCardNum(((Members)Session["Member"]).MemberId) %></a>
                    </div>
                    <div class="col s6">
                        <a>מספר כרטיס אשראי</a>
                    </div>
                    <%}
                        else
                        { %>
                    <div class="col s12">
                        <asp:HyperLink ID="linkAddCard" runat="server"> אין לך כרטיס אשראי - לחץ כאן כדי להוסיף </asp:HyperLink>
                    </div>
                </div>
                <%}
                    } %>
                <div class="row">
                    <div class="col s6">
                        <asp:Button runat="server" ID="btnBuy" CssClass="btn waves-effect waves-light" Text="קנה" OnClick="btnOrder_Click"></asp:Button>
                    </div>
                    <div class="col s6">
                        <asp:Button runat="server" ID="btnBackToPanel" CssClass="btn waves-effect waves-light" Text="חזור" OnClick="btnBackToPanel_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
        <%--<div id="modal1" class="modal">
    <div class="modal-content">
      <h4>Modal Header</h4>
      <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
  </div>--%>
       <%-- <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>Modal Header</h4>
      <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
  </div>--%>
    </center>
</asp:Content>

