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
    public partial class vote : System.Web.UI.Page
    {
        OleDbConnection con;
        int election_id;
        string title;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                election_id = Convert.ToInt32(Request.QueryString["id"]);
                title = Request.QueryString["title"].ToString();
            }
            Label1.Text = title;
        }
        protected void vote_Click(object sender, EventArgs e) 
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            int vote_id = Convert.ToInt32(grdrow.Cells[0].Text);

            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            string command = "insert into [記名投票] values ('" + election_id + "','" + Session["username"] + "','" + DateTime.Today + "','" + vote_id + "')";
            string command2 = "update [選項] set [得票數]=[得票數]+1 where [選項代號]=" + vote_id + " and [投票編號]="+ election_id;
            OleDbCommand cmd = new OleDbCommand(command, con);
            OleDbCommand cmd2 = new OleDbCommand(command2, con);

            try
            {
                cmd.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                Response.Write("<script>window.close()</script>");
            }
            catch
            {
                Response.Write("<script>window.close()</script>");
            }

            con.Close();

            LinkButton l1 = sender as LinkButton;
            l1.Visible = false;
        }
    }
}