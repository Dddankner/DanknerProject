<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowUsers.aspx.cs" Inherits="pages_ShowUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <script type="text/javascript" lang="ja">
        function UpdateRed(id) {
            location.href = "../pages/Update.aspx?id=" + id + "";
        }
        function DeleteRed(id)
        {
            if (confirm("האם אתה בטוח שברצונך למחוק את המשתמש?"))
                location.href = "../pages/Delete.aspx?mail=" + id + "";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div style="margin-top:10vh; width:95%">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grdView" OnRowDataBound="GridView1_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="MemberFname" HeaderText="שם פרטי" />
            <asp:BoundField DataField="MemberLname" HeaderText="שם משפחה" />
            <asp:BoundField DataField="MemberMail" HeaderText="מייל" />
            <asp:BoundField DataField="MemberDate" DataFormatString="{0:d}" HeaderText="תאריך" />
            <asp:BoundField DataField="MemberPass" HeaderText="סיסמא" />
            <asp:BoundField DataField="CityName" HeaderText="עיר" />
            <asp:BoundField DataField="MemberGender" HeaderText="מגדר" />
            <asp:BoundField DataField="MemberHobbies" HeaderText="תחביבים" />
            <asp:TemplateField HeaderText="תמונה">
                <ItemTemplate>
                    <asp:Image ID="MemberImage" runat="server" CssClass="imgCss" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="עדכן">
                <ItemTemplate>
                    <%--<i class="material-icons imgCss" id="ImageUpdate" runat="server">mode_edit</i>--%>
                    <asp:Image ID="ImageUpdate" runat="server" CssClass="imgCss" ImageUrl="~/img/UpdatePic.png"></asp:Image>
                    <%--<asp:Image ID="UpdateBtn" runat="server" ImageUrl="~/img/UpdatePic.png" OnClick="UpdateBtn_Click" Height="35px" Width="35px" />--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="מחק">
                <ItemTemplate>
                    <%--<i class="material-icons imgCss" id="DeleteBtn" runat="server">delete</i>--%>
                    <asp:Image ID="DeleteBtn" runat="server" ImageUrl="~/img/deletePic.png" CssClass="imgCss" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MemberStatus" HeaderText="סטטוס" />
        </Columns>
</asp:GridView>
            </div>
        </center>
</asp:Content>

