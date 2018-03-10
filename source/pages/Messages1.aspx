<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages1.aspx.cs" Inherits="pages_Messages1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            $('.modal').modal();
            $('<%=SelectAll.ClientID%>').chenge(function () {
                if ($('<%=SelectAll.ClientID%>').attr(""))
            });
        });
    </script>
    <style type="text/css">
        input{
            text-align:right;
            direction:rtl;
        }
        textarea{
            text-align:right;
            direction:rtl;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <div class="card" style="width:50vw">
        <div class="card-content">
            <div class="row">
                <h4> הודעות </h4>
            </div>
            <div class="row">
                <div class="col s12">
                    <a class="waves-effect waves-light btn modal-trigger" href="#reciversModal"> בחר נמענים </a>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtSubject" runat="server"></asp:TextBox>
                    <label for='<%# ClientID.Equals("txtSubject") %>'>נושא</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" data-length="240" CssClass="materialize-textarea"></asp:TextBox>
                    <label for='<%# ClientID.Equals("txtContent") %>'>תוכן</label>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button ID="btnSend" runat="server" Text="שלח" CssClass="btn waves-effect waves-light"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal" id="reciversModal">
        <div class="row">
                <div class="col s12">
                    <asp:CheckBox runat="server" ID="SelectAll" Text="בחר את כולם" AutoPostBack="true" OnCheckedChanged="SelectAll_CheckedChanged" />
                    <asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>
                </div>
            </div>
    </div>
        </center>
</asp:Content>

