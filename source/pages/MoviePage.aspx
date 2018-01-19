<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MoviePage.aspx.cs" Inherits="pages_MoviePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script type="text/javascript" lang="ja">

</script>
    <style type="text/css">
        .imgCss{
            height:60vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="position: fixed; right: 0; top: 0;">
            <a href="catalog.aspx"><i class="material-icons" style="font-size: 40px; color: #039be5">arrow_forward</i></a>
        </div>
        <center>
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
