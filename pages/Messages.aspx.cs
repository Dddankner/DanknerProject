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
        ddlMembers.Items.Insert(0, "בחר את כולם");
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
        ddlMembers.DataSource = ds;
        ddlMembers.DataValueField = "Id";
        ddlMembers.DataTextField = "Name";
        ddlMembers.DataBind();
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

    public int[] GetReciver()
    {
        int[] idRec = new int[ddlMembers.Items.Count];
        ZeroIdRec(idRec);
        for (int i = 0; i < ddlMembers.Items.Count; i++)
        {
            if (ddlMembers.Items[i].Selected)
                idRec[i] = int.Parse(ddlMembers.Items[i].Value.ToString());
        }
        return idRec;
    }

    public void ZeroIdRec(int[] n)
    {
        for (int i = 0; i < n.Length; i++)
        {
            n[i] = -1;
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        int[] idRec = GetReciver();
        for (int i = 0; i < idRec.Length; i++)
        {
            if (idRec[i] != -1)
            {
                Messages m = new Messages();
                m.MessageSender = m1.MemberId;
                m.MessageReciver = idRec[i];
                m.MessageStatus = false;
                m.MessageSentTime = DateTime.Now;
                m.MessageContent = MessageContent.Text;
                m.MessageSubject = MessageSub.Text;
                MessagesService.sendMessage(m);
            }
        }
    }

    protected void ddlMembers_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlMembers.SelectedIndex == 0)
        {
            for (int i = 0; i < ddlMembers.Items.Count; i++)
            {
                ddlMembers.Items[i].Selected = true;
            }
        }
    }
}