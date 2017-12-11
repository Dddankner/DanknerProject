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

        table {
            margin-left: 10vh;
        }

        .pad td{
            
        }

        .marg {
            margin-top: 0vh;
        }
        
    </style>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <center>
    <asp:DataList ID="DataList1" runat="server" CssClass="pad" DataKeyField="MovieId" RepeatColumns="3" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="card" style="width:25vh !important;" >
    <div class="card-image waves-effect waves-block waves-light" style="width:100% !important">
      <asp:Image runat="server" ID="movieImg" ImageUrl='<%#Eval("MoviePic") %>' CssClass="img activator" />
    </div>
    <div class="card-content" style="direction:rtl; width:100% !important">
      <span class="card-title activator grey-text text-darken-4"><i class="material-icons right">more_vert</i><%#Eval("MovieName") %></span>
        <p style="text-align:right"><asp:HyperLink ID="HyperLink1" runat="server" ToolTip='<%#Eval("MovieId") %>'>הזמן כרטיסים</asp:HyperLink></p>
    </div>
    <div class="card-reveal" style="direction:rtl;">
      <span class="card-title grey-text text-darken-4"><i class="material-icons right">close</i><%#Eval("MovieName") %></span>
        <p style="text-align:right">
            <label> קטגוריה: <%#Eval("CategoryName") %> </label>
            <br />
            <a href='<%#Eval("MovieTrailer") %>' target="_blank"> לטריילר </a>

        </p>
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
        <%--<div id="pager" class="row" runat="server">
          <asp:Label ID="lblPage" runat="server"></asp:Label>
        </div>--%>
        <table>
            <tr>
                <td>
                    <asp:Button runat="server" ID="next" OnClick="next_Click" Text="דף הבא" />
                </td>
                <td>
                    <asp:Label runat="server" ID="lblShowPage"></asp:Label>
                </td>
                <td>
                    <asp:Button runat="server" ID="prev" OnClick="prev_Click" Text="דף הקודם" />
                </td>
            </tr>
        </table>
    
        </center>
</asp:Content>

