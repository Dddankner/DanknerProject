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
        if (!IsPostBack)
            ddlMembers.Items.Insert(0, "בחר את כולם");
        m1 = (Members)Session["Member"];
        FillddlManagers();
        FillddlMembers();
        DataSet ds = MessagesService.GetInbox(m1.MemberId);
        Inbox.DataSource = ds;
        Inbox.DataBind();
        Inbox.Attributes.Add("style", "direction:rtl");
        DataSet ds1 = MessagesService.GetOutbox(m1.MemberId);
        messageContentDiv.InnerText = "";
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
            if (idRec[i] > 0)
            {
                //Messages m = new Messages();
                //m.MessageSender = m1.MemberId;
                //m.MessageReciver = idRec[i];
                //m.MessageStatus = false;
                //m.MessageSentTime = DateTime.Now;
                //m.MessageContent = MessageContent.Text;
                //m.MessageSubject = MessageSub.Text;
                //MessagesService.sendMessage(m);
            }
        }
        Messages m = new Messages();
        m.MessageSender = m1.MemberId;
        m.MessageReciver = int.Parse(ddlMembers.SelectedValue.ToString());
        m.MessageStatus = false;
        m.MessageSentTime = DateTime.Now;
        m.MessageContent = MessageContent.Text;
        m.MessageSubject = MessageSub.Text;
        MessagesService.sendMessage(m);
        //Response.Write(ddlMembers.SelectedValue);
        MessageContent.Text = "";
        MessageSub.Text = "";
        lblError.Text = "accd";
    }



    protected void MessagesGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridViewRow r1 = e.Row;
            r1.CssClass = "row";
        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow r1 = e.Row;
            r1.BackColor = System.Drawing.Color.Black;
            r1.ForeColor = System.Drawing.Color.White;
        }
    }

    protected void Inbox_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int MessageID = (int)Inbox.DataKeys[(int)e.CommandArgument].Value;
        if(e.CommandName == "GetID")
        {
            messageContentDiv.InnerText = MessagesService.GetMessageContent(MessageID);
        }
    }
}