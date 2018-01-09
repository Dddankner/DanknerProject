<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <script src="../Content/js/materialize.js"></script>
    <link href="../Content/css/materialize.css" rel="stylesheet" />

    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('.slider').slider();
            $('.slider').transition(1000);
            $('.slider').interval(5000);
        });

        function ShowCatalog() {
            location.href = "catalog.aspx";
        }
    </script>
    <style type="text/css">
        .slideDiv{
            background-attachment:fixed;
            background-size:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <h1>הקולנוע של דניאל</h1>
        <div class="slider" style="width:800px; height:600px">
            <ul class="slides">
                <li>
                    <img src="../WidePoster/ant-manWidePoster.jpg" style="cursor:pointer" onclick="ShowCatalog()"/>
                    <div class="caption left-align">
                        <h3> אנט מן </h3>
                    </div>
                </li>
                <li>
                    <img src="../WidePoster/black-pantherWidePoster.jpg" style="cursor:pointer" onclick="ShowCatalog()"/>
                    <div class="caption left-align">
                        <h3> הפנתר השחור </h3>
                    </div>
                </li>
                <li>
                    <img src="../WidePoster/justice-leagueWidePoster.jpg" style="cursor:pointer" onclick="ShowCatalog()"/>
                    <div class="caption right-align">
                        <h3> ליגת הצדק </h3>
                    </div>
                </li>
                <li>
                    <img src="../WidePoster/wonder-womanWidePoster.jpg" style="cursor:pointer" onclick="ShowCatalog()"/>
                    <div class="caption left-align">
                        <h3> וונדר וומן </h3>
                    </div>
                </li>
            </ul>
        </div>
        </center>
</asp:Content>

