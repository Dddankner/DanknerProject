using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_Messages : System.Web.UI.Page
{
    public static Members m1;
    protected void Page_Load(object sender, EventArgs e)
    {
        m1 = (Members)Session["Member"];
        if (!m1.memberManager)
            FillddlManagers();
        else
            FillddlMembers();
    }
    
    public void FillddlMembers()
    {
        DataSet ds = MembersServer.ShowAllButU(m1.MemberId);
        ddlMembers.DataSource = ds;
        ddlMembers.DataValueField = "Id";
        ddlMembers.DataTextField = "Name";
        ddlMembers.DataBind();
    }

    public void FillddlManagers()
    {
        DataSet ds = MembersServer.ShowManagersOnly();
        ddlManager.DataSource = ds;
        ddlManager.DataValueField = "Id";
        ddlManager.DataTextField = "Name";
        ddlManager.DataBind();
    }

    public string[] MembersNames(DataSet ds)
    {
        string[] names = new string[ds.Tables["members"].Rows.Count];
        for (int i = 0; i < ds.Tables["members"].Rows.Count; i++)
        {
            names[i] = ds.Tables["members"].Rows[i]["MemberFname"].ToString() + ds.Tables["members"].Rows[i]["MemberLname"].ToString();
        }
        return names;
    }

    public int GetReciver()
    {
        if (m1.memberManager)
            return int.Parse(ddlMembers.SelectedValue);
        else
            return int.Parse(ddlManager.SelectedValue);
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        Messages m = new Messages();
        m.MessageSender = m1.MemberId;
        m.MessageReciver = GetReciver();
        m.MessageStatus = false;
        m.MessageSentTime = DateTime.Now;
        m.MessageContent = MessageContent.Text;
        MessagesService.sendMessage(m);
    }
}