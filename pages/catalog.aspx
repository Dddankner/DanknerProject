<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalog.aspx.cs" Inherits="pages_catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link href="../Content/css/materialize.css" rel="stylesheet" />
    <script src="../Content/js/materialize.js"></script>
    <script src="../JavaScript/jquery-3.2.1.js"></script>
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

        .marg {
            margin-top: 0vh;
        }
        
    </style>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="MovieId" CssClass="marg" RepeatColumns="4" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="card" style="width:25vh;">
    <div class="card-image waves-effect waves-block waves-light">
      <asp:Image runat="server" ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img activator" />
    </div>
    <div class="card-content" style="direction:rtl">
      <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i><%#Eval("MovieName") %></span><p style="text-align:right"><asp:HyperLink ID="HyperLink1" runat="server">הזמן כרטיסים</asp:HyperLink></p>
    </div>
    <div class="card-reveal" style="direction:rtl">
      <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%#Eval("MovieName") %></span><p>Here is some more information about this product that is only revealed once clicked on.</p>
    </div>
  </div>
            <%--<div class="row">
        <div class="col s12 m7">
          <div class="card">
            <div class="card-image">
              <asp:Image runat="server" ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img" />
              <span class="card-title"><%#Eval("MovieName") %></span>
            </div>
            <div class="card-action" style="text-align:right">
                <asp:HyperLink ID="HyperLink1" runat="server">הזמן כרטיסים</asp:HyperLink>
            </div>
          </div>
        </div>
      </div>--%>
            <%--<table dir="rtl" class="tablePopUp">
                <tr>
                    <td colspan="2">
                        <asp:Image runat="server"   ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img" CausesValidation="False" />
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
                          <asp:Button ID="ButtonInvite" ToolTip='<%#Eval("MovieId") %>' runat="server" Text="הזמן כרטיסים" OnClick="ButtonInvite_Click" ></asp:Button>

                    </td>
                </tr>
            </table>--%>
        </ItemTemplate>
    </asp:DataList>
        <div style="display:none" id="des" runat="server">
          <asp:Label ID="lblName" runat="server"></asp:Label>
        </div>
    <asp:Panel runat="server" ID="theaterPrev"></asp:Panel>
        </center>
</asp:Content>

