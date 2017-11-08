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

    public static DataSet GetInbox(int id)
    {
        string strSql = "SELECT m1.MessageId, m1.MessageSubject, m1.MessageContent, m1.MassageStatus, m1.MessageSentTime, m1.MessageDeletedBy," +
            "(sen.MemberFname & ' ' & sen.MemberLname) AS SenderName, " +
            "(rec.MemberFname & ' ' & rec.MemberLname) AS ReciverName " +
            "FROM Messages AS m1, " +
            "Members AS sen, Members AS rec " +
            "WHERE sen.MemberId = m1.MassegeSender AND rec.MemberId = m1.MessageReciver " +
            "AND rec.MemberId =" + id + "" +
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
            "AND sen.MemberId =" + id + "";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds;
    }

    public static void DeleteMessage(int id)
    {

    }

    public static string GetMessageContent(int id)
    {
        string strSql = "SELECT Messages.MessageContent FROM Messages " +
            "WHERE MessageId=" + id + "";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds.Tables[0].Rows[0]["MessageContent"].ToString();
    }
}