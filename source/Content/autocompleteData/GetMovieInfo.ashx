<%@ WebHandler Language="C#" Class="GetMovieInfo" %>

using System;
using System.Web;
using System.Data;
using System.Web.Script.Serialization;

public class GetMovieInfo : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
            DataSet ds = MoviesService.GetMovieDS(4);
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}