using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pages_ShowUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembersServer ms = new MembersServer();
        DataSet ds = ms.Show();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            GridViewRow r1 = e.Row;
            string mail = r1.Cells[2].Text;
            MembersServer ms = new MembersServer();
            string pic = ms.PicUrl(mail);
            ((Image)r1.FindControl("MemberImage")).ImageUrl = "../MembersImg/"+pic+"";
        }
    }
}