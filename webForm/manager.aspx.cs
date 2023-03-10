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
    public partial class Dashboard : System.Web.UI.Page
    {
        OleDbConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
        protected void delete_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();
            
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            int id = Convert.ToInt32(grdrow.Cells[0].Text);
            string query = "delete from 投票 where 投票編號="+id;

            OleDbCommand Cmd = new OleDbCommand(query, con);
            Cmd.ExecuteNonQuery();

            con.Close();
            Response.Redirect(Request.Url.ToString());
        }

    }
}