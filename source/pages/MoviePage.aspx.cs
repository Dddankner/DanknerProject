using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_MoviePage : System.Web.UI.Page
{
    Movies m = new Movies();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["movieID"] != null && Request.QueryString["movieID"].ToString() != "")
        {
            CreateM();
            if(!IsPostBack)
            {
                imgMovie.ImageUrl = m.MoviePic;
                tit.InnerText = m.MovieName;
            }
        }
        else
        {
            Response.Redirect("catalog.aspx");
        }
    }

    public void CreateM()
    {
        DataSet ds = MoviesService.GetMovieDS(int.Parse(Request.QueryString["movieID"].ToString()));
        m.MovieName = ds.Tables[0].Rows[0]["MovieName"].ToString();
        m.MoviePic = ds.Tables[0].Rows[0]["MoviePic"].ToString();
        m.MovieTrailer = ds.Tables[0].Rows[0]["MovieTrailer"].ToString();
        m.MovieDescription = ds.Tables[0].Rows[0]["MovieDescreption"].ToString();
    }
}