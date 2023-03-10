<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webForm.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <h3>
            <font face="Verdana">Logon Page</font>
        </h3>
        <table>
            <tr>
                <td>帳號:</td>
                <td><input id="txtUserName" type="text" runat="server"></td>
                <td><ASP:RequiredFieldValidator ControlToValidate="txtUserName"
                    Display="Static" ErrorMessage="*" runat="server" 
                    ID="vUserName" /></td>
            </tr>
            <tr>
                <td>密碼:</td>
                <td><input id="txtUserPass" type="password" runat="server"></td>
                <td><ASP:RequiredFieldValidator ControlToValidate="txtUserPass"
                Display="Static" ErrorMessage="*" runat="server"
                ID="vUserPass" />
                </td>
            </tr>
            <tr>
                <td>Persistent Cookie:</td>
                <td><ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" /></td>
                <td></td>
            </tr>
        </table>
        <input type="submit" Value="登入" runat="server" ID="cmdLogin"><p></p>
        <asp:Label id="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
    </form>

</body>
</html>
