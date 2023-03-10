<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stuff.aspx.cs" Inherits="webForm.stuff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Stuff</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,200,500,600,700' rel='stylesheet' type='text/css' />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
    <link href="Content/material-cards.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <style>
        .container{
            margin:0 auto;
            width: 80%;
        }
        .menu {
            background-color:white;
            width:100%;
        }
        .menu a{
            color:black;
        }

    </style>
</head>
<body>
     <nav class="menu">
      <ul>
        <li><a href="Default.aspx">校園線上投票系統</a></li>
      </ul>
    </nav>
    <asp:Label ID="nameLabel" runat="server" Font-Size="Large"></asp:Label>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" CssClass=" red-text"></asp:Label>
        <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="投票編號" DataSourceID="AccessDataSource1" EmptyDataText="沒有資料錄可顯示。">
                <HeaderStyle BackColor="#9999e6" />
                <Columns>
                    <asp:BoundField DataField="投票編號" HeaderText="投票編號" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="主題" HeaderText="主題" SortExpression="主題" />
                    <asp:BoundField DataField="說明" HeaderText="說明" SortExpression="說明" />
                    <asp:BoundField DataField="開始日" HeaderText="開始日" SortExpression="開始日" />
                    <asp:BoundField DataField="結束日" HeaderText="結束日" SortExpression="結束日" />
                    <asp:BoundField DataField="身分" HeaderText="身分" SortExpression="身分" />
                   
                    <asp:BoundField DataField="型態" HeaderText="型態" SortExpression="型態" />
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="detail" OnClick="detail_Click">更多</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="vote" OnClick="vote_Click">投票</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `投票` WHERE `投票編號` = ?" InsertCommand="INSERT INTO `投票` (`投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態` FROM `投票` WHERE `身分` LIKE '%職員%'" UpdateCommand="UPDATE `投票` SET `主題` = ?, `說明` = ?, `開始日` = ?, `結束日` = ?, `身分` = ?, `管理者` = ?, `型態` = ? WHERE `投票編號` = ?">
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

        <div>
            <asp:Button ID="Button1" runat="server" Text="新增投票" OnClick="add_Click" Visible="false"/>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="投票編號" DataSourceID="AccessDataSource2" EmptyDataText="沒有資料錄可顯示。">
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
            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" SelectCommand="SELECT * FROM [投票] WHERE ([管理者] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="管理者" SessionField="username" Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
            <br/>
        </div>
        
    </form>
</body>
</html>
