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
    public partial class newOption : System.Web.UI.Page
    {
        OleDbConnection con;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMessage.Visible = false;
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);
            }
        }
        protected void opt_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            string query = "insert into 選項(選項代號, 選項內容, 投票編號, 得票數) values(@item, @text, @vote, @count)";

            OleDbCommand Cmd = new OleDbCommand(query, con);
            

            Cmd.Parameters.AddWithValue("@item", Convert.ToInt32(TextBox1.Text.Trim()));
            Cmd.Parameters.AddWithValue("@text", TextBox3.Text.Trim());
            Cmd.Parameters.AddWithValue("@vote", id);
            Cmd.Parameters.AddWithValue("@count", 0);

            try
            {
                Cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>window.close()</script>");
            }
            catch
            {
                lblErrorMessage.Visible = true;
            }
            
        }
    }
}