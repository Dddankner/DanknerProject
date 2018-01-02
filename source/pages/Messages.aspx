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
                var cbx = document.getElementById("ddlMembers")
                //for (var i = 0; i < ; i++) {
                    
                //}
            });
        });

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                closeModal();
                <%InsertLblRecText(); %>
            }
        });

        function ValidateRecivers(source, args) {
            var chkListModules = document.getElementById('<%= ddlMembers.ClientID %>');
            var chkListinputs = chkListModules.getElementsByTagName("input");
            for (var i = 0; i < chkListinputs.length; i++) {
                if (chkListinputs[i].checked) {
                    args.IsValid = true;
                    return;
                }
            }

            args.IsValid = false;
        }
    </script>
    <style type="text/css">
        .imgCss {
            height: 30px;
            width: 30px;
        }

            .imgCss:hover {
                cursor: pointer;
            }

        .row {
            background-color: white;
        }

            .row:hover {
                background-color: gainsboro;
                box-shadow: 5px 5px 10px #888888;
            }

        .grdView {
            box-shadow: 5px 5px 10px #888888;
        }

        .notes {
            background-color: none;
            color: red;
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <table class="tablePopUp">
        <tr>
            <td><%--<asp:DropDownList ID="ddlMembers" runat="server"></asp:DropDownList>--%>
                <%--<select runat="server" multiple="true" id="ddlMembers" ></select>--%>
                
                <%if (m1.memberManager)
                    { %>
                <a class="show" aria-haspopup="true">בחר משתמשים</a>

        <div class="mask" role="dialog" runat="server">
            
        </div>
        <div class="modal" role="alert" runat="server">            
            <a class="close" role="button">X</a> 
            <br /><br /><br />
                <asp:CheckBox runat="server" ID="SelectAll" Text="בחר את כולם" AutoPostBack="true" OnCheckedChanged="SelectAll_CheckedChanged" />
            <asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>
            <button id=""></button>
            </div><%} %>
                <asp:Label runat="server" ID="lblManager"></asp:Label>
        
                <%--<asp:CheckBoxList ID="ddlMembers" runat="server" ></asp:CheckBoxList>--%>
            </td>
            <td> שלח אל </td>
            <td rowspan="3"> <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="notes" DisplayMode="List"></asp:ValidationSummary> </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" ID="ReciverNames"></asp:Label>
            </td>
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
        <%if (m1.memberManager)
            { %>
        <asp:CustomValidator runat="server" id="checkReciverCbx" ErrorMessage="חובה לבחור נמענים" ClientValidationFunction="ValidateRecivers">&nbsp</asp:CustomValidator>
        <%--<asp:CustomValidator ID="checkReciverCbxv" runat="server" ClientValidationFunction="ValidateReciversn" ControlToValidate="ddlMembers" ErrorMessage="חובה לבחור נמענים">&nbsp</asp:CustomValidator>--%>
        <%} %>
        <asp:RequiredFieldValidator ID="SubjectValid" runat="server" ControlToValidate="MessageSub" ErrorMessage="חובה למלא נושא">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="SubjectValidateLet" runat="server" ControlToValidate="MessageSub" ValidationExpression="[א-ת]{2,250}" ErrorMessage="הנושא חייב להיות בעברית ובאורך של עד 250 תווים">&nbsp</asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="ContentValidate" runat="server" ControlToValidate="MessageContent" ErrorMessage="חובה למלא תוכן">&nbsp</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="ContentValidateLet" runat="server" ControlToValidate="MessageContent" ValidationExpression="[א-ת]{2,250}" ErrorMessage="התוכן חייב להיות בעברית ובאורך של עד 250 תווים">&nbsp</asp:RegularExpressionValidator>
        <br /><br />
        <div runat="server" style="height:auto; width:auto">
        <asp:Label ID="Label1" runat="server" Text="דואל נכנס"></asp:Label>
        <asp:GridView ID="Inbox" runat="server" OnRowDeleting="Inbox_RowDeleting" DataKeyNames="MessageId" OnRowCommand="Inbox_RowCommand" OnRowDataBound="MessagesGrid_RowDataBound" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="MassageStatus" HeaderText="סטטוס" />
            <asp:BoundField DataField="SenderName" HeaderText="שולח" />
            <asp:BoundField DataField="ReciverName" HeaderText="מקבל" />
            <asp:BoundField DataField="MessageSubject" HeaderText="נושא" />
            <asp:BoundField DataField="MessageSentTime" HeaderText="תאריך" />
            <asp:ButtonField ButtonType="Button" CommandName="Read" HeaderText="קרא הודעה" Text="קרא הודעה" />
            <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="מחק" Text="מחק" />
        </Columns>
    </asp:GridView>
        
        <br />
        <%--<div id="messageContentDiv" style="color:white; background-color:black" runat="server">
            </div>--%>
        </div>
        <br /><br />
        <div runat="server" style="height:auto; width:auto">
        <asp:Label ID="lblOutbox" runat="server" Text="דואל יוצא"></asp:Label>
        <asp:GridView ID="Outbox" OnRowDeleting="Outbox_RowDeleting" runat="server" DataKeyNames="MessageId" OnRowDataBound="Outbox_RowDataBound" OnRowCommand="Outbox_RowCommand" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MassageStatus" HeaderText="סטטוס" />
                <asp:BoundField DataField="SenderName" HeaderText="שולח" />
                <asp:BoundField DataField="ReciverName" HeaderText="מקבל" />
                <asp:BoundField DataField="MessageSubject" HeaderText="נושא" />
                <asp:BoundField DataField="MessageSentTime" HeaderText="תאריך" />
                <asp:ButtonField ButtonType="Button" CommandName="Read" HeaderText="קרא הודעה" Text="קרא הודעה" />
                <asp:ButtonField ButtonType="Button" CommandName="delete" HeaderText="מחק" Text="מחק" />
            </Columns>
        </asp:GridView>
        <br />
       <%-- <div id="OutboxDiv" runat="server" style="color:white; background-color:black; width:50px; height:auto">
            <div style="border-bottom:1px solid black; direction:rtl"><a runat="server" id="SenderName" style="border-right:1px solid #000000; direction:rtl"></a><a>שולח  </a></div>
            <br /><p runat="server" id="MesContent" style="direction:rtl"></p>
        </div>--%>
            </div>
        <table border="1" class="tablePopUp" style="display:none; direction:rtl" id="tblMessage" runat="server">
            <tr>
                <td> <asp:Label ID="lblMesSender" runat="server"></asp:Label> </td>
                <td> שולח </td>
            </tr>
            <tr> 
                <td> <asp:Label ID="lblMesReciver" runat="server"></asp:Label> </td> 
                <td> מקבל </td>
            </tr>
            <tr>
                <td> <asp:Label ID="lblMesSubject" runat="server" ></asp:Label> </td>
                <td> נושא </td>
            </tr>
            <tr>
                <td> <asp:Label ID="lblMesContent" runat="server"></asp:Label> </td>
                <td> תוכן </td>
            </tr>
        </table>
        </center>

</asp:Content>

