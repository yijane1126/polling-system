using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webForm
{
    public partial class chart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = Request.QueryString["title"].ToString();
        }
        protected void finish_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close()</script>");
        }

    }
}