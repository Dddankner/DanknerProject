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
    </style>
    <script type="text/javascript" lang="ja">

</script>
</head>
<body>
    <form id="form1" runat="server">
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
                    <div class="row">
                        <div class="input-field col s10">
                            <asp:TextBox runat="server" ID="txtFname"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtFname") %>">שם פרטי</label>          
        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s10">
                            <asp:TextBox runat="server" ID="txtLname"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtLname") %>">שם משפחה</label>          
        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s10">
                            <asp:TextBox runat="server" ID="txtMail"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtMail") %>">מייל</label>          
        </div>
                        </div>
                        <div class="row">
                        <div class="input-field col s10">
                            <asp:TextBox runat="server" ID="txtRePass"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtRePass") %>">אימות סיסמא</label>          
        </div>
                            </div>
                            <div class="row">
                        <div class="input-field col s10">
                            <asp:TextBox runat="server" ID="txtPass"></asp:TextBox>
                            <label for="<%#ClientID.Equals("txtPass") %>">סיסמא</label>          
        </div>
                </div>                
            </div>
                    <div id="test5">
                <div class="row">
                    <div class="input-field col s10">
                        <asp:DropDownList runat="server" ID="cities">
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
