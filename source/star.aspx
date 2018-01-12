<%@ Page Language="C#" AutoEventWireup="true" CodeFile="star.aspx.cs" Inherits="star" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="JavaScript/jquery-3.2.1.js"></script>
    <script src="Content/js/materialize.js"></script>
    <link href="Content/css/materialize.css" rel="stylesheet" />
    <style>
        .card {
            padding: 40px;
            margin: 10px 0 !important;
        }
            .card .center-align .material-icons {
                cursor: pointer;
                font-size:2rem;
            }
        .input-field .neg:focus {
            border-bottom: 1px solid #b71c1c !important;
            box-shadow: 0 1px 0 0 #b71c1c !important;
        }
        .input-field .pos:focus {
            border-bottom: 1px solid #1b5e20 !important;
            box-shadow: 0 1px 0 0 #1b5e20 !important;
        }
    </style>
    <script>
        var selected = 1;
        function stars(val) {
            for (var i = 0; i < 5; i++) {
                $("#s" + (i + 1)).text("star_border");
            }
            for (var i = 0; i < val; i++) {
                $("#s" + (i + 1)).text("star");
            }
        }
        function out() {
            for (var i = 0; i < 5; i++) {
                $("#s" + (i + 1)).text("star_border");
            }
            for (var i = 0; i < selected; i++) {
                $("#s" + (i + 1)).text("star");
            }
        }
        function changeselet(val) {
            selected = val;
            $("#<%=txtRate.ClientID %>").val(selected);
        }
        $(document).ready(function () {
            $("#<%=txtRate.ClientID %>").val(selected);
        });
    </script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card row">
        <div class="col s1">
            <asp:Image ID="imgProduct" runat="server" Style="width: 100px; height: 100px" />
        </div>
        <div class="col s1" style="width: calc(100% - 150px); margin: 0 10px">
            <asp:Label ID="lblProductName" runat="server" Text="Name" Style="font-size: 20px"></asp:Label>
            <br />
            <asp:Label ID="lblBrand" runat="server" Text="By Brand" Style="font-size: 13px"></asp:Label>
            <br />
            <asp:Label ID="lblBoughtOn" runat="server" Text="You Bought It On 00/00/0000"
                Style="font-size: 15px"></asp:Label>
        </div>
    </div>
    <div class="card">
        <div class="center-align" style="font-size: 20px">
            Write Review For <%=lblProductName.Text %> by <%=lblBrand.Text %>
        </div>
        <div class="center-align" style="color: #ff9800; vertical-align: middle">
            <label>Select Rate</label>
            <div style="margin: 0 40px;">
                <i id="s1" class="material-icons" onmouseover="stars(1)"
                    onmouseout="out()" onclick="changeselet(1)">star</i>
                <i id="s2" class="material-icons" onmouseover="stars(2)"
                    onmouseout="out()" onclick="changeselet(2)">star_border</i>
                <i id="s3" class="material-icons" onmouseover="stars(3)"
                    onmouseout="out()" onclick="changeselet(3)">star_border</i>
                <i id="s4" class="material-icons" onmouseover="stars(4)"
                    onmouseout="out()" onclick="changeselet(4)">star_border</i>
                <i id="s5" class="material-icons" onmouseover="stars(5)"
                    onmouseout="out()" onclick="changeselet(5)">star_border</i>
            </div>
            <asp:TextBox ID="txtRate" runat="server" Style="display: none"></asp:TextBox>
        </div>
        <div class="input-field">
            <i class="material-icons prefix" style="color: #000; cursor: auto; top: 13px">title</i>
            <asp:TextBox ID="txtTitle" runat="server" MaxLength="30"></asp:TextBox>
            <label for="<%=txtTitle.ClientID %>">Title</label>
            <asp:RequiredFieldValidator ID="r1" runat="server" ErrorMessage="*Please Enter The Review Title"
                ControlToValidate="txtTitle" Display="Dynamic" ForeColor="Red"
                Style="margin: 0 45px;"></asp:RequiredFieldValidator>
        </div>
        <div class="input-field">
            <i class="material-icons prefix" style="color: #000; cursor: auto; top: 13px">create</i>
            <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="materialize-textarea"></asp:TextBox>
            <label for="<%=txtContent.ClientID %>">Content</label>
            <asp:RequiredFieldValidator ID="r2" runat="server" ErrorMessage="*Please Enter Review Content"
                ControlToValidate="txtContent" Display="Dynamic" ForeColor="Red"
                Style="margin: 0 45px;"></asp:RequiredFieldValidator>
        </div>
        <div class="input-field">
            <i class="material-icons prefix" style="color: #1b5e20; cursor: auto; top: 13px">thumb_up</i>
            <asp:TextBox ID="txtPositive" runat="server" TextMode="MultiLine" CssClass="materialize-textarea pos"></asp:TextBox>
            <label for="<%=txtPositive.ClientID %>">Positive</label>
            <asp:RequiredFieldValidator ID="r3" runat="server" ErrorMessage="*Please Enter The Positive"
                ControlToValidate="txtPositive" Display="Dynamic" ForeColor="Red"
                Style="margin: 0 45px;"></asp:RequiredFieldValidator>
        </div>
        <div class="input-field">
            <i class="material-icons prefix" style="color: #b71c1c; cursor: auto; top: 13px">thumb_down</i>
            <asp:TextBox ID="txtNegative" runat="server" TextMode="MultiLine" CssClass="materialize-textarea neg"></asp:TextBox>
            <label for="<%=txtNegative.ClientID %>">Negative</label>
            <asp:RequiredFieldValidator ID="r4" runat="server" ErrorMessage="*Please Enter The Negative"
                ControlToValidate="txtNegative" Display="Dynamic" ForeColor="Red"
                Style="margin: 0 45px;"></asp:RequiredFieldValidator>
        </div>
        <div class="input-field center">
            <asp:Button ID="btnSave" runat="server" Text="Add Review" CssClass="btn-large center" />
        </div>
    </div>
    </form>
</body>
</html>
