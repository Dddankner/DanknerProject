<%@ WebHandler Language="C#" Class="GetMovieInfo" %>

using System;
using System.Web;
using System.Data;
using System.Web.Script.Serialization;

public class GetMovieInfo : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        DataSet ds = MoviesService.GetMovieDS(int.Parse(context.Request.QueryString["movieID"].ToString()));
        Movies m = new Movies();
        m.MovieDescription = ds.Tables[0].Rows[0]["MovieDescreption"].ToString();
        m.MovieName = ds.Tables[0].Rows[0]["MovieName"].ToString();
        m.MovieId = int.Parse(ds.Tables[0].Rows[0]["MovieId"].ToString());
        m.MoviePic = ds.Tables[0].Rows[0]["MoviePic"].ToString();
        m.MovieTrailer = ds.Tables[0].Rows[0]["MovieTrailer"].ToString();
        m.CategoryId = int.Parse(ds.Tables[0].Rows[0]["CategoryId"].ToString());
        m.MovieSeatPrice = int.Parse(ds.Tables[0].Rows[0]["MovieSeatPrice"].ToString());
        JavaScriptSerializer js = new JavaScriptSerializer();
        context.Response.Write(js.Serialize(m));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}