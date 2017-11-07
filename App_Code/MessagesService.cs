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
            "WHERE sen.MemberId = m1.MassegeSender AND rec.MemberId = m1.MessageReciver AND rec.MemberId =" + id + "";
        //string strSql = "SELECT Messages.MessageId AS Code, Messages.MessageSentTime AS Date, Messages.MessageContent AS Content, " +
        //    "Messages.MessageSubject AS Subject" +
        //    ", (m1.MemberFname & ' ' & m1.MemberLname) AS SenderName, (m2.MemberFname & ' ' & m2.MemberLname) AS ReciverName, Messages.MassageStatus AS status " +
        //    "FROM Messages, Members AS m1, Members AS m2 WHERE m1.MemberId=Messages.MassegeSender AND m2.MemberId=Messages.MessageReciver " +
        //    "AND Messages.MessageReciver =" + id + "";

        //strSql = "SELECT Messages.MessageId, MessageSubject, MessageContent, MassageStatus , MessageSentTime, " +
        //    "se.MemberFname + ' ' + se.MemberLname , re.MemberFname + ' ' + re.MemberLname " +
        //    "FROM Members AS se, Members AS re, Messages " +
        //    "WHERE Message = " + id +  "  se.MemberId=Messages.MassegeSender AND re.MemberId=Messages.MessageReciver ";
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
            "WHERE sen.MemberId = m1.MassegeSender AND rec.MemberId = m1.MessageReciver AND sen.MemberId =" + id + "";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds;
    }
}