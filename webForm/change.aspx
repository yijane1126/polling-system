<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="change.aspx.cs" Inherits="webForm.change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>
                <asp:Label ID="Label1" runat="server" Text="主題"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" AutoPostBack="true"></asp:TextBox><br/>
                <asp:Label ID="Label2" runat="server" Text="說明"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" AutoPostBack="true"></asp:TextBox><br/>
                <asp:Label ID="Label3" runat="server" Text="開始日"></asp:Label>
                <asp:Calendar ID="Calendar1" runat="server" AutoPostBack="true"></asp:Calendar>
                <br/>
                <asp:Label ID="Label4" runat="server" Text="結束日"></asp:Label>
                <asp:Calendar ID="Calendar2" runat="server" AutoPostBack="true"></asp:Calendar>
                <br/>
                <asp:Button ID="Button1" runat="server" Text="更新" OnClick="update_Click" />
            </fieldset>
        </div>
    </form>
</body>
</html>
