using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_Messages1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillCbxRecivers();
        }
    }

    public void FillCbxRecivers()
    {
        DataSet ds = MembersServer.ShowAllButU(((Members)Session["Member"]).MemberId);
        ddlMembers.DataSource = ds;
        ddlMembers.DataTextField = "Name";
        ddlMembers.DataValueField = "ID";
        ddlMembers.DataBind();

    }

    protected void SelectAll_CheckedChanged(object sender, EventArgs e)
    {
        if (SelectAll.Checked)
        {
            for (int i = 0; i < ddlMembers.Items.Count; i++)
            {
                ddlMembers.Items[i].Selected = true;
                ddlMembers.Items[i].Enabled = false;
            }
        }
        else
        {
            for (int i = 0; i < ddlMembers.Items.Count; i++)
            {
                ddlMembers.Items[i].Selected = false;
                ddlMembers.Items[i].Enabled = true;
            }
        }
    }
}