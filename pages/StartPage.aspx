<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StartPage.aspx.cs" Inherits="pages_StartPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/JavaScript/jquery-3.2.1.js"></script>
    <style type="text/css">
        body {
            width: 100%;
        }


        h1 {
            font-family: 'Raleway';
            font-weight: bold;
            text-align: center;
            font-size: 50px;
            color: #fff;
            margin-top: 120px;
        }

        /* PAGES
-------------------------------------------------*/
        #main-page {
            height: 25px;
            width: 375px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: #27ae60;
            display: none;
        }

        #next-page {
            height: 25px;
            width: 375px;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin: auto;
            background-color: #27ae60;
            display: none;
        }

        .maincontent, .nextcontent, .logInForm, .regForm {
            padding-top: 40px;
            display: none;
        }

        .logInForm {
            height: 100vh;
            width: 100%;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin-top: 2vh;
            background-color: #e74c3c;
        }

        .regForm{
            height: 100vh;
            width: 100%;
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            margin-top: 2vh;
            background-color: #27ae60;
        }

        a.back {
            font-family: 'Lato';
            font-size: 20px;
            color: #dfdfdf;
            text-decoration: none;
            text-align: center;
            width: 20%;
            margin: 25px auto 30px auto;
            display: block;
        }

        a.mainlink, a.nextlink, a.logShow, a.backLog, a.continue, a.regBtn, a.backReg {
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

        .sendBn{
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
            background-color: #e74c3c;
        }

        .regBn{
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
            background-color: #27ae60;
        }


            a.mainlink:hover, a.nextlink:hover, a.logShow:hover, a.backLog:hover, 
            .sendBn:hover, a.regBtn:hover, a.continue:hover, a.backReg:hover, .regBn:hover {
                background: #fff;
                color: #575757;
            }

        .logInTable {
            background-color: #e74c3c;
            height: 14vh;
            width: 34vh;
            text-align: center;
        }

        .logInTxt {
            font-family: Arial;
            border: none;
            text-align: left;
            color: black;
            background-color: #e74c3c;
            height: 5vh;
            width: 34vh;
            outline: none;
            border-bottom: 2px solid #242222;
            transition: 0.5s;
        }

            .logInTxt:focus {
                border-bottom-color: white;
            }
            input::placeholder{
                color:black;
                transition:0.5s;
            }
            input:focus::placeholder{
                color:white;
            }
    </style>
    <script type="text/javascript" lang="ja">
        /* JQUERY CODES
-------------------------------------------------*/

        $(document).ready(function () {
            $.fn.animateRotate = function (angle, duration, easing, complete) {
                var args = $.speed(duration, easing, complete);
                var step = args.step;
                return this.each(function (i, e) {
                    args.complete = $.proxy(args.complete, e);
                    args.step = function (now) {
                        $.style(e, "transform", "rotate(" + now + "deg)");
                        if (step) return step.apply(e, arguments);
                    };

                    $({ deg: 0 }).animate({ deg: angle }, args);
                });
            };

            $("#main-page").css("background-color", "#e74c3c");
            $("#main-page").css("height", "100vh");
            $("#main-page").css("width", "100%");
            $("#main-page").fadeIn();
            $(".maincontent").fadeIn();

            $(".mainlink").on("click", function () {
                $(".maincontent").fadeOut();
                $("#main-page").animate(
                    {
                        width: "25px",
                        height: "375px"
                    },
                    function () {
                        $(this).animateRotate(90);
                    }
                );

                setTimeout(function () {
                    $("#main-page").fadeOut();
                }, 1500);

                setTimeout(function () {
                    $("#next-page").animateRotate(0, 0);
                    $("#next-page").css("height", "25px");
                    $("#next-page").css("width", "375px");
                    $("#next-page").fadeIn();
                    $("#next-page").animate(
                        {
                            backgroundColor: "#27ae60"
                        },
                        function () {
                            $(this).animate(
                                {
                                    height: "100vh"
                                },
                                function () {
                                    $(this).animate(
                                        {
                                            width: "100%"
                                        },
                                        function () {
                                            $(".nextcontent").fadeIn(300);
                                        }
                                    );
                                }
                            );
                        }
                    );
                }, 800);
            });

            $(".nextlink").on("click", function () {
                $(".nextcontent").fadeOut();
                $("#next-page").animate(
                    {
                        width: "25px",
                        height: "375px"
                    },
                    function () {
                        $(this).animateRotate(-90);
                    }
                );

                setTimeout(function () {
                    $("#next-page").fadeOut();
                }, 1500);

                setTimeout(function () {
                    $("#main-page").animateRotate(0, 0);
                    $("#main-page").css("height", "25px");
                    $("#main-page").css("width", "375px");
                    $("#main-page").fadeIn();
                    $("#main-page").animate(
                        {
                            height: "100vh"
                        },
                        function () {
                            $(this).animate(
                                {
                                    width: "100%"
                                },
                                function () {
                                    $(".maincontent").fadeIn(300);
                                }
                            );
                        }
                    );
                }, 1400);
            });
            $(".logShow").on("click", function () {
                $(".maincontent").fadeOut(500);
                $(".logInForm").fadeIn(1500);
            });
            $(".backLog").on("click", function () {
                $(".logInForm").fadeOut(500);
                $(".maincontent").fadeIn(1500);
            });
            $(".regBtn").on("click", function () {
                $(".nextcontent").fadeOut(500);
                $(".regForm").fadeIn(1500);
            });
            $(".backReg").on("click", function () {
                $(".regForm").fadeOut(500);
                $(".nextcontent").fadeIn(1500);
            });
        });
        function loginClick() {
            $("#main-page").fadeOut();
            <%logIn_Click(); %>;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="main-page">
            <div class="maincontent">
                <h1>ברוכים הבאים לקולנוע של דניאל </h1>
                <a class="logShow">&larr; להתחברות </a>
                <h1>&darr; לא רשומים? הירשמו </h1>
                <a class="mainlink">&larr; המשך להרשמה </a>
            </div>
            <div class="logInForm">
                <center>
                <h1> התחבר </h1>
                <table class="logInTable">
                <tr>
                    <td>
                        <asp:TextBox ID="txtMail" runat="server" placeholder="Mail" CssClass="logInTxt"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="lblError"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" placeholder="Password" CssClass="logInTxt"></asp:TextBox>
                    </td>
                </tr>
                            
            </table>
                    <asp:Button runat="server" ID="logIn" Text="התחבר" CssClass="sendBn" OnClick="logIn_Click1" />
                    <a class="backLog"> חזור &rarr;</a>
                    </center>
            </div>
            
        </div>

        <div id="next-page">
            <div class="nextcontent">
                <a class="regBtn">&larr; להרשמה </a>
                <%--<%if (Session["Member"] == null)
                    { %>
                <h1>&darr; כבר יש לך חשבון? לחץ כדי להתחבר </h1>
                <a class="logShow">&larr; להתחברות </a>
                <a class="nextlink">חזור &rarr;</a><%} %>--%>
                <a class="nextlink">חזור &rarr;</a>
                <a href="Main.aspx" class="continue">&larr; הכנס כאורח </a>
            </div>
            <div class="regForm">
                <h1> הרשמה </h1>
                <asp:Button runat="server" ID="btnReg" CssClass="regBn" Text="הירשם" OnClick="btnReg_Click" />
                <a class="backReg"> חזור &rarr;</a>
            </div>
        </div>
    </form>
</body>
</html>
