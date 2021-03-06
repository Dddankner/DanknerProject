﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Text.RegularExpressions;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Threading;

public partial class pages_MoviePage : System.Web.UI.Page
{
    public Movies m = new Movies();
    public int rating = 0;
    public WebService.WebService wsPublic;
    public string movieID = "";
    public int memberID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["movieID"] != null && Request.QueryString["movieID"].ToString() != "")
        {
            wsPublic = new WebService.WebService();
            if (Regex.IsMatch(Request.QueryString["movieID"].ToString(), @"^\d+$"))
            {
                movieID = Request.QueryString["movieID"].ToString();
                if (Session["Member"] != null && Session["Member"].ToString() != "")
                    memberID = ((Members)Session["Member"]).MemberId;
            }
            else
            {
                movieID = MoviesService.GetIDByName(Request.QueryString["movieID"].ToString()).ToString();
                if (Session["Member"] != null && Session["Member"].ToString() != "")
                    memberID = ((Members)Session["Member"]).MemberId;
            }
            if (!IsPostBack)
            {
                FillDataList();
            }
        }
        else
        {
            Response.Redirect("/pages/catalog.aspx");
        }
    }


    public void CreateM()
    {
        //DataSet ds = MoviesService.GetMovieDS(int.Parse(Request.QueryString["movieID"].ToString()));
        //m.MovieName = ds.Tables[0].Rows[0]["MovieName"].ToString();
        //m.MoviePic = ds.Tables[0].Rows[0]["MoviePic"].ToString();
        //m.MovieTrailer = ds.Tables[0].Rows[0]["MovieTrailer"].ToString();
        //m.MovieDescription = ds.Tables[0].Rows[0]["MovieDescreption"].ToString();
    }

    public void FillDataList()
    {
        WebService.WebService ws = new WebService.WebService();
        if (ws.IsExist(int.Parse(movieID)))
        {
            DataSet ds = ws.GetCommentsByMovieId(int.Parse(movieID));
            dlComments.DataSource = ds;
            dlComments.DataBind();
        }
        else
            noComments.InnerHtml = "אין תגובות";
    }

    protected void btnAddComment_Click(object sender, EventArgs e)
    {
        int movieID1 = int.Parse(movieID);
        int memberID = ((Members)Session["Member"]).MemberId;
        string sub = txtCommentSubject.Text;
        string content = txtCommentContent.Text;
        int rating = int.Parse(txtRate.Text);
        DateTime dt = DateTime.Now;
        WebService.WebService ws = new WebService.WebService();
        //ws.InsertComment(memberID, movieID, sub, content, rating, dt);
        ws.InsertComment(memberID, movieID1, sub, content, rating, dt);
        FillDataList();
    }

    public int GetRating(int commentID)
    {
        WebService.WebService ws = new WebService.WebService();
        //return ws.GetRatinByMovieAndComment(int.Parse(movieID), commentID);
        return 0;
    }

    protected void dlComments_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int rowIndex = int.Parse(e.Item.ItemIndex.ToString());
        int commentID = int.Parse(dlComments.DataKeys[rowIndex].ToString());
        int rating = GetRating(commentID);
        //((Panel)dlComments.FindControl("starDiv")).ToolTip = rating.ToString();
        //((Panel)dlComments.FindControl("starDiv")).Load += Pages_MoviePage_Load1;
    }

    private void Pages_MoviePage_Load1(object sender, EventArgs e)
    {
        //int rating = int.Parse(((Panel)sender).ToolTip);
        //Page.ClientScript.RegisterStartupScript(GetType(), "setStars", "changeselet('" + rating + "')");
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetName(int id)
    {
        DataSet ds = MoviesService.GetMovieDS(id);
        Thread.Sleep(50);
        int categoryID = int.Parse(ds.Tables[0].Rows[0]["CategoryId"].ToString());
        JavaScriptSerializer js = new JavaScriptSerializer();
        string name1 = CategoriesService.GetNameById(categoryID).ToString().Trim();
        return js.Serialize(name1);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetCommentDetails(int movieID, int memberID)
    {
        WebService.WebService ws = new WebService.WebService();
        WebService.wsComments ws_C = ws.GetCommentForMember(movieID, memberID);
        JavaScriptSerializer js = new JavaScriptSerializer();
        return js.Serialize(ws_C);
    }

    protected void btnUpdateComment_Click(object sender, EventArgs e)
    {
        WebService.wsComments ws_C = new WebService.wsComments();
        ws_C.commentContent = txtCommentContentUp.Text;
        ws_C.commentRating = int.Parse(txtRateUp.Text);
        ws_C.commentSubject = txtCommentSubjectUp.Text;
        ws_C.MemberID = ((Members)Session["Member"]).MemberId;
        ws_C.movieID = int.Parse(movieID);
        wsPublic.UpdateComment(ws_C);
    }

    protected void btnDeleteComment_Click(object sender, EventArgs e)
    {
        wsPublic.DeleteComment(int.Parse(movieID), ((Members)Session["Member"]).MemberId);
    }
}