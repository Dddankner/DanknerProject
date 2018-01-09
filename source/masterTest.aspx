<%@ Page Language="C#" AutoEventWireup="true" CodeFile="masterTest.aspx.cs" Inherits="masterTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="JavaScript/jquery-3.2.1.js"></script>
    <script src="Content/js/materialize.js"></script>
    <link href="Content/css/materialize.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        input {
            text-align: right;
            direction: rtl;
        }

        .myselect {
        }
        
    </style>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $(".button-collapse").sideNav();
            $('select').material_select();
        });
        function con()
        {
            $('ul.tabs').tabs('select_tab', 'test5');
        }
    </script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <%--<ul id="slide-out" class="side-nav right-align right-aligned">
            <li>
                <div class="user-view">
                    <div class="background">
                        <img src="images/office.jpg" />
                    </div>
                    <a href="#!user">
                        <img class="circle" src="MembersImg/yuna.jpg" /></a>
                    <a href="#!name"><span class="white-text name">John Doe</span></a>
                    <a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>
                </div>
            </li>
            <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
            <li><a href="#!">Second Link</a></li>
            <li>
                <div class="divider"></div>
            </li>
            <li><a class="subheader">Subheader</a></li>
            <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
        </ul>
        <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>--%>
        <center>
        <div class="card" style="width:50vh">
            <div class="card-content">
                <p>I am a very simple card. I am good at containing small bits of information. I am convenient because I require little markup to use effectively.</p>
            </div>
            <div class="card-tabs">
                <ul class="tabs tabs-fixed-width">
                    <li class="tab"><a href="#test4">Test 1</a></li>
                    <li class="tab"><a class="active" href="#test5">Test 2</a></li>
                    <li class="tab"><a href="#test6">Test 3</a></li>
                </ul>
            </div>
            <div class="card-content grey lighten-4">
                <div id="test4">
                    <div class="row right-align">
                        <div class="input-field col s10 right-align">
                            <asp:TextBox runat="server" ID="txtFname" CssClass="right-align right"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtFname") %>">שם פרטי</label>          
        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s10 right-align">
                            <asp:TextBox runat="server" ID="txtLname"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtLname") %>">שם משפחה</label>          
        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s10 right-align">
                            <asp:TextBox runat="server" ID="txtMail"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtMail") %>">מייל</label>          
        </div>
                        </div>
                        <div class="row">
                        <div class="input-field col s10 right-align">
                            <asp:TextBox runat="server" ID="txtRePass"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtRePass") %>">אימות סיסמא</label>          
        </div>
                            </div>
                            <div class="row">
                        <div class="input-field col s10 right-align">
                            <asp:TextBox runat="server" ID="txtPass"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtPass") %>">סיסמא</label>          
        </div>
                </div>
                    <div class="row">
                        <div class="col s12">
                            <a class="btn" onclick="con()"> המשך </a>
                        </div>
                    </div>
            </div>
                    <div id="test5">
                <div class="row">
                    <div class="input-field col s10 right-align">
                        <asp:DropDownList runat="server" ID="cities" CssClass="myselect">
                    </asp:DropDownList>
                    </div>
                </div>
                </div>
                <div id="test6">Test 3</div>
        </div>
            </center>
    </form>
</body>
</html>
