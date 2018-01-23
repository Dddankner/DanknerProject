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
            $.getJSON("/Content/autocompleteData/GetMovieInfo.ashx?movieID=<%=Request.QueryString["movieID"].ToString()%>", function (data) {
                $("#lblName").text(data.MovieName);
                $("#imgMovie").attr("src", data.MoviePic);
                $("#lblDescription").text(data.MovieDescription);
                $("#trailer").attr("href", data.MovieTrailer)
            });
        });
</script>
    <style type="text/css">
        .imgCss {
            border-radius: 50%;
            height: 10vh;
            width: 10vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                    <a>תגובות</a>
                </div>
            </div>
        <%--<div class="card" style="width:40vh">
            <div class="card-image">
                <asp:Image ID="imgMovie" runat="server" CssClass="imgCss"></asp:Image>
                <span class="card-title" id="tit" runat="server"></span>
            </div>
            <a><%#m.MovieTrailer %></a>
            <iframe width="420" height="315" src='<%#m.MovieTrailer %>'></iframe>
        </div>--%>
            </center>
    </form>
</body>
</html>
