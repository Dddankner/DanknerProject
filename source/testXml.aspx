<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testXml.aspx.cs" Inherits="testXml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" placeholder="שם משתמש"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPass" runat="server" placeholder="סיסמא"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtManager" runat="server" placeholder="מנהל"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="הוסף" OnClick="btnAdd_Click"></asp:Button>
                    </td>
                </tr>
            </table>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </center>
    </form>
</body>
</html>
