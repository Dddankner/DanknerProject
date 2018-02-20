<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoviePage.aspx.cs" Inherits="pages_MoviePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('ul.tabs').tabs();
            $('.modal').modal();
            $.getJSON("/Content/autocompleteData/GetMovieInfo.ashx?movieID=<%=movieID%>", function (data) {
                $("#lblName").text(data.MovieName);
                $("#imgMovie").attr("src", data.MoviePic);
                $("#lblCategory").text(txtCat);
                $("#lblDescription").text(data.MovieDescription);
                $("#trailer").attr("href", data.MovieTrailer);
            });
            var txtCat = "קטגוריה";
            var url = "MoviePage.aspx/GetName";
            $.ajax({
                type: "POST",
                url: url,
                data: "{ id:<%=movieID%> }",
                dataType: "JSON",
                contentType: "application/JSON; charset=utf-8",
                    success: function (msg) {
                        //alert(<%=movieID%>);
                        //alert("succes");
                        var data = JSON.parse(msg.d);
                        //txtCat = data;
                        $("#lblCategory").text(data);
                    },
                    error: function (xhr, msg) {
                        alert(url + ", " + <%=movieID%>);
                        alert(msg + ", " + xhr.responseText);
                    }
             });
             //$("#lblCategory").text(txtCat);
        });
        var selected = 1;
        function stars(val) {
            for (var i = 0; i < 5; i++) {
                $("#s" + (i + 1)).text("star_border");
            }
            for (var i = 0; i < val; i++) {
                $("#s" + (i + 1)).text("star");
            }
        }
        function out() {
            for (var i = 0; i < 5; i++) {
                $("#s" + (i + 1)).text("star_border");
            }
            for (var i = 0; i < selected; i++) {
                $("#s" + (i + 1)).text("star");
            }
        }
        function changeselet(val) {
            selected = val;
            $("#<%=txtRate.ClientID %>").val(selected);
        }
        $(document).ready(function () {
            $("#<%=txtRate.ClientID %>").val(selected);
        });
    </script>
    <style type="text/css">
        .imgCss {
            border-radius: 50%;
            height: 10vh;
            width: 10vh;
        }

        input {
            text-align: right;
            direction:rtl;
        }

        textarea {
            text-align: right;
            direction:rtl;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <div style="position: fixed; right: 0; top: 0;">
            <a href="catalog.aspx"><i class="material-icons" style="font-size: 40px; color: #039be5">arrow_forward</i></a>
        </div>
        <center>
            <div class="card" style="width:70vh">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#comments">תגובות</a></li>
                        <li class="tab"><a href="#movieDetails" class="active">פרטי הסרט</a></li>
                    </ul>
                </div>
                <div id="movieDetails">
                <div class="col s12">
                    <%--<asp:Image ID="imgMovie" runat="server" CssClass="imgCss"></asp:Image>--%>
                    <img id="imgMovie" src="#" class="imgCss" />
                </div>
                <div class="col s12">
                    <label id="lblName" style="font-size:20px"></label>
                </div>
                <div class="col s12">
                    <label id="lblCategory"></label>
                </div>
                <div class="col s12">
                    <label id="lblDescription"></label>
                </div>
                    <div class="col s12">
                        <a id="trailer" href="#" target="_blank">טריילר</a>
                    </div>
                    </div>
                <div id="comments">
                    <br />
                    <div class="row">
                        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">הוסף תגובה</a>
                    </div>
                    <h4 id="noComments" runat="server"></h4>
                    <asp:DataList ID="dlComments" runat="server" DataKeyField="CommentID" RepeatColumns="1" OnItemDataBound="dlComments_ItemDataBound">
                        <ItemTemplate>
                            <asp:Panel ID="starDiv" runat="server">
                            <div class="card">
                                <%--<div class="row" style="color: #ff9800; text-align:center">
                                    
                                    <div class="col s12">
                                        <div style="margin: 0 40px; cursor:pointer">
                                            <i id="s1" class="material-icons">star</i>
                                            <i id="s2" class="material-icons">star_border</i>
                                            <i id="s3" class="material-icons">star_border</i>
                                            <i id="s4" class="material-icons">star_border</i>
                                            <i id="s5" class="material-icons">star_border</i>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="row">
                                    <div class="col s12" style="text-align:right">
                                        <label> נושא: <%#Eval("commentsubject") %> </label>
                                    </div>
                                </div>
                                <div class="row" style="text-align:right">
                                    <div class="col s12">
                                        <label> תוכן: <%#Eval("CommentContent") %> </label>
                                    </div>
                                </div>
                            </div>
                                </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                </div>
            </div>
        <%--<div class="card" style="width:40vh">
            <div class="card-image">

            </div>

        </div>--%>
            <div id="modal1" class="modal">
    <div class="modal-content">
        <%if (Session["Member"] != null)
            { %>
      <h4>הוספת תגובה</h4>
        <div class="row" style="color: #ff9800">
            <div style="margin: 0 40px; cursor:pointer">
                <i id="s1" class="material-icons" onmouseover="stars(1)"
                    onmouseout="out()" onclick="changeselet(1)">star</i>
                <i id="s2" class="material-icons" onmouseover="stars(2)"
                    onmouseout="out()" onclick="changeselet(2)">star_border</i>
                <i id="s3" class="material-icons" onmouseover="stars(3)"
                    onmouseout="out()" onclick="changeselet(3)">star_border</i>
                <i id="s4" class="material-icons" onmouseover="stars(4)"
                    onmouseout="out()" onclick="changeselet(4)">star_border</i>
                <i id="s5" class="material-icons" onmouseover="stars(5)"
                    onmouseout="out()" onclick="changeselet(5)">star_border</i>
            </div>
            <asp:TextBox ID="txtRate" runat="server" Style="display:none"></asp:TextBox>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="txtCommentSubject" runat="server"></asp:TextBox>
                <label for='<%#ClientID.Equals("txtCommentSubject") %>'>נושא</label>
            </div>
        </div>
        <div class="row">
            <div class="input-field col s12">
                <asp:TextBox ID="txtCommentContent" runat="server" CssClass="materialize-textarea" TextMode="MultiLine" data-length="240"></asp:TextBox>
                <label for='<%#ClientID.Equals("txtCommentContent") %>'>תוכן</label>
            </div>
        </div>
        <div>
            <asp:Button ID="btnAddComment" runat="server" OnClick="btnAddComment_Click" Text="הוסף תגובה" CssClass="btn modal-close waves-effect waves-light"></asp:Button>
        </div>
        <%}
    else
    { %>
        <h3> בשביל להוסיף תגובה עליך להתחבר </h3>
        <%} %>
    </div>
  </div>
            </center>
    </form>
</body>
</html>
