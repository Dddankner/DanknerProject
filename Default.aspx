<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Modal.css" rel="stylesheet" />
    <script src="/JavaScript/jquery-3.2.1.js"></script>
    <script type="text/javascript" lang="ja">

        $(document).ready(function () {
            // Click function for show the Modal

            $(".show").click(function () {
                $(".mask").addClass("active");
            });

            // Call the closeModal function on the clicks/keyboard

            $(".close, .mask").click(function () {
                $(".mask").removeClass("active");
            });
        });

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                closeModal();
            }
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <a class="show" aria-haspopup="true">Show Modal</a>

        <div class="mask" role="dialog"></div>
        <div class="modal" role="alert">
            <a class="close" role="button">X</a>
        </div>
    </form>
</body>
</html>
