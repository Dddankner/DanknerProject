<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="catalog.aspx.cs" Inherits="pages_catalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--<link href="../Content/css/materialize.css" rel="stylesheet" />
    <script src="../Content/js/materialize.js"></script>
    <script src="../JavaScript/jquery-3.2.1.js"></script>--%>
    <link href="../Style/Forms.css" rel="stylesheet" />
    <style type="text/css">
        .img {
            height: 25vh;
            width: 18vh;
        }

        table {
            width:70% !important;
        }

        td{
            width:30vh;
        }

        .marg {
            margin-top: 0vh;
        }
        
    </style>
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
        });

    </script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>
        <div style="width:95%">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="MovieId" RepeatColumns="3" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="card sticky-action" style="width:25vh !important;" >
    <div class="card-image waves-effect waves-block waves-light" style="width:100% !important">
      <asp:Image runat="server" ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img activator" />
    </div>
    <div class="card-content" style="direction:rtl; width:100% !important">
      <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i><%#Eval("MovieName") %></span>
        <%if (Session["Member"] != null)
            { %>
        <p style="text-align:right">
            <asp:HyperLink ID="HyperLink1" runat="server" ToolTip='<%#Eval("MovieId") %>'>הזמן כרטיסים</asp:HyperLink></p>
    <%} %>
    </div>
    <div class="card-action" style="direction:rtl;">
        <asp:HyperLink ID="hlMoviePage" runat="server" ToolTip='<%#Eval("MovieId") %>'>עוד פרטים</asp:HyperLink>
    </div>
    <div class="card-reveal" style="direction:rtl;">
      <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%#Eval("MovieName") %></span>
        <p style="text-align:right">
            <label> קטגוריה: <%#Eval("CategoryName") %> </label>
            <br />
            <label> תקציר: <%#Eval("MovieDescreption") %> </label>
            <br />
            <a href='<%#Eval("MovieTrailer") %>' target="_blank"> לטריילר </a>
        </p>
    </div>
  </div>
        </ItemTemplate>
    </asp:DataList>
            </div>
        <%--<div id="pager" class="row" runat="server">
          <asp:Label ID="lblPage" runat="server"></asp:Label>
        </div>--%>
        <div class="row" style="width:70vh">
            <div class="col s3">
                <asp:Button runat="server" ID="next" OnClick="next_Click" Text="דף הבא" />
            </div>
            <div class="col s1">
                <asp:Label runat="server" ID="lblLNum"></asp:Label>
            </div>
            <div class="col s4">
                <asp:Label runat="server" ID="lblShowPage" Text="מתוך"></asp:Label>
            </div>
            <div class="col s1">
                <asp:Label runat="server" ID="lblFNum"></asp:Label>
            </div>
            <div class="col s3">
                <asp:Button runat="server" ID="prev" OnClick="prev_Click" Text="דף הקודם" />
            </div>
        </div>


        <%--<a class="waves-effect waves-light btn modal-trigger" href="#modal1">Modal</a>--%>

        <div id="modal1" class="modal">
    <div class="modal-content">
      <h4>Modal Header</h4>
      <p>A bunch of text</p>
    </div>
    <div class="modal-footer">
      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
    </div>
  </div>
        <%--<table>
            <tr>
                <td>
                    <asp:Button runat="server" ID="next1" OnClick="next_Click" Text="דף הבא" />
                </td>
                <td>
                    <asp:Label runat="server" ID="lblShowPage1"></asp:Label>
                </td>
                <td>
                    <asp:Button runat="server" ID="prev1" OnClick="prev_Click" Text="דף הקודם" />
                </td>
            </tr>
        </table>--%>
    
        </center>
</asp:Content>

