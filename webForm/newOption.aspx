<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newOption.aspx.cs" Inherits="webForm.newOption" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblErrorMessage" runat="server" Text="選項代號已存在" ForeColor="Red"></asp:Label>

             <fieldset>
                <p>
                    <asp:Label ID="Label1" runat="server" Text="選項代號"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
                  <asp:Label ID="Label8" runat="server" Text="選項內容"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
                    
              </p>

              <asp:Button ID="Button1" runat="server" Text="新增選項" OnClick="opt_Click" />
            </fieldset>
        </div>
    </form>
</body>
</html>
