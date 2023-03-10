<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="manager.aspx.cs" Inherits="webForm.Dashboard" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
</head>
<body>
    <form id="form1" runat="server">
    <h1>管理者</h1>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br /><br /> <br />
    <div>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="投票編號" DataSourceID="AccessDataSource1" EmptyDataText="沒有資料錄可顯示。">
            <HeaderStyle BackColor="#A3E4D7" />
            <Columns>
                <asp:BoundField DataField="投票編號" HeaderText="投票編號" ReadOnly="True" SortExpression="投票編號" />
                <asp:BoundField DataField="主題" HeaderText="主題" SortExpression="主題" />
                <asp:BoundField DataField="說明" HeaderText="說明" SortExpression="說明" />
                <asp:BoundField DataField="開始日" HeaderText="開始日" SortExpression="開始日" />
                <asp:BoundField DataField="結束日" HeaderText="結束日" SortExpression="結束日" />
                <asp:BoundField DataField="身分" HeaderText="身分" SortExpression="身分" />
                <asp:BoundField DataField="管理者" HeaderText="管理者" SortExpression="管理者" />
                <asp:BoundField DataField="型態" HeaderText="型態" SortExpression="型態" />
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="add" OnClick="insert_Click">新增選項</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="change" OnClick="change_Click">修改</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="delete" OnClick="delete_Click">刪除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `投票` WHERE `投票編號` = ?" InsertCommand="INSERT INTO `投票` (`投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態` FROM `投票` WHERE `管理者` = @user" UpdateCommand="UPDATE `投票` SET `主題` = ?, `說明` = ?, `開始日` = ?, `結束日` = ?, `身分` = ?, `管理者` = ?, `型態` = ? WHERE `投票編號` = ?">
            <DeleteParameters>
                <asp:Parameter Name="投票編號" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="投票編號" Type="Int32" />
                <asp:Parameter Name="主題" Type="String" />
                <asp:Parameter Name="說明" Type="String" />
                <asp:Parameter Name="開始日" Type="DateTime" />
                <asp:Parameter Name="結束日" Type="DateTime" />
                <asp:Parameter Name="身分" Type="String" />
                <asp:Parameter Name="管理者" Type="String" />
                <asp:Parameter Name="型態" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="主題" Type="String" />
                <asp:Parameter Name="說明" Type="String" />
                <asp:Parameter Name="開始日" Type="DateTime" />
                <asp:Parameter Name="結束日" Type="DateTime" />
                <asp:Parameter Name="身分" Type="String" />
                <asp:Parameter Name="管理者" Type="String" />
                <asp:Parameter Name="型態" Type="String" />
                <asp:Parameter Name="投票編號" Type="Int32" />
            </UpdateParameters>
            <selectparameters>
		        <asp:sessionparameter name="user" sessionfield="username" type="String" />
	        </selectparameters>
        </asp:AccessDataSource>
    </div>
        
    
        <asp:Button ID="Button1" runat="server" Text="新增投票" OnClick="add_Click"/><br/>

     <div>
         <asp:Label ID="Label2" runat="server" Text="使用者權限管理"></asp:Label>
         
        
         
         <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="帳號" DataSourceID="AccessDataSource2" EmptyDataText="沒有資料錄可顯示。">
             <HeaderStyle BackColor="#A3E4D7" />
             <Columns>
                 <asp:CommandField ShowEditButton="True" />
                 <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" SortExpression="帳號" />
                 <asp:BoundField DataField="密碼" HeaderText="密碼" ReadOnly="True" SortExpression="密碼" />
                 <asp:CheckBoxField DataField="權限" HeaderText="權限" SortExpression="權限" />
             </Columns>
         </asp:GridView>
         <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `使用者` WHERE `帳號` = ?" InsertCommand="INSERT INTO `使用者` (`帳號`, `密碼`, `權限`) VALUES (?, ?, ?)" SelectCommand="SELECT `帳號`, `密碼`, `權限` FROM `使用者`" UpdateCommand="UPDATE `使用者` SET `密碼` = ?, `權限` = ? WHERE `帳號` = ?">
             <DeleteParameters>
                 <asp:Parameter Name="帳號" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="帳號" Type="String" />
                 <asp:Parameter Name="密碼" Type="String" />
                 <asp:Parameter Name="權限" Type="Boolean" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="密碼" Type="String" />
                 <asp:Parameter Name="權限" Type="Boolean" />
                 <asp:Parameter Name="帳號" Type="String" />
             </UpdateParameters>
         </asp:AccessDataSource>
         
     </div>   
           
   
    </form>
    
</body>
</html>
