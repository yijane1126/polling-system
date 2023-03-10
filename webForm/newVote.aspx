<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newVote.aspx.cs" Inherits="webForm.newVote" %>

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
              <legend>新增投票</legend>
              <p>
                  <asp:Label ID="Label2" runat="server" Text="主題"></asp:Label>
                  <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
              </p>

              <p>
                  <asp:Label ID="Label3" runat="server" Text="說明"></asp:Label>
                  <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
              </p>

              <p>
                  <asp:Label ID="Label4" runat="server" Text="開始日"></asp:Label>
                  <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
              </p>

              <p>
                  <asp:Label ID="Label5" runat="server" Text="結束日"></asp:Label>
                  <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
              </p>
              <p>
                  <asp:Label ID="Label6" runat="server" Text="身分"></asp:Label><br/>
                  <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                      <asp:ListItem>學生</asp:ListItem>
                      <asp:ListItem>教師</asp:ListItem>
                      <asp:ListItem>職員</asp:ListItem>
                  </asp:CheckBoxList>
                  
              </p>
              <p>
                  <asp:Label ID="Label7" runat="server" Text="型態"></asp:Label><br/>
                  <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                      <asp:ListItem Selected="True">記名</asp:ListItem>
                      <asp:ListItem>不記名</asp:ListItem>
                  </asp:RadioButtonList>
              </p>

              <asp:Button ID="btn" runat="server" Text="新增投票" OnClick="vote_Click" />
             
            </fieldset>

           
            <br/>
            <asp:Button ID="Button2" runat="server" Text="完成" OnClick="finish_Click" />
          
            
        
    </div>
    </form>
</body>
</html>
