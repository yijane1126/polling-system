<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teacher.aspx.cs" Inherits="webForm.teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <h1>老師</h1>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="投票編號" DataSourceID="AccessDataSource1" EmptyDataText="沒有資料錄可顯示。">
                <Columns>
                    <asp:BoundField DataField="投票編號" HeaderText="投票編號" ReadOnly="True" SortExpression="投票編號" />
                    <asp:BoundField DataField="主題" HeaderText="主題" SortExpression="主題" />
                    <asp:BoundField DataField="說明" HeaderText="說明" SortExpression="說明" />
                    <asp:BoundField DataField="開始日" HeaderText="開始日" SortExpression="開始日" />
                    <asp:BoundField DataField="結束日" HeaderText="結束日" SortExpression="結束日" />
                    <asp:BoundField DataField="身分" HeaderText="身分" SortExpression="身分" />
                    <asp:BoundField DataField="管理者" HeaderText="管理者" SortExpression="管理者" />
                    <asp:BoundField DataField="型態" HeaderText="型態" SortExpression="型態" />
                </Columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `投票` WHERE `投票編號` = ?" InsertCommand="INSERT INTO `投票` (`投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態` FROM `投票`" UpdateCommand="UPDATE `投票` SET `主題` = ?, `說明` = ?, `開始日` = ?, `結束日` = ?, `身分` = ?, `管理者` = ?, `型態` = ? WHERE `投票編號` = ?">
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
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
