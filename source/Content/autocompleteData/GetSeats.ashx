<%@ WebHandler Language="C#" Class="GetSeats" %>

using System;
using System.Web;
using System.Data;
using System.Web.Script.Serialization;

public class GetSeats : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}