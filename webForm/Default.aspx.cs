using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace webForm
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
        }

        protected void vote_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

            string id = grdrow.Cells[0].Text;
            string title = grdrow.Cells[1].Text;
            string description = grdrow.Cells[2].Text;
            string startColData = grdrow.Cells[3].Text;
            string endColData = grdrow.Cells[4].Text;

            DateTime start = Convert.ToDateTime(startColData);
            DateTime end = Convert.ToDateTime(endColData);
            string re = "vote.aspx?id=" + id + "&title=" + title;
            
            if (DateTime.Now >= start && DateTime.Now <= end)
                Response.Write("<script>window.open('" + re + "','_blank')</script>");
            else if (DateTime.Now < start)
                Label1.Text = "Election not started!!";
            else
                Label1.Text = "Election Over!!";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (OleDbConnection Con = new OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0; Data Source=C:\\Users\\hsiu\\Documents\\Database1.accdb;")) {
                Con.Open();
                string query = "SELECT count(1) FROM 使用者, 管理者 WHERE 使用者.帳號 = 管理者.帳號 AND 使用者.帳號=@username AND 使用者.密碼=@password";
                string query1 = "SELECT count(1) FROM 使用者, 學生 WHERE 使用者.帳號 = 學生.帳號 AND 使用者.帳號=@username AND 使用者.密碼=@password";
                string query2 = "SELECT count(1) FROM 使用者, 教師 WHERE 使用者.帳號 = 教師.帳號 AND 使用者.帳號=@username AND 使用者.密碼=@password";
                string query3 = "SELECT count(1) FROM 使用者, 職員 WHERE 使用者.帳號 = 職員.帳號 AND 使用者.帳號=@username AND 使用者.密碼=@password";

                OleDbCommand Cmd = new OleDbCommand(query, Con);
                OleDbCommand Cmd1 = new OleDbCommand(query1, Con);
                OleDbCommand Cmd2 = new OleDbCommand(query2, Con);
                OleDbCommand Cmd3 = new OleDbCommand(query3, Con);
                Cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                Cmd.Parameters.AddWithValue("@password", txtPassowrd.Text.Trim());
                Cmd1.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                Cmd1.Parameters.AddWithValue("@password", txtPassowrd.Text.Trim());
                Cmd2.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                Cmd2.Parameters.AddWithValue("@password", txtPassowrd.Text.Trim());
                Cmd3.Parameters.AddWithValue("@username", txtUserName.Text.Trim());
                Cmd3.Parameters.AddWithValue("@password", txtPassowrd.Text.Trim());
                int manager = Convert.ToInt32(Cmd.ExecuteScalar());
                int student = Convert.ToInt32(Cmd1.ExecuteScalar());
                int teacher = Convert.ToInt32(Cmd2.ExecuteScalar());
                int stuff = Convert.ToInt32(Cmd3.ExecuteScalar());
                Con.Close();

                if (manager == 1) {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("manager.aspx");
                }
                else if (student == 1) {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("student.aspx");
                }
                else if (teacher == 1)
                {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("teacher.aspx");
                }
                else if (stuff == 1)
                {
                    Session["username"] = txtUserName.Text.Trim();
                    Response.Redirect("stuff.aspx");
                }
                else {lblErrorMessage.Visible = true;}
            }
        }
    }
}