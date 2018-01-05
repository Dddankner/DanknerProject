using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.IO;
using System.Data;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public void InsertComment(int MemberID, int MovieID, string commentContent, int commentRating, DateTime dt1)
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.NewRow();
            dr["CommentID"] = GetLastId() + 1;
            dr["MemberID"] = MemberID;
            dr["MovieID"] = MovieID;
            dr["CommentContent"] = commentContent;
            dr["CommentRating"] = commentRating;
            dr["CommentDate"] = dt1;
            dt.Rows.Add(dr);
            stream.Close();
        }
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.WriteXml(stream, XmlWriteMode.IgnoreSchema);
            stream.Close();
        }
    }

    public DataSet GetCommentsByMovieId(int movieID)
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (int.Parse(dr["MovieID"].ToString()) != movieID)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
            stream.Close();
        }
        return ds;
    }

    public double GetAvgRating(int movieID)
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        int count = 0, sum = 0;
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (int.Parse(dr["MovieID"].ToString()) == movieID)
                {
                    sum += int.Parse(dr["CommentRating"].ToString());
                    count++;
                }
            }
            stream.Close();
        }
        return (double)sum / count;
    }

    public DataSet GetAllMyComments(int memberID)
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = dt.Rows[i];
                if (int.Parse(dr["MemberID"].ToString()) != memberID)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
        }
        return ds;
    }

    public int GetLastId()
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        int lID = 0;
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.Rows[dt.Rows.Count - 1];
            lID = int.Parse(dr["CommentID"].ToString());
        }
        return lID;
    }
}
