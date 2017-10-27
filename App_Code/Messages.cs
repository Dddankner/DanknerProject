using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Messages
/// </summary>
public class Messages
{
    public int MessageSender { get; set; }
    public int MessageReciver { get; set; }
    public bool MessageStatus { get; set; }
    public int MessageDeletedBy { get; set; }
    public DateTime MessageSentTime { get; set; }
    public string MessageContent { get; set; }
	public Messages()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}