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
                //var xhr = new XMLHttpRequest();
                //var q = "?id=" + data.CategoryId;
                //var url = "MoviePage.aspx/GetName" + q;
                //xhr.open("GET", url, true);
                //xhr.onreadystatechange = function (response) {
                //    if (xhr.readyState == 4 && xhr.status == 200) {
                //        if (typeof xhr.responseText.text == "undefined") {
                //            alert(xhr.responseText + ", ddd");
                //            txtCat = xhr.responseText;
                //            //$("#lblCategory").text(xhr.responseXML.getElementsByTagName("string")[0].textContent);
                //        }
                //        else {
                //            alert("undefined");
                //        }
                //    }
                //}
                //xhr.send();
                //var txtCat = "";
                //var xhr = new XMLHttpRequest();
                //var q = "?id=" + data.CategoryId;
                //var url = "MoviePage.aspx/GetName" + q;
                //xhr.open("get", url, true);
                //xhr.onreadystatechange = function (response) {
                //    if (xhr.readyState == 4 && xhr.status == 200) {
                //        if (xhr.responseText != null)
                //        {
                //            alert(xhr.responseText.text)
                //            if (typeof xhr.responseText.text == "undefined") {
                //                alert(xhr.responseText.getElementsByTagName("string")[0].textContent + "fs")
                //                txtCat = xhr.responseText.getElementsByTagName("string")[0].textContent;
                //                //$("#lblCategory").text(xhr.responseXML.getElementsByTagName("string")[0].textContent);
                //            }
                //        }
                //        else {
                //            alert("xhr.responseXML == null")
                //        }
                //    }
                //}
                //xhr.send();
                $("#lblCategory").text(txtCat);
                $("#lblDescription").text(data.MovieDescription);
                $("#trailer").attr("href", data.MovieTrailer);
            });
            var txtCat = "קטגוריה";
            var url = "MoviePage.aspx/GetName";
            $.ajax({
                type: "POST",
                url: url,
                data: "{ id: <%=movieID%> }",
                dataType: "JSON",
                contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        //alert(url);
                        //alert("succes");
                        var data = JSON.parse(msg.d);
                        //txtCat = data;
                        $("#lblCategory").text(data);
                    },
                    error: function (xhr, msg) {
                        <%--alert(url + ", " + <%=movieID%>);
                        alert(msg + ", " + xhr.responseText);--%>
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
        }

        textarea {
            text-align: right;
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
                    <%if (Session["Member"] != null)
                        { %>
                    <div class="row">
                        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">הוסף תגובה</a>
                    </div>
                    <%} %>
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
                                        <label> נושא: <%#Eval("CommentSubject") %> </label>
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
                </div>
            </div>
        <%--<div class="card" style="width:40vh">
            <div class="card-image">

            </div>

        </div>--%>
            <div id="modal1" class="modal">
    <div class="modal-content">
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
    </div>
    <%--<div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>--%>
  </div>
            </center>
    </form>
</body>
</html>
