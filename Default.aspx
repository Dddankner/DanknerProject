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

            $(".logShow").on("click", function () {
                $(".ShowLog").fadeout();
                $(".formLog").fadein();
            })
        });

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                closeModal();
            }
        });


    </script>
    <style type="text/css">
        body {
            background-color: #27ae60;
        }

        .logInTable {
            background-color: #27ae60;
            height: 14vh;
            width: 34vh;
            direction: rtl;
        }

        .logInTxt {
            font-family: Arial;
            border: none;
            text-align: right;
            direction: rtl;
            color: black;
            background-color: #27ae60;
            height: 5vh;
            width: 34vh;
            outline: none;
            border-bottom: 2px solid #242222;
            transition: 0.5s;
        }

        .regTxt {
            font-family: Arial;
            border: none;
            text-align: left;
            color: black;
            background-color: #27ae60;
            height: 5vh;
            width: 34vh;
            outline: none;
            border-bottom: 2px solid #242222;
            transition: 0.5s;
        }

        .logInTxt:focus, .regTxt:focus {
            border-bottom-color: white;
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

        input::placeholder {
            color: black;
            transition: 0.5s;
            text-align: right;
            direction: rtl;
        }

        input:focus::placeholder {
            color: white;
        }

        .ShowLog, .formLog {
            background-color: #27ae60;
        }

        input[type="checkbox"] {
            content: "\f096";
            font-family: "FontAwesome";
            font-weight: normal;
            width: 3vh;
            height: 3vh;
        }

            input[type="checkbox"]:checked {
                content: "\f14a";
                color: #00c853;
                animation: pop 180ms ease-in;
            }

        @keyframes pop {
            0% {
                transform: scale(0);
            }

            90% {
                transform: scale(1.4);
            }

            100% {
                transform: scale(1);
            }
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
        <div class="formLog">
            <table class="logInTable">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtFname" placeholder="שם פרטי" CssClass="logInTxt"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="Lname" placeholder="שם משפחה" CssClass="logInTxt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtMail" placeholder="מייל" CssClass="regTxt"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtPass" placeholder="סיסמא" CssClass="regTxt"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtRePass" placeholder="אימות סיסמא" CssClass="regTxt"></asp:TextBox>
                    </td>
                </tr>
                <td>
                    <asp:Label runat="server" ID="lblHobbies" Text="תחביבים"></asp:Label>
                </td>
                <tr>
                    <td>
                        <asp:CheckBoxList runat="server" ID="cbxGenres" Font-Size="Medium">
                            <asp:ListItem Text="קומדיה" Value="קומדיה"></asp:ListItem>
                            <asp:ListItem Text="אקשן" Value="אקשו"></asp:ListItem>
                            <asp:ListItem Text="אימה" Value="אימה"></asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>
            </center>
    </form>
</body>
</html>
