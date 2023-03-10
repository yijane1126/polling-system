<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="vote.aspx.cs" Inherits="webForm.vote" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Matdaan - Voting</title>
    <link href="http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic" rel="stylesheet" type="text/css" />
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,200,500,600,700' rel='stylesheet' type='text/css' />
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css" />
    <link href="Content/material-cards.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>--%>
    <style>
        img {
            vertical-align: middle;
        }
        .img-responsive,
        .thumbnail > img,
        .thumbnail a > img,
        .carousel-inner > .item > img,
        .carousel-inner > .item > a > img {
        display: block;
        max-width: 100%;
        height: auto;
        }
        .img-rounded {
            border-radius: 6px;
        }
        .img-thumbnail {
            display: inline-block;
            max-width: 100%;
            height: auto;
            padding: 4px;
            line-height: 1.42857143;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }
        .img-circle {
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br /> <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="選項代號,投票編號" DataSourceID="AccessDataSource1" EmptyDataText="沒有資料錄可顯示。">
                <HeaderStyle BackColor="#9999e6" />
                <Columns>
                    <asp:BoundField DataField="選項代號" HeaderText="選項代號" ReadOnly="True" SortExpression="選項代號" />
                    <asp:BoundField DataField="選項內容" HeaderText="選項內容" SortExpression="選項內容" />
                    <asp:BoundField DataField="投票編號" HeaderText="投票編號" ReadOnly="True" SortExpression="投票編號" />
                    <asp:BoundField DataField="得票數" HeaderText="得票數" SortExpression="得票數" />
                    <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="vote" OnClick="vote_Click">VOTE</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="C:\Users\hsiu\Documents\Database1.accdb" DeleteCommand="DELETE FROM `選項` WHERE `選項代號` = ? AND `投票編號` = ?" InsertCommand="INSERT INTO `選項` (`選項代號`, `選項內容`, `投票編號`, `得票數`) VALUES (?, ?, ?, ?)" SelectCommand="SELECT `選項代號`, `選項內容`, `投票編號`, `得票數` FROM `選項` WHERE `投票編號` = @eid" UpdateCommand="UPDATE `選項` SET `選項內容` = ?, `得票數` = ? WHERE `選項代號` = ? AND `投票編號` = ?">
                <DeleteParameters>
                    <asp:Parameter Name="選項代號" Type="Int32" />
                    <asp:Parameter Name="投票編號" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="選項代號" Type="Int32" />
                    <asp:Parameter Name="選項內容" Type="String" />
                    <asp:Parameter Name="投票編號" Type="Int32" />
                    <asp:Parameter Name="得票數" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="選項內容" Type="String" />
                    <asp:Parameter Name="得票數" Type="Int32" />
                    <asp:Parameter Name="選項代號" Type="Int32" />
                    <asp:Parameter Name="投票編號" Type="Int32" />
                </UpdateParameters>
                 <SelectParameters>
                        <asp:QueryStringParameter Name="eid" QueryStringField="id" Type="Int32" />
                    </SelectParameters>
            </asp:AccessDataSource>
        </div>
    </form>
</body>
</html>
