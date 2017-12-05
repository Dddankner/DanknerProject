<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MovieAdd.aspx.cs" Inherits="pages_MovieAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <script src="../JavaScript/jquery-3.2.1.js"></script>
    <style type="text/css">
        .showAddMov, .showAddTheater, a.backMovie, a.backTheater, a.backCategory, a.addCategory {
            font-family: 'Lato';
            color: black;
            border: 3px solid black;
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

            .showAddMov:hover, .showAddTheater:hover, a.backCategory:hover, a.addCategory:hover, a.backTheater:hover, a.backMovie:hover {
                background: black;
                color: white;
            }

        .row {
            background-color: white;
            text-align: right;
        }

            .row:hover {
                background-color: gainsboro;
                box-shadow: 5px 5px 10px #888888;
            }

        .grdView {
            box-shadow: 5px 5px 10px #888888;
        }

        .grdView1 {
            box-shadow: 5px 5px 10px #888888;
            direction: rtl;
        }
        .imgCss {
            height: 30px;
            width: 30px;
        }
    </style>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $(".showAddMov").on("click", function () {
                $("#btns").fadeOut(500);
                $("#addMovie").fadeIn(1500);
            });
            $(".backMovie").on("click", function () {
                $("#addMovie").fadeOut(500);
                $("#btns").fadeIn(1500);
            });
            $(".showAddTheater").on("click", function () {
                $("#btns").fadeOut(500);
                $("#addTheater").fadeIn(1500);
            });
            $(".backTheater").on("click", function () {
                $("#addTheater").fadeOut(500);
                $("#btns").fadeIn(1500);
            });
            $(".addCategory").on("click", function () {
                $("#btns").fadeOut(500);
                $("#addCategory").fadeIn(1500);
            });
            $(".backCategory").on("click", function () {
                $("#addCategory").fadeOut(500);
                $("#btns").fadeIn(1500);
            })
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="btns">
        <a class="showAddMov"> הוסף סרט </a>
        <a class="showAddTheater"> הוסף קולנוע </a>
        <a class="addCategory"> הוסף קטגוריה </a>
            <asp:GridView runat="server" ID="categoryGrd" AutoGenerateColumns="False" CssClass="grdView" OnRowEditing="categoryGrd_RowEditing" OnRowCommand="categoryGrd_RowCommand" OnRowDataBound="categoryGrd_RowDataBound">
                <Columns>
                    <asp:CommandField ButtonType="Button" DeleteText="מחק" HeaderText="מחק" ShowDeleteButton="True" />
                    <asp:CommandField ButtonType="Button" EditText="עדכן" HeaderText="עדכן" ShowEditButton="True" />
                    <asp:BoundField DataField="CategoryName" HeaderText="שם קטגוריה" />
                    <asp:BoundField DataField="CategoryId" HeaderText="מספר סידורי" />
                </Columns>
            </asp:GridView>
            <table runat="server" id="tblCatUpdate" style="display:none; direction:rtl">
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="txtUpdateCat" placeholder="שם קטגוריה" CssClass="txtBox"></asp:TextBox>
                        
                    </td>
                    <td>
                        <asp:Label runat="server" ID="hidID"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button runat="server" ID="upCat" Text="עדכן" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="addMovie" style="display:none"> 
    <table class="tablePopUp" id="addMovie1" style="position:absolute; ">
        <tr>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblMovieName" runat="server" Text="שם הסרט"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblPrice" runat="server" Text="מחיר לכרטיס"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtNumSeats" runat="server" CssClass="txtBox"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblNumSeats" runat="server" Text="מספר כיסאות"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlCity" runat="server"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="קולנוע"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCategoryddl" runat="server" Text="בחר קטגוריה"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:FileUpload ID="fuPic" runat="server"></asp:FileUpload>
            </td>
            <td>
                <asp:Label runat="server" ID="lblPic" Text="בחר תמונה"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtTrailer" runat="server" CssClass="txtBox"></asp:TextBox>  
            </td>
            <td>
                <asp:Label ID="lblTrailer" runat="server" Text="טריילר"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAdd" runat="server" Text="הוסף סרט" OnClick="btnAdd_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <a class="backMovie"> חזור </a>
            </td>
        </tr>
    </table>
            <asp:GridView runat="server" ID="MoviesGrd" AutoGenerateColumns="False" DataKeyNames="MovieId" CssClass="grdView1" OnRowDataBound="MoviesGrd_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="תמונה">
                <ItemTemplate>
                    <asp:Image ID="MoviePic" runat="server" CssClass="imgCss" />
                </ItemTemplate>
            </asp:TemplateField>
                    <asp:BoundField DataField="MovieName" HeaderText="שם סרט" />
                    <asp:BoundField DataField="CategoryName" HeaderText="קטגוריה" />
                    <asp:BoundField DataField="MovieSeatNum" HeaderText="מספר כיסאות" />
                    <asp:BoundField DataField="MovieSeatPrice" HeaderText="מחיר לכיסא" />
                    <asp:BoundField />
                </Columns>
            </asp:GridView>
            </div>
        <div id="addTheater" style="display:none">
        <table class="tablePopUp" id="addTheater1">
            <tr>
                <td>
                    <asp:DropDownList ID="ddlAllCities" runat="server"></asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="lblAllCities" runat="server" Text="בחר עיר לקולנוע"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddTheater" runat="server" Text="הוסף קולנוע" OnClick="btnAddTheater_Click"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="errorThea"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="backTheater"> חזור </a>
                </td>
            </tr>
        </table>
            <asp:GridView runat="server" ID="theaterGrd" AutoGenerateColumns="False" DataKeyNames="" CssClass="grdView" OnRowCommand="theaterGrd_RowCommand" OnRowDataBound="theaterGrd_RowDataBound">
                <Columns>
                    <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="מחק" Text="מחק" />
                    <asp:ButtonField ButtonType="Button" CommandName="update" HeaderText="ערוך" Text="ערוך" />
                    <asp:BoundField DataField="CityName" HeaderText="עיר" />
                    <asp:BoundField DataField="TheaterId" HeaderText="מספר סידורי" />
                </Columns>
            </asp:GridView>
            </div>
        <div id="addCategory" style="display:none">
        <table class="tablePopUp" id="addCategory1" >
            <tr>
                <td>
                    <asp:TextBox ID="txtCategoryName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lblCategory" runat="server" Text="שם הקטגוריה"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAddCategory" OnClick="btnAddCategory_Click" runat="server" Text="הוסף קטגוריה"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label runat="server" ID="ErrorCat"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <a class="backCategory"> חזור </a>
                </td>
            </tr>
        </table>
            </div>
        </center>
</asp:Content>
