<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webForm._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h3>不記名投票</h3>
<div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="投票編號" DataSourceID="AccessDataSource2" EmptyDataText="沒有資料錄可顯示。">
                <HeaderStyle BackColor="#9999e6" />
                <Columns>
                    <asp:BoundField DataField="主題" HeaderText="主題" SortExpression="主題" />
                    <asp:BoundField DataField="說明" HeaderText="說明" SortExpression="說明" />
                    <asp:BoundField DataField="開始日" HeaderText="開始日" SortExpression="開始日" />
                    <asp:BoundField DataField="結束日" HeaderText="結束日" SortExpression="結束日" />
                    <asp:BoundField DataField="身分" HeaderText="身分" SortExpression="身分" />
                    <asp:BoundField DataField="型態" HeaderText="型態" SortExpression="型態" />
                    <asp:TemplateField HeaderText="Vote">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="vote" OnClick="vote_Click">Vote</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource2" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `投票` WHERE `投票編號` = ?" InsertCommand="INSERT INTO `投票` (`投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態`) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" SelectCommand="SELECT `投票編號`, `主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態` FROM `投票` WHERE `型態`='不記名'" UpdateCommand="UPDATE `投票` SET `主題` = ?, `說明` = ?, `開始日` = ?, `結束日` = ?, `身分` = ?, `管理者` = ?, `型態` = ? WHERE `投票編號` = ?">
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
<h3>使用者登入</h3>
<div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPassowrd" runat="server" TextMode="password"></asp:TextBox></td>
            </tr>
             <tr>
                <td>
                    </td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td>
            </tr>
            <tr>
                <td>
                    </td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" Text="Incorrect User Credentials" ForeColor="Red"></asp:Label></td>
            </tr>
        </table>
    </div>     
    
</asp:Content>
