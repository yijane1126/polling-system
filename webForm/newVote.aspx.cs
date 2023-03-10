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
    public partial class newVote : System.Web.UI.Page
    {
        OleDbConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        int id;
        string title;
        protected void vote_Click(object sender, EventArgs e)
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            con = new OleDbConnection(str);
            con.Open();

            string query = "INSERT INTO `投票` (`主題`, `說明`, `開始日`, `結束日`, `身分`, `管理者`, `型態`) VALUES (@title, @description, @start, @end, @identity, @user, @type)";

            string save = "";

            for (int i = 0; i < this.CheckBoxList1.Items.Count; i++)
            {
                if (this.CheckBoxList1.Items[i].Selected == true)
                {
                    save += this.CheckBoxList1.Items[i].Value + ",";
                }
            }
            OleDbCommand Cmd = new OleDbCommand(query, con);
            Cmd.Parameters.AddWithValue("@title", TextBox1.Text.Trim());
            Cmd.Parameters.AddWithValue("@description", TextBox2.Text.Trim());
            Cmd.Parameters.AddWithValue("@start", Calendar1.SelectedDate);
            Cmd.Parameters.AddWithValue("@end", Calendar2.SelectedDate);
            Cmd.Parameters.AddWithValue("@identity", save);
            Cmd.Parameters.AddWithValue("@user", Session["username"]);
            Cmd.Parameters.AddWithValue("@type", RadioButtonList1.SelectedValue);

            Cmd.ExecuteNonQuery();

            

            con.Close();

        }

        

        protected void finish_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close()</script>");
        }
    }
}