<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chart.aspx.cs" Inherits="webForm.chart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="選項代號,投票編號" DataSourceID="AccessDataSource1" EmptyDataText="沒有資料錄可顯示。">
                <Columns>
                    <asp:BoundField DataField="選項代號" HeaderText="選項代號" ReadOnly="True" SortExpression="選項代號" />
                    <asp:BoundField DataField="選項內容" HeaderText="選項內容" SortExpression="選項內容" />
                    <asp:BoundField DataField="投票編號" HeaderText="投票編號" ReadOnly="True" SortExpression="投票編號" />
                    <asp:BoundField DataField="得票數" HeaderText="得票數" SortExpression="得票數" />
                    <asp:BoundField DataField="附件" HeaderText="附件" SortExpression="附件" />
                </Columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" SelectCommand="SELECT * FROM [選項] WHERE ([投票編號] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="投票編號" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
        </div>
        <div>
            <asp:Label ID="Label2" runat="server" Text="投票情形"></asp:Label><br/>
            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                <Series>
                    <asp:Series Name="Series1" XValueMember="選項內容" YValueMembers="得票數">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [得票數], [選項內容] FROM [選項] WHERE ([投票編號] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="投票編號" QueryStringField="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </div>
        <asp:Button ID="Button1" runat="server" Text="結束" OnClick="finish_Click" />
    </form>
</body>
</html>
