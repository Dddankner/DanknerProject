<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/Modal.css" rel="stylesheet" />
    <script src="/JavaScript/jquery-3.2.1.js"></script>
    <link href="Content/css/materialize.css" rel="stylesheet" />
    <script src="Content/js/materialize.js"></script>
    <script type="text/javascript" lang="ja">

        $(document).ready(function () {
            $('select').material_select();
        });


    </script>
    <style type="text/css">
        input::placeholder {
            text-align: right !important;
        }

        label[for=input] {
            text-align: right !important;
        }

        input {
            text-align: right !important;
            direction: rtl !important;
        }

        div {
            text-align: right !important;
        }

        .grdView1 {
            direction: rtl !important;
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
            <div class="card" style="width:50vh;">
                <div class="card-tabs">
                    <ul class="tabs tabs-fixed-width">
                        <li class="tab"><a href="#updateCategory">עדכן קטגוריה</a></li>
                        <li class="tab"><a href="#showCategories">הצג קטגוריות</a></li>
                        <li class="tab"><a class="active" href="#addCategory">הוסף קטגוריה</a></li>
                    </ul>
                </div>
                <div class="card-content white lighten-4">
                    <div id="addCategory">
                        <div class="row">
                            <div class="input-field col s12">
                                <asp:TextBox runat="server" ID="txtCategoryName" placeholder="שם קטגוריה"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div id="showCategories">
                        <asp:GridView runat="server" ID="categoryGrd" AutoGenerateColumns="False" CssClass="grdView1 highlight white">
                <Columns>
                    <asp:BoundField DataField="CategoryId" HeaderText="מספר סידורי" />
                    <asp:BoundField DataField="CategoryName" HeaderText="שם קטגוריה" />
                </Columns>
            </asp:GridView>
                    </div>
                    <div id="updateCategory">
                        עדכן סרטים
                    </div>
                </div>
            </div>
            </center>
    </form>
</body>
</html>
