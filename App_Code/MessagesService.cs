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

    public static DataSet GetMessages()
    {
        string strSql = "SELECT Messages.MessageId AS Code,MessageDate AS Date,MessageContent AS Content, MessageSubject AS Subject" +
            ",m1.MemberFname + '' + m1.MemberLname AS Sender,m2.MemberFname + '' + m2.MemberLname AS Reciver, MessageStatus AS status" +
            "FROM Members AS m1.Members AS m2.Messages WHERE m1.MemberId=Messages.MessageSender AND m2.MemberId=Messages.";
        DataSet ds = Connect.GetDataSet(strSql, "Messages");
        return ds;
    }
}