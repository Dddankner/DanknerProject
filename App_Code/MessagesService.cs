using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
        string strSql = "INSERT INTO Messages(MessageSender, MessageReciver, MessageStatus, MesageSentTime, MessageContent)";
        strSql += "VALUES('" + m.MessageSender + "', '" + m.MessageReciver + "', " + m.MessageStatus + ", " + m.MessageSentTime + ", '" + m.MessageContent + "')";
        Connect.InsertUpdateDelete(strSql);
    }
}