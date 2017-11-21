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

        $(".logShow").on("click", function () {
            $("#ShowLog")
        })
    </script>
    <style type="text/css">
        body{
            background-color:#27ae60;
        }
        .logInTable{
            display:none;
            background-color:#27ae60;
            height:14vh;
            width:34vh;
        }
        .logInTxt{
            font-family:Arial;
            border:none;
            text-align:left;
            color:black;
            background-color:#27ae60;
            height:5vh;
            width:34vh;
            outline:none;
            border-bottom:2px solid #242222;
            transition:0.5s;
        }
        .logInTxt:focus{
            border-bottom-color:white;
        }
        a.logShow {
            font-family: 'Lato';
            color: #fff;
            border: 3px solid #fff;
            padding: 15px 10px;
            display: block;
            text-align: center;
            margin: 25px auto;
            width: 13%;
            text-decoration: none;
            cursor: pointer;
            font-size: 20px;
            font-weight: 500;
        }

             a.logShow:hover {
                background: #fff;
                color: #575757;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--        <a class="show" aria-haspopup="true">Show Modal</a>

        <div class="mask" role="dialog"></div>
        <div class="modal" role="alert">
            <a class="close" role="button">X</a>
        </div>
        <asp:TextBox runat="server" ID="txtBox" placeholder="Password"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
        <%--<center>
            <asp:TextBox ID="txtName" runat="server" CssClass="LogIn"></asp:TextBox>
            <br /><br />
            <asp:TextBox ID="txtPass" runat="server" CssClass="LogIn"></asp:TextBox>
        </center>--%>
        <center>
            <div id="ShowLog">
                <a class="logShow">&larr; עבור לטופס הרשמה </a>
            </div>
        <div id="formLog">
            <table class="logInTable">
                <tr>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" placeholder="username" CssClass="logInTxt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" placeholder="password" CssClass="logInTxt"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
            </center>
    </form>
</body>
</html>
