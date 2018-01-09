<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieAdd.aspx.cs" Inherits="pages_MovieAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <script src="../Content/js/materialize.js"></script>
    <style type="text/css">
        .showAddMov, .showAddTheater, a.backMovie, a.backTheater, a.backCategory, a.addCategory {
            font-family: 'Lato';
            color: black;
            border: 3px solid black;
            padding: 15px 10px;
            display: block;
            text-align: center;
            margin: 25px auto;
            width: 50%;
            text-decoration: none;
            cursor: pointer;
            font-size: 20px;
            font-weight: 500;
        }

        .notes {
            background-color: none;
            color: red;
            display: block;
        }

            .showAddMov:hover, .showAddTheater:hover, a.backCategory:hover, a.addCategory:hover, a.backTheater:hover, a.backMovie:hover {
                background: black;
                color: white;
            }

        .row {
            background-color: white;
            text-align: right !important;
        }
        

            /*.row:hover {
                background-color: gainsboro;
                box-shadow: 5px 5px 10px #888888;
            }*/

        .grdView {
            box-shadow: 5px 5px 10px #888888;
            text-align:right;

        }
        /*input[type=checkbox] .cbxst{
            direction: rtl !important;
        }*/

        /*select .selDrp{
            direction: rtl !important;
            text-align:right !important;
        }*/

        .grdView1 {
            /*box-shadow: 5px 5px 10px #888888;*/
            direction: rtl;
        }

        .imgCss {
            height: 30px;
            width: 30px;
        }
        input::placeholder {
            text-align: right !important;
        }
        input {
            text-align: right !important;
            direction: rtl !important;
        }

        div {
            text-align: right !important;
        }
    </style>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('select').material_select();
            $("#activeUlMovie").addClass("active");

            $(".showAddMov").on("click", function () {
                $("#btns").fadeOut(200);
                $("#addMovie").fadeIn(1200);
            });
            $(".backMovie").on("click", function () {
                $("#addMovie").fadeOut(200);
                $("#btns").fadeIn(1200);
            });
            $(".showAddTheater").on("click", function () {
                $("#btns").fadeOut(200);
                $("#addTheater").fadeIn(1200);
            });
            $(".backTheater").on("click", function () {
                $("#addTheater").fadeOut(200);
                $("#btns").fadeIn(1200);
            });
            $(".addCategory").on("click", function () {
                $("#btns").fadeOut(200);
                $("#addCategory").fadeIn(1200);
            });
            $(".backCategory").on("click", function () {
                $("#addCategory").fadeOut(200);
                $("#btns").fadeIn(1200);
            })
        })
        <%--<%--function ValidateHobbies(source, args) {
            var chkListModules = document.getElementById('<%= ddlCity.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }

            args.IsValid = false;
        }--%>
        function ValidateHobbies(source, args) {
            var chkListModules = document.getElementById('<%= ddlCity.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }

            args.IsValid = false;
        }

        function ValidateHobbiesUp(source, args) {
            var chkListModules = document.getElementById('<%= ddlTheatersUpdate.ClientID %>');
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
            if (document.getElementById("fuPic").value != "") {
                var type = "";
                for (var i = document.getElementById("fuPic").value.LastIndexOf("."); i < document.getElementById("uploadBox").value.length; i++) {
                    type += document.getElementById("fuPic").value.charAt(i);
                }
                alert(type);
            }
            else
                args.IsValid = true;
        }

        function CheckPhotoUp(source, args) {
            if (document.getElementById("fuPicUpdate").value != "") {
                var type = "";
                for (var i = document.getElementById("fuPicUpdate").value.LastIndexOf("."); i < document.getElementById("uploadBox").value.length; i++) {
                    type += document.getElementById("fuPicUpdate").value.charAt(i);
                }
                alert(type);
            }
            else
                args.IsValid = true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="btns" style="width:40vh;">
        <a class="showAddMov"> נהל סרטים </a>
        <a class="showAddTheater"> נהל בתי קולנוע </a>
        <a class="addCategory"> נהל קטגוריות </a>
            <%--<asp:GridView runat="server" ID="categoryGrd" AutoGenerateColumns="False" CssClass="highlight striped" OnRowEditing="categoryGrd_RowEditing" OnRowCommand="categoryGrd_RowCommand" OnRowDataBound="categoryGrd_RowDataBound">
                <Columns>
                    <asp:CommandField ButtonType="Button" DeleteText="מחק" HeaderText="מחק" ShowDeleteButton="True" />
                    <asp:CommandField ButtonType="Button" EditText="עדכן" HeaderText="עדכן" ShowEditButton="True" />
                    <asp:BoundField DataField="CategoryName" HeaderText="שם קטגוריה" />
                    <asp:BoundField DataField="CategoryId" HeaderText="מספר סידורי" />
                </Columns>
            </asp:GridView>--%>
            <table runat="server" id="tblCatUpdate" style="display:none; direction:rtl">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtUpdateCat" placeholder="שם קטגוריה" CssClass="txtBox"></asp:TextBox>
                        
                    </td>
                    <td>
                        <asp:Label runat="server" ID="hidID"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="upCat" Text="עדכן" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="addMovie" style="display:none; width:100%; text-align:center">
            <div class="card" style="width:50vh; margin-left:37%">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#updateMovie">עדכן סרט</a></li>
                        <li class="tab"><a href="#showMovie">הצג סרטים</a></li>
                        <li class="tab"><a class="active" href="#addMovieDiv" id="activeUlMovie">הוסף סרט</a></li>
                    </ul>
                </div>
                <div class="card-content white lighten-4">
                    <div id="addMovieDiv">
                        <div class="row"><%--<a href="MovieAdd.aspx">MovieAdd.aspx</a>--%>
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtMovieName"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtMovieName") %>'>שם סרט</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtMovieSeatPrice"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtMovieSeatPrice") %>'>מחיר לכרטיס</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtNumSeats"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtNumSeats") %>'>מספר כיסאות</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <%--<asp:DropDownList ID="ddlCity" runat="server" multiple>
                                </asp:DropDownList>--%>
                                <label>בחר קולנוע</label>
                                <asp:CheckBoxList ID="ddlCity" runat="server"></asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                                <%--<label>בחר קטגוריה</label>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s9">
                                <asp:FileUpload ID="fuPic" runat="server"></asp:FileUpload>
                            </div>
                            <div class="col s3">
                                <label>בחר תמונה</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtTrailer"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtTrailer") %>'>טריילר</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox ID="txtSum" TextMode="MultiLine" CssClass="materialize-textarea" runat="server"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtSum") %>'>תקציר</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary1" CssClass="notes" DisplayMode="List" runat="server" ValidationGroup="MovieAdd"></asp:ValidationSummary>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12" style="text-align:center !important">
                                <asp:Button ID="btnAdd" ValidationGroup="MovieAdd" runat="server" OnClick="btnAdd_Click" Text="הוסף סרט" CssClass="btn waves-effect waves-light"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="txtMovieNameMust" ValidationGroup="MovieAdd" ControlToValidate="txtMovieName" runat="server" ErrorMessage="חובה למלא שם סרט">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="seatPriceMust" ValidationGroup="MovieAdd" ControlToValidate="txtMovieSeatPrice" runat="server" ErrorMessage="חובה להכניס מחיר לכרטיס">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="seatAmountMust" ValidationGroup="MovieAdd" ControlToValidate="txtNumSeats" runat="server" ErrorMessage="חובה להכניס מספר כיסאות">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="MovieAdd" ID="validatecategoty" ControlToValidate="ddlCategory" InitialValue="-בחר קטגוריה-" ErrorMessage="חובה למלא קטגוריה">&nbsp</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="validateCities" runat="server" ValidationGroup="MovieAdd" ClientValidationFunction="ValidateHobbies" ErrorMessage="חובה לבחור קולנוע">&nbsp</asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="trailerMust" ValidationGroup="MovieAdd" ControlToValidate="txtTrailer" runat="server" ErrorMessage="חובה להוסיף טריילר">&nbsp</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="validatePic" ControlToValidate="fuPic" runat="server" ValidationGroup="MovieAdd" ClientValidationFunction="CheckPhoto" ErrorMessage="חובה להכניס קובץ מסוג תמונה">&nbsp</asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="sumReqAdd" runat="server" ControlToValidate="txtSum" ValidationGroup="MovieAdd" ErrorMessage="חובה למלא תקציר"></asp:RequiredFieldValidator>
                    <div id="showMovie">
                        <asp:GridView runat="server" ID="MoviesGrd" AutoGenerateColumns="False" DataKeyNames="MovieId" CssClass="grdView1 highlight white">
                <Columns>
                    <%--<asp:TemplateField HeaderText="תמונה">
                <ItemTemplate>
                    <asp:Image ID="MoviePic" runat="server" CssClass="imgCss" />
                </ItemTemplate>
            </asp:TemplateField>--%>
                    <asp:BoundField DataField="MovieName" HeaderText="שם סרט" />
                    <asp:BoundField DataField="CategoryName" HeaderText="קטגוריה" />
                    <%--<asp:BoundField DataField="MovieSeatNum" HeaderText="מספר כיסאות" />--%>
                    <asp:BoundField DataField="MovieSeatPrice" HeaderText="מחיר לכיסא" />
                    <asp:BoundField />
                </Columns>
            </asp:GridView>
                    </div>
                    <div id="updateMovie">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:DropDownList ID="ddlMovies" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtMovieNameUpdate"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtMovieNameUpdate") %>'>שם סרט</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtSeatPriceUpdate"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtSeatPriceUpdate") %>'>מחיר לכרטיס</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtSeatNumUpdate"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtSeatNumUpdate") %>'>מספר כיסאות</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <%--<asp:DropDownList ID="ddlTheatersUpdate" runat="server" multiple>
                                </asp:DropDownList>--%>
                                <label>בחר קולנוע</label>
                                <%--<asp:CheckBoxList ID="ddlTheatersUpdate" runat="server"></asp:CheckBoxList>--%>
                                <asp:RadioButtonList ID="ddlTheatersUpdate" runat="server"></asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:DropDownList ID="ddlCategoruUpdate" runat="server"></asp:DropDownList>
                                <%--<label>בחר קטגוריה</label>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <label>בחר תמונה</label>
                                <asp:FileUpload ID="fuPicUpdate" runat="server"></asp:FileUpload>
                            </div>
                        </div>
                        <div class="row">
                            <div class=" input-field col s12 right-align" style="text-align:right !important">
                                <asp:TextBox runat="server" ID="txtTrailerUpdate"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtTrailerUpdate") %>'>טריילר</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox ID="txtSumUpdate" TextMode="MultiLine" CssClass="materialize-textarea" runat="server"></asp:TextBox>
                                <label for='<%#ClientID.Equals("txtSumUpdate") %>'>תקציר</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary20" ValidationGroup="MovieUp" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12" style="text-align:center !important">
                                <asp:Button ID="btnUpMovie" CausesValidation="true" ValidationGroup="MovieUp" OnClick="btnUpMovie_Click" runat="server" CssClass="btn waves-effect waves-light" Text="עדכן סרט"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="movieDdlMust" ControlToValidate="ddlMovies" ValidationGroup="MovieUp" runat="server" InitialValue="-בחר סרט-" ErrorMessage="חובה לבחור סרט"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="nameMust" ValidationGroup="MovieUp" ControlToValidate="txtMovieNameUpdate" runat="server" ErrorMessage="חובה למלא שם סרט">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="MovieUp" ControlToValidate="txtSeatPriceUpdate" runat="server" ErrorMessage="חובה להכניס מחיר לכרטיס">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="MovieUp" ControlToValidate="txtSeatNumUpdate" runat="server" ErrorMessage="חובה להכניס מספר כיסאות">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="MovieUp" ID="RequiredFieldValidator4" ControlToValidate="ddlCategoruUpdate" InitialValue="-בחר קטגוריה-" ErrorMessage="חובה למלא קטגוריה">&nbsp</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ValidationGroup="MovieUp" ClientValidationFunction="ValidateHobbiesUp" ErrorMessage="חובה לבחור קולנוע">&nbsp</asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="MovieUp" ControlToValidate="txtTrailerUpdate" runat="server" ErrorMessage="חובה להוסיף טריילר">&nbsp</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="fuPicUpdate" ValidationGroup="MovieUp" ClientValidationFunction="CheckPhotoUp" ErrorMessage="חובה להכניס קובץ מסוג תמונה">&nbsp</asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="sumReq" runat="server" ValidationGroup="MovieUp" ControlToValidate="txtSumUpdate" ErrorMessage="חובה למלא תקציר"></asp:RequiredFieldValidator>
                    <div>
                        <a class="backMovie"> חזור </a>
                    </div>
                </div>
            </div>
            <%--<div class="card" style="width:60vh;">
                <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <li class="tab"><a class="active" href="#AddMovie">הוסף סרט</a></li>
                    <li class="tab"><a href="#ShowMovie">הצג סרטים</a></li>
                    <li class="tab"><a href="#test6">ערוך סרטים</a></li>
                </ul>
            </div>
                <div class="card-content lighten-4" style="width:60vh;">
                    <div id="AddMovie">--%>
    <%--<%--<table class="tablePopUp" id="addMovie1" style="box-shadow:none !important;">
        <tr>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblMovieName" runat="server" Text="שם הסרט"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblPrice" runat="server" Text="מחיר לכרטיס"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtNumSeats" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblNumSeats" runat="server" Text="מספר כיסאות"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <%--<asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>--%>
                <%--<asp:CheckBoxList ID="ddlCity" runat="server" CssClass="cbxst"></asp:CheckBoxList>
            </td>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="קולנוע"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCategoryddl" runat="server" Text="בחר קטגוריה"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="fuPic" runat="server"></asp:FileUpload>
            </td>
            <td>
                <asp:Label runat="server" ID="lblPic" Text="בחר תמונה"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtTrailer" runat="server" CssClass="txtBox"></asp:TextBox>  
            </td>
            <td>
                <asp:Label ID="lblTrailer" runat="server" Text="טריילר"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAdd" runat="server" Text="הוסף סרט" OnClick="btnAdd_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <a class="backMovie"> חזור </a>
            </td>
        </tr>
    </table>
                        </div>
                    
                </div>
            <div id="ShowMovie">
            <asp:GridView runat="server" ID="MoviesGrd" AutoGenerateColumns="False" DataKeyNames="MovieId" CssClass="grdView1" OnRowDataBound="MoviesGrd_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="תמונה">
                <ItemTemplate>
                    <asp:Image ID="MoviePic" runat="server" CssClass="imgCss" />
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:BoundField DataField="MovieName" HeaderText="שם סרט" />
                    <asp:BoundField DataField="CategoryName" HeaderText="קטגוריה" />--%>
                    <%--<asp:BoundField DataField="MovieSeatNum" HeaderText="מספר כיסאות" />--%>
                    <%--<asp:BoundField DataField="MovieSeatPrice" HeaderText="מחיר לכיסא" />
                    <asp:BoundField />
                </Columns>
            </asp:GridView>
                </div>
            </div>--%>
                        
        </div>
        <div id="addTheater" style="display:none;width:100%">
            <div class="card" style="width:50vh; margin-left:37%">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#showTheater">הצג קולנוע</a></li>
                        <li class="tab"><a class="active" href="#addTheaterDiv">הוסף קולנוע</a></li>
                    </ul>
                </div>
                <div class="card-content white lighten-4">
                    <div id="addTheaterDiv">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:DropDownList ID="ddlAllCities" runat="server" CssClass="selDrp"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary2" CssClass="notes" DisplayMode="List" runat="server" ValidationGroup="citiesAdd"></asp:ValidationSummary>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12" style="text-align:center !important">
                                <asp:Button ID="btnAddTheater" runat="server" ValidationGroup="citiesAdd" Text="הוסף קולנוע" CssClass="btn waves-effect waves-light" OnClick="btnAddTheater_Click"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator runat="server" ID="validateCitiesTheater" ValidationGroup="citiesAdd" ControlToValidate="ddlAllCities" InitialValue="-בחר עיר-" ErrorMessage="חובה למלא עיר">&nbsp</asp:RequiredFieldValidator>
                    <div id="showTheater">
                        <asp:GridView runat="server" ID="theaterGrd" OnRowDeleting="theaterGrd_RowDeleting" AutoGenerateColumns="False" OnRowCommand="theaterGrd_RowCommand1" DataKeyNames="" CssClass="grdView1 highlight white">
                <Columns>
                    <asp:BoundField DataField="TheaterId" HeaderText="מספר סידורי" />
                    <asp:BoundField DataField="CityName" HeaderText="עיר" />
                    <asp:ButtonField ButtonType="Button" HeaderText="מחק" Text="מחק" CommandName="delete" />
                </Columns>
            </asp:GridView>
                    </div>
                    <div>
                        <a class="backTheater"> חזור </a>
                    </div>
                    </div>
                </div>>
            <%--<div class="card" style="width:50vh">
        <table class="tablePopUp" id="addTheater1">
            <tr>
                <td>
                    <asp:DropDownList ID="ddlAllCities" runat="server" CssClass="selDrp"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="lblAllCities" runat="server" Text="בחר עיר לקולנוע"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddTheater" runat="server" Text="הוסף קולנוע" OnClick="btnAddTheater_Click"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="errorThea"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="backTheater"> חזור </a>
                </td>
            </tr>
        </table>
                </div>
            <div class="card" style="width:50vh">
            <asp:GridView runat="server" ID="theaterGrd" AutoGenerateColumns="False" DataKeyNames="" CssClass="grdView" OnRowCommand="theaterGrd_RowCommand" OnRowDataBound="theaterGrd_RowDataBound">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="מחק" Text="מחק" />
                    <asp:ButtonField ButtonType="Button" CommandName="update" HeaderText="ערוך" Text="ערוך" />
                    <asp:BoundField DataField="CityName" HeaderText="עיר" />
                    <asp:BoundField DataField="TheaterId" HeaderText="מספר סידורי" />
                </Columns>
            </asp:GridView>
                </div>--%>
            </div>
        <div id="addCategory" style="display:none; width:100%">
            <div class="card" style="width:50vh; margin-left:37%">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#updateCategory">עדכן קטגוריה</a></li>
                        <li class="tab"><a href="#showCategories">הצג קטגוריות</a></li>
                        <li class="tab"><a class="active" href="#addCategoryDiv">הוסף קטגוריה</a></li>
                    </ul>
                </div>
                <div class="card-content white lighten-4">
                    <div id="addCategoryDiv">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox runat="server" ID="txtCategoryName"></asp:TextBox>
                                <label for='<%=ClientID.Equals("txtCategoryName") %>'>שם קטגוריה</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary3" runat="server" CssClass="notes" DisplayMode="List" ValidationGroup="catAdd"></asp:ValidationSummary>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12" style="text-align:center !important">
                                <asp:Button ID="btnAddCategory" OnClick="btnAddCategory_Click" runat="server" CssClass="btn waves-effect waves-light" ValidationGroup="catAdd" Text="הוסף קטגוריה"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="valCatIn" ControlToValidate="txtCategoryName" ValidationGroup="catAdd" runat="server" ErrorMessage="חובה למלא שם קטגוריה">&nbsp</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtCategoryName" runat="server" ValidationGroup="catUp" ValidationExpression="[א-ת]{3,}" ErrorMessage="קטגוריה היא 3 או יותר אויתיות ובעברית">&nbsp</asp:RegularExpressionValidator>
                    <div id="showCategories">
                        <asp:GridView runat="server" ID="categoryGrd" OnRowDeleting="categoryGrd_RowDeleting" AutoGenerateColumns="False" OnRowCommand="categoryGrd_RowCommand1" CssClass="grdView1 highlight white">
                <Columns>
                    <asp:BoundField DataField="CategoryId" HeaderText="מספר סידורי" />
                    <asp:BoundField DataField="CategoryName" HeaderText="שם קטגוריה" />
                    <asp:ButtonField Text="מחק" ButtonType="Button" HeaderText="מחק" CommandName="delete" />
                </Columns>
            </asp:GridView>
                    </div>
                    <div id="updateCategory">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:DropDownList runat="server" ID="ddlUpdateCategory"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox runat="server" ID="txtCategoryNameUpdate"></asp:TextBox>
                                <label for='<%=ClientID.Equals("txtCategoryNameUpdate") %>'>שם קטגוריה</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
<asp:ValidationSummary ID="ValidationSummary4" ValidationGroup="catUp" CssClass="notes" DisplayMode="List" runat="server"></asp:ValidationSummary>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12" style="text-align:center !important">
                                <asp:Button runat="server" ID="btnUpdateCategory" ValidationGroup="catUp" Text="עדכן קטגוריה" OnClick="btnUpdateCategory_Click" CssClass="btn waves-effect waves-light" />
                                <asp:Label runat="server" ID="CheckSome"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="catUpDrp" runat="server" InitialValue="-בחר קטגוריה-" ValidationGroup="catUp" ControlToValidate="ddlUpdateCategory" ErrorMessage="חובה לבחור קטגוריה לעדכן">&nbsp</asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="catUpVal" ControlToValidate="txtCategoryNameUpdate" ValidationGroup="catUp" runat="server" ErrorMessage="חובה למלא שם קטגוריה">&nbsp</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="catUpTrue" ControlToValidate="txtCategoryNameUpdate" runat="server" ValidationGroup="catUp" ValidationExpression="[א-ת]{3,}" ErrorMessage="קטגוריה היא 3 או יותר אויתיות ובעברית">&nbsp</asp:RegularExpressionValidator>
                    <div>
                        <a class="backCategory"> חזור </a>
                    </div>
                </div>
            </div>
        <%--<table class="tablePopUp" id="addCategory1" >
            <tr>
                <td>
                    <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblCategory" runat="server" Text="שם הקטגוריה"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddCategory" OnClick="btnAddCategory_Click" runat="server" Text="הוסף קטגוריה"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="ErrorCat"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="backCategory"> חזור </a>
                </td>
            </tr>
        </table>--%>
            </div>
        </center>
</asp:Content>
