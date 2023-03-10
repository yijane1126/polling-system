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
    public partial class student : System.Web.UI.Page
    {
        OleDbConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            nameLabel.Text = "Hi, "+Convert.ToString(Session["username"]);
            Label1.Text = "";

            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();
            string query = "select count(1) from 使用者 where 帳號=@user and 權限=true";
            OleDbCommand Cmd = new OleDbCommand(query, con);
            Cmd.Parameters.AddWithValue("@user", Convert.ToString(Session["username"]));
            int exists = Convert.ToInt32(Cmd.ExecuteScalar());
            con.Close();
            if (exists == 1)
            {
                Button1.Visible = true;
            }
        }
        protected void detail_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

            int id = Convert.ToInt32(grdrow.Cells[0].Text);
            string title = grdrow.Cells[1].Text;
            string re = "chart.aspx?id=" + id + "&title=" + title;
            Response.Write("<script>window.open('" + re + "','_blank')</script>");
        }
        protected void vote_Click(object sender, EventArgs e) 
        {
            
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;

            string id = grdrow.Cells[0].Text;
            string title = grdrow.Cells[1].Text;
            string description = grdrow.Cells[2].Text;
            string startColData = grdrow.Cells[3].Text;
            string endColData = grdrow.Cells[4].Text;


            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            string query = "select count(1) from 記名投票 where 投票編號=@vote and 帳號=@user";
            OleDbCommand Cmd = new OleDbCommand(query, con);
            Cmd.Parameters.AddWithValue("@vote", Convert.ToInt32(id));
            Cmd.Parameters.AddWithValue("@user", Convert.ToString(Session["username"]));

            int exists = Convert.ToInt32(Cmd.ExecuteScalar());
            con.Close();
            if (exists != 1)
            {
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
            else
            {
                Label1.Text = "Already voted!!";
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('newVote.aspx','_blank')</script>");
        }
        protected void insert_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            string id = grdrow.Cells[0].Text;
            string title = grdrow.Cells[1].Text;
            string re = "newOption.aspx?id=" + id + "&title=" + title;
            Response.Write("<script>window.open('" + re + "','_blank')</script>");
        }
        protected void delete_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(grdrow.Cells[0].Text);
            string query = "delete from 投票 where 投票編號=" + id;

            OleDbCommand Cmd = new OleDbCommand(query, con);
            Cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect(Request.Url.ToString());
        }
        protected void change_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            string id = grdrow.Cells[0].Text;
            string title = grdrow.Cells[1].Text;
            string des = grdrow.Cells[2].Text;
            string start = grdrow.Cells[3].Text;
            string end = grdrow.Cells[4].Text;
            string re = "change.aspx?id=" + id + "&title=" + title + "&des=" + des + "&start=" + start + "&end=" + end;
            Response.Write("<script>window.open('" + re + "','_blank')</script>");

            con.Close();
        }

    }
}