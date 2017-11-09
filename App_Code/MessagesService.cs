using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;

/// <summary>
/// Summary description for MessagesService
/// </summary>
public class MessagesService
{
	public MessagesService()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static void sendMessage(Messages m)
    {
        string strSql = "INSERT INTO Messages " +
            "(MassegeSender, MessageReciver, MassageStatus, MessageDeletedBy, MessageSentTime, MessageContent, MessageSubject) " +
            "VALUES " +
            "(" + m.MessageSender + ", " + m.MessageReciver + ", " + m.MessageStatus + ", " + int.Parse("-1") + ", " +
            "'" + m.MessageSentTime + "', '" + m.MessageContent + "', '" + m.MessageSubject + "')";
        //strSql += "VALUES(" + m.MessageSender + ", " + m.MessageReciver + ", " + m.MessageStatus + ", " + int.Parse("-1") + ", " + m.MessageSentTime + ", '" + m.MessageContent + "', '" + m.MessageSubject + "')";
        Connect.InsertUpdateDelete(strSql);
        //HttpContext.Current.Response.Write(strSql);
    }

    public static void SendToAll(Messages m)
    {

    }

    public static DataSet GetInbox(int id)
    {
        string strSql = "SELECT m1.MessageId, m1.MessageSubject, m1.MessageContent, m1.MassageStatus, m1.MessageSentTime, m1.MessageDeletedBy," +
            "(sen.MemberFname & ' ' & sen.MemberLname) AS SenderName, " +
            "(rec.MemberFname & ' ' & rec.MemberLname) AS ReciverName " +
            "FROM Messages AS m1, " +
            "Members AS sen, Members AS rec " +
            "WHERE sen.MemberId = m1.MassegeSender AND rec.MemberId = m1.MessageReciver " +
            "AND rec.MemberId =" + id + " " +
            "ORDER BY m1.MassageStatus DESC, m1.MessageSentTime DESC";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds;
    }

    public static DataSet GetOutbox(int id)
    {
        string strSql = "SELECT m1.MessageId, m1.MessageSubject, m1.MessageContent, m1.MassageStatus, m1.MessageSentTime, m1.MessageDeletedBy," +
            "(sen.MemberFname & ' ' & sen.MemberLname) AS SenderName, " +
            "(rec.MemberFname & ' ' & rec.MemberLname) AS ReciverName " +
            "FROM Messages AS m1, " +
            "Members AS sen, Members AS rec " +
            "WHERE sen.MemberId = m1.MassegeSender AND rec.MemberId = m1.MessageReciver " +
            "AND sen.MemberId =" + id + " AND m1.MessageDeletedBy<>" + id + " " +
            "ORDER BY m1.MassageStatus DESC, m1.MessageSentTime DESC";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds;
    }

    public static void DeleteMessage(int mesID, int memID)
    {
        string strSql = "SELECT MessageDeletedBy FROM Messages WHERE MessageId=" + mesID;
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        if(int.Parse(ds.Tables[0].Rows[0]["MessageDeletedBy"].ToString()) == -1)
        {
            string strSql1 = "UPDATE Messages SET MessageDeletedBy=" + memID + " WHERE MessageId=" + mesID;
            Connect.InsertUpdateDelete(strSql1);
        }
        else if(int.Parse(ds.Tables[0].Rows[0]["MessageDeletedBy"].ToString()) != -1)
        {
            string strSql1 = "DELETE FROM Messages WHERE MessageId=" + mesID;
            Connect.InsertUpdateDelete(strSql1);
        }
    }

    public static void SendList(List<Messages> msgs)
    {
        DataTable messages = new DataTable();
        messages.Columns.Add("MessageSenderID");
        messages.Columns.Add("MessageReciverID");
        messages.Columns.Add("MessageSubject");
        messages.Columns.Add("MessageContent");
        messages.Columns.Add("MessageIsRead");
        messages.Columns.Add("MessageSendDate");
        messages.Columns.Add("MessageDeletedBy");

        for (int i = 0; i < msgs.Count; i++)
        {
            DataRow dr = messages.NewRow();
            dr["MessageSenderID"] = msgs[i].SenderID;
            dr["MessageReciverID"] = msgs[i].ReciverID;
            dr["MessageSubject"] = msgs[i].Subject;
            dr["MessageContent"] = msgs[i].Content;
            dr["MessageIsRead"] = false;
            dr["MessageSendDate"] = DateTime.Now;
            dr["MessageDeletedBy"] = -1;
            messages.Rows.Add(dr);
        }
        InsertAllMessages(messages);
    }

    private static void InsertAllMessages(DataTable dt)
    {
        OleDbConnection con = new OleDbConnection(Connect.GetConnectionString());

        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Messages(MessageSenderID, MessageReciverID, MessageSubject, MessageContent, " +
            "MessageIsRead, MessageSendDate, MessageDeletedBy) " +
                "VALUES " +
            "(@MessageSenderID, @MessageReciverID, @MessageSubject, @MessageContent, @MessageIsRead, " +
            "@MessageSendDate, @MessageDeletedBy)";
        cmd.Parameters.Add("@MessageSenderID", OleDbType.Integer);
        cmd.Parameters.Add("@MessageReciverID", OleDbType.Integer);
        cmd.Parameters.Add("@MessageSubject", OleDbType.WChar, 255);
        cmd.Parameters.Add("@MessageContent", OleDbType.WChar, 255);
        cmd.Parameters.Add("@MessageIsRead", OleDbType.Boolean, 2);
        cmd.Parameters.Add("@MessageSendDate", OleDbType.Date);
        cmd.Parameters.Add("@MessageDeletedBy", OleDbType.Integer);
        con.Open();
        cmd.Prepare();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cmd.Parameters[0].Value = int.Parse(dt.Rows[i]["MessageSenderID"].ToString());
            cmd.Parameters[1].Value = int.Parse(dt.Rows[i]["MessageReciverID"].ToString());
            cmd.Parameters[2].Value = dt.Rows[i]["MessageSubject"].ToString();
            cmd.Parameters[3].Value = dt.Rows[i]["MessageContent"].ToString();
            cmd.Parameters[4].Value = bool.Parse(dt.Rows[i]["MessageIsRead"].ToString());
            cmd.Parameters[5].Value = DateTime.Parse(dt.Rows[i]["MessageSendDate"].ToString());
            cmd.Parameters[6].Value = int.Parse(dt.Rows[i]["MessageDeletedBy"].ToString());
            cmd.ExecuteNonQuery();
        }

        OleDbTransaction trance = con.BeginTransaction();
        cmd.Transaction = trance;
        trance.Commit();
        con.Close();
    }

    public static string GetMessageContent(int id)
    {
        string strSql = "SELECT Messages.MessageContent FROM Messages " +
            "WHERE MessageId=" + id + "";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds.Tables[0].Rows[0]["MessageContent"].ToString();
    }

    public static void ChangeStatus(int id)
    {
        string strSql = "UPDATE Messages SET MassageStatus=True WHERE MessageId=" + id + "";
        Connect.InsertUpdateDelete(strSql);
    }
}