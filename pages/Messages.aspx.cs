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
        {
            m1 = (Members)Session["Member"];
            if (m1.memberManager)
                FillddlMembers();
            else
                lblManager.Text = "שולח למנהל";
        }
        //FillddlManagers();
        //FillddlMembers();
        //DataSet ds = MessagesService.GetInbox(m1.MemberId);
        //Inbox.DataSource = ds;
        //Inbox.DataBind();
        //Inbox.Attributes.Add("style", "direction:rtl");
        //DataSet ds1 = MessagesService.GetOutbox(m1.MemberId);
        //Outbox.DataSource = ds1;
        //Outbox.DataBind();
        //Outbox.Attributes.Add("style", "direction:rtl");
        FillInbox();
        FillOutbox();
        messageContentDiv.InnerText = "";
        OutboxDiv.InnerText = "";
    }

    public void FillInbox()
    {
        DataSet ds = MessagesService.GetInbox(m1.MemberId);
        Inbox.DataSource = ds;
        Inbox.DataBind();
        Inbox.Attributes.Add("style", "direction:rtl");
    }

    public void FillOutbox()
    {
        DataSet ds1 = MessagesService.GetOutbox(m1.MemberId);
        Outbox.DataSource = ds1;
        Outbox.DataBind();
        Outbox.Attributes.Add("style", "direction:rtl");
    }

    public void FillddlMembers()
    {
        DataSet ds = MembersServer.ShowAllButU(m1.MemberId);
        ddlMembers.DataSource = ds;
        ddlMembers.DataValueField = "ID";
        ddlMembers.DataTextField = "Name";
        ddlMembers.DataBind();
    }

    public void FillddlManagers()
    {
        DataSet ds = MembersServer.ShowManagersOnly();
        ddlMembers.DataSource = ds;
        ddlMembers.DataValueField = "ID";
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

    public List<int> GetReciver()
    {
        List<int> idRec = new List<int>();
        for (int i = 0; i < ddlMembers.Items.Count; i++)
        {
            if (ddlMembers.Items[i].Selected)
                idRec.Add(int.Parse(ddlMembers.Items[i].Value.ToString()));
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
        List<int> idRec = GetReciver();
        List<Messages> mes = new List<Messages>();
        if (m1.memberManager)
        {
            for (int i = 0; i < idRec.Count; i++)
            {
                Messages m2 = new Messages();
                m2.MessageSender = m1.MemberId;
                m2.MessageReciver = idRec[i];
                m2.MessageStatus = false;
                m2.MessageSentTime = DateTime.Now;
                m2.MessageContent = MessageContent.Text;
                m2.MessageSubject = MessageSub.Text;
                mes.Add(m2);
            }
            MessagesService.SendList(mes);
        }
        else
        {
            Messages m = new Messages();
            m.MessageSender = m1.MemberId;
            m.MessageReciver = 1;
            m.MessageStatus = false;
            m.MessageSentTime = DateTime.Now;
            m.MessageContent = MessageContent.Text;
            m.MessageSubject = MessageSub.Text;
            MessagesService.sendMessage(m);
        }        
        //Response.Write(ddlMembers.SelectedValue);
        MessageContent.Text = "";
        MessageSub.Text = "";
        //lblError.Text = "accd";
        FillInbox();
        FillOutbox();
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
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int MessageID = (int)Inbox.DataKeys[rowIndex].Value;
        if (e.CommandName.ToString() == "Read")
        {
            messageContentDiv.InnerText = MessagesService.GetMessageContent(MessageID);
            MessagesService.ChangeStatus(MessageID);
            FillInbox();
        }
        if(e.CommandName.ToString() == "delete")
        {
            MessagesService.DeleteMessage(MessageID, m1.MemberId);
        }
    }

    protected void Outbox_RowDataBound(object sender, GridViewRowEventArgs e)
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

    protected void Outbox_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        int MessageID = (int)Outbox.DataKeys[rowIndex].Value;
        if (e.CommandName.ToString() == "Read")
        {            
            OutboxDiv.InnerText = MessagesService.GetMessageContent(MessageID);
        }
        if (e.CommandName.ToString() == "delete")
        {
            MessagesService.DeleteMessage(MessageID, m1.MemberId);
        }
    }

    protected void SelectAll_CheckedChanged(object sender, EventArgs e)
    {
        if(SelectAll.Checked)
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

    protected void Inbox_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FillInbox();
    }

    protected void Outbox_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        FillOutbox();
    }
}