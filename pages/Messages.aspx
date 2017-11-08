<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="pages_Messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Style/Forms.css" rel="stylesheet" />
    <link href="../Style/Modal.css" rel="stylesheet" />
    <script type="text/javascript" lang="ja">
        $(document).ready(function () {
            // Click function for show the Modal

            $(".show").click(function () {
                $(".mask").addClass("active");
            });

            // Call the closeModal function on the clicks/keyboard

            $(".close, .mask").click(function () {
                $(".mask").removeClass("active");
            });
        });

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                closeModal();
            }
        });
    </script>
    <style type="text/css">
        .imgCss {
            height: 30px;
            width: 30px;
        }

            .imgCss:hover {
                cursor: pointer;
            }
            .row{
                background-color:white;
            }
            .row:hover{
                background-color:gainsboro;
                box-shadow: 5px 5px 10px #888888;
            }
            .grdView{
                box-shadow: 5px 5px 10px #888888;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>
            <td><%--<asp:DropDownList ID="ddlMembers" runat="server"></asp:DropDownList>--%>
                <%--<select runat="server" multiple="true" id="ddlMembers" ></select>--%>
                <a class="show" aria-haspopup="true">בחר משתמשים</a>

        <div class="mask" role="dialog" runat="server">
            
        </div>
        <div class="modal" role="alert" runat="server">            
            <a class="close" role="button">X</a> 
            <br /><br /><br />
            <asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>
        </div>
                <%--<asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>--%>
            </td>
            <td> שלח אל </td>
            <td> <asp:Label runat="server" ID="lblError"></asp:Label> </td>
        </tr>
        <tr>
            <td> <asp:TextBox ID="MessageSub" runat="server"></asp:TextBox> </td>
            <td> נושא </td>
        </tr>
        <tr>
            <td> <asp:TextBox ID="MessageContent" runat="server" TextMode="MultiLine"> </asp:TextBox> </td>
            <td> תוכן </td>
        </tr>
        <tr>
            <td colspan="2"> <asp:Button ID="btnSend" runat="server" Text="שלח" OnClick="btnSend_Click"></asp:Button> </td>
        </tr>
    </table>
        <br /><br />
        <asp:GridView ID="Inbox" runat="server" DataKeyNames="MessageId" OnRowCommand="Inbox_RowCommand" OnRowDataBound="MessagesGrid_RowDataBound" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="SenderName" HeaderText="שולח" />
            <asp:BoundField DataField="ReciverName" HeaderText="מקבל" />
            <asp:BoundField DataField="MessageSentTime" HeaderText="תאריך" />
            <asp:BoundField DataField="MassageStatus" HeaderText="סטטוס" />
            <asp:ButtonField ButtonType="Button" CommandName="GetID" HeaderText="קרא הודעה" Text="קרא הודעה" />
        </Columns>
    </asp:GridView>
        <br />
        <div id="messageContentDiv" runat="server">

        </div>
        <br /><br />
        <asp:GridView ID="Outbox" runat="server"></asp:GridView>
        </center>
    
</asp:Content>

