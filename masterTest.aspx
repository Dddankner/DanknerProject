<%@ Page Language="C#" AutoEventWireup="true" CodeFile="masterTest.aspx.cs" Inherits="masterTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="JavaScript/jquery-3.2.1.js"></script>
    <title></title>
    <style type="text/css">
        #side-nav {
            color: black;
            position: fixed;
            z-index: 4;
            bottom: 0;
            top: 0;
            padding: 15px;
            width: 240px;
            background: white;
            overflow-x: hidden;
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
            transition: all 300ms;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transform: translateX(-241px);
        }

            #side-nav.visible {
                transform: translateX(0);
            }

        .btn-close {
            height: 45px;
            width: 45px;
            background: none;
            color: black;
            border: none;
            font-size: 32px;
            cursor: pointer;
        }
    </style>
    <script type="text/javascript" lang="ja">
        (function ($) {
            $(document).ready(function () {
                var $menuRevealBtn = $("menu-reveal");
                var $sideNav = $("#side-nav");

                $menuRevealBtn.on('click', function () {
                    $sideNav.addClass('visible');
                });

                $sideNavMask.on('click', function () {
                    $sideNav.removeClass('visible');
                });
            });
        })(jQuery)
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="side-nav">
            <h1>Menu</h1>
        </div>

        <button id="menu-reveal" class="btn-close"> jdn </button>
    </form>
</body>
</html>
