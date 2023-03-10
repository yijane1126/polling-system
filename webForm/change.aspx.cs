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
    public partial class change : System.Web.UI.Page
    {
        OleDbConnection con;
        int election_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            election_id = Convert.ToInt32(Request.QueryString["id"]);
            if (!IsPostBack)
            {
                TextBox1.Text = Request.QueryString["title"].ToString();
                TextBox2.Text = Request.QueryString["des"].ToString();
                Calendar1.SelectedDate = DateTime.Parse(Request.QueryString["start"].ToString());
                Calendar2.SelectedDate = DateTime.Parse(Request.QueryString["end"].ToString());

            }

        }
        protected void update_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            string query = "update 投票 set 主題='" + TextBox1.Text.Trim() + "', 說明='" + TextBox2.Text.Trim() + "', 開始日='" + Calendar1.SelectedDate + "', 結束日='" + Calendar2.SelectedDate + "' where 投票編號="+election_id;

            OleDbDataAdapter adapter = new OleDbDataAdapter();
            OleDbCommand Cmd = new OleDbCommand(query, con);

            adapter.InsertCommand = new OleDbCommand(query, con);
            adapter.InsertCommand.ExecuteNonQuery();

            Cmd.Dispose();            
            Response.Write("<script>window.close()</script>");
            con.Close();
        }

    }
}