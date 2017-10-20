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
        Members m1 = (Members)Session["Member"];
        MembersServer ms = new MembersServer();
        DataSet ds = GetData(m1);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        GridView1.Attributes.Add("style", "margin-top:20px; direction:rtl");

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridViewRow r1 = e.Row;
            string mail = r1.Cells[2].Text;
            MembersServer ms = new MembersServer();
            string pic = ms.PicUrl(mail);
            ((Image)r1.FindControl("MemberImage")).ImageUrl = "../MembersImg/" + pic + "";
            r1.CssClass = "row";
            if (r1.Cells[11].Text == "פעיל")
                r1.Cells[11].ForeColor = System.Drawing.Color.Green;
            else
                r1.Cells[11].ForeColor = System.Drawing.Color.Red;
        }

        if(e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow r1 = e.Row;
            r1.BackColor = System.Drawing.Color.Black;
            r1.ForeColor = System.Drawing.Color.White;
        }

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[10].FindControl("DeleteBtn") is Image)
            {
                ((Image)GridView1.Rows[i].Cells[10].FindControl("DeleteBtn")).Attributes.Add("onclick", "DeleteRed('" + GridView1.Rows[i].Cells[2].Text + "')");
            }
        }



        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[9].FindControl("ImageUpdate") is Image)
            {
                ((Image)GridView1.Rows[i].Cells[9].FindControl("ImageUpdate")).Attributes.Add("onclick", "UpdateRed('" + GridView1.Rows[i].Cells[2].Text.Trim() + "')");
            }
        }
    }



    public static DataSet GetData(Members m1)
    {
        DataSet ds = new DataSet();
        MembersServer ms = new MembersServer();
        if (m1.memberManager)
        {
            ds = ms.ShowAll();
        }
        else
        {
            ds = ms.ShowMember(m1.memberMail);
        }
        return ds;
    }


    
    protected void UpdateBtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("../pages/Update.aspx");
    }

    protected void DeleteBtn_Click(object sender, ImageClickEventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            if (r.FindControl("DeleteBtn") == sender)
            {
                string mail = r.Cells[2].ToString();

            }
        }
    }
}