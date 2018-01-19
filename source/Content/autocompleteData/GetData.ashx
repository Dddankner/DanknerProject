<%@ WebHandler Language="C#" Class="GetData" %>

using System;
using System.Web;
using System.Data;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class GetData : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DataSet ds = MoviesService.GetMovies();
        var json = "{";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            json+= "\"" + ds.Tables[0].Rows[i]["MovieName"].ToString() + "\": null,";
        }
        json = json.Substring(0, json.Length - 1) + "}";
        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(json));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}