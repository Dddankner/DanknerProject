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
    public void InsertComment(int MemberID, int MovieID, string commentSubject, string commentContent, int commentRating, DateTime dt1)
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        int comID = GetLastId() + 1;
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.NewRow();
            dr["CommentID"] = comID;
            dr["MemberID"] = MemberID;
            dr["MovieID"] = MovieID;
            dr["CommentSubject"] = commentSubject;
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

    [WebMethod]
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

    [WebMethod]
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

    [WebMethod]
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

    [WebMethod]
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

    [WebMethod]
    public int GetRatinByMovieAndComment(int movieID, int commentID)
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
                if (int.Parse(dr["MovieID"].ToString()) != movieID && int.Parse(dr["MovieID"].ToString()) != commentID)
                {
                    dt.Rows.RemoveAt(i);
                }
            }
            stream.Close();
        }
        return int.Parse(ds.Tables[0].Rows[0]["CommentRating"].ToString());
    }

    [WebMethod]
    public string GetPow(int num1, int num2)
    {
        double res = Math.Pow(num1, num2);
        return res.ToString();
    }

    [WebMethod]
    public string GetMembers()
    {
        var path = HttpContext.Current.Server.MapPath("/App_Data/XMLComments.xml");
        DataSet ds = new DataSet();
        string tb = "<table>";
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                tb += "<tr><td>" + dt.Rows[i]["CommentRating"].ToString() + "</td><td>" + dt.Rows[i]["CommentID"].ToString() + "</td></tr>";
            }
        }
        tb += "</table>";
        return tb;
    }
}
