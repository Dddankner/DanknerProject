<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalog.aspx.cs" Inherits="pages_catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <style type="text/css">
        .img {
            height: 25vh;
            width: 18vh;
        }

        td {
            width: 10vh;
            height: 5vh;
        }

        table {
            margin-left: 5vh;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <center>
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
        <ItemTemplate>
            <table dir="rtl" class="tablePopUp">
                <tr>
                    <td colspan="2">
                        <asp:ImageButton OnClick="movieImg_Click" runat="server" ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img" CausesValidation="False" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="שם הסרט"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblNameDB" runat="server" Text='<%#Eval("MovieName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCategory" runat="server" Text="קטגוריה"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCategoryDB" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">

                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
        <div style="display:none" id="des" runat="server">
          <asp:Label ID="lblName" runat="server"></asp:Label>
        </div>
    <asp:Panel runat="server" ID="theaterPrev"></asp:Panel>
        </center>
</asp:Content>

