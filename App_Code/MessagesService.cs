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
        string strSql = "INSERT INTO Messages(MassegeSender, MessageReciver, MassageStatus, MessageSentTime, MessageContent, MessageSubject)";
        strSql += "VALUES(" + m.MessageSender + ", " + m.MessageReciver + ", " + m.MessageStatus + ", " + m.MessageSentTime + ", '" + m.MessageContent + "', '" + m.MessageSubject + "')";
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetMessages()
    {
        string strSql = "SELECT Messages.MessageId AS Code,Message";
        DataSet ds = new DataSet();
        return ds;
    }
}