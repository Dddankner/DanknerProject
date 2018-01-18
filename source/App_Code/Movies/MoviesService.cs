using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MoviesService
/// </summary>
public class MoviesService
{
    public MoviesService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void AddMovie(Movies m)
    {
        string strSql = "INSERT INTO Movies(MovieName,  MovieSeatPrice, MoviePic, CategoryId, MovieTrailer, MovieDescription) " +
            "VALUES('" + m.MovieName + "', " + m.MovieSeatPrice + ", '" + m.MoviePic + "', " + m.CategoryId + ", '" + m.MovieTrailer.Trim() + "', '" + m.MovieDescription + "')";
        Connect.InsertUpdateDelete(strSql);
    }

    public static int GetIDByName(string name)
    {
        string strSql = "SELECT MovieId FROM Movies WHERE MovieName='" + name + "'";
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return int.Parse(ds.Tables[0].Rows[0]["MovieId"].ToString());
    }

    public static int GetSeatPrice(int movieID)
    {
        string strSql = "SELECT MovieSeatPrice FROM Movies Where MovieId=" + movieID;
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return int.Parse(ds.Tables[0].Rows[0]["MovieSeatPrice"].ToString());
    }

    public static DataSet GetMovieByPic(string pic)
    {
        string strSql = "SELECT * FROM Movie,Categories WHERE Categories.CategoryId=Movies.CategoryID AND" +
            "Movies.MoviePic=" + pic;
        return Connect.GetDataSet(strSql, "Movies");
    }

    public static string GetMoviePic(int id)
    {
        string strSql = "SELECT MoviePic FROM Movies WHERE MovieName=" + id;
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return ds.Tables[0].Rows[0]["MoviePic"].ToString();
    }

    public static DataSet GetMovies()
    {
        string strSql = "SELECT * FROM Movies,Categories WHERE Categories.CategoryId=Movies.CategoryId";
        return Connect.GetDataSet(strSql, "Movies");
    }

    public static string GetImageUrl(int id)
    {
        string strSql = "SELECT MoviePic FROM Movies WHERE MovieId=" + id;
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return ds.Tables[0].Rows[0]["MoviePic"].ToString();
    }

    public static DataSet GetMoviesByTheater(int theaterID)
    {
        string strSql = "SELECT * FROM Movies WHERE TheaterId=" + theaterID;
        return Connect.GetDataSet(strSql, "Movies");
    }

    public static int GetMaxID()
    {
        string strSql = "SELECT MAX(MovieId) FROM Movies";
        object obj = Connect.GetObject(strSql);
        return int.Parse(obj.ToString());
    }

    public static void UpdateMovie(Movies m)
    {
        string strSql = "UPDATE Movies SET MovieName='" + m.MovieName + "', " +
            "MovieSeatPrice='" + m.MovieSeatPrice + "', MoviePic='" + m.MoviePic + "', " +
            "CategoryId=" + m.CategoryId + ", MovieTrailer='" + m.MovieTrailer + "', " +
            "MovieDescreption='" + m.MovieDescription + "' " +
            "WHERE MovieId=" + m.MovieId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static string GetMovieByID(int ID)
    {
        string strSql = "SELECT MovieName FROM Movies WHERE MovieId=" + ID;
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return ds.Tables[0].Rows[0]["MovieName"].ToString();
    }

    public static DataSet GetMovieDS(int id)
    {
        string strSql = "SELECT * FROM Movies WHERE MovieId=" + id;
        DataSet ds = Connect.GetDataSet(strSql, "Movies");
        return ds;
    }

    //public static bool IsExist(int id)
    //{
    //    string strFind = "SELECT COUNT(MemberId) FROM Members WHERE MemberMail ='" + m.memberMail.Trim() + "'";
    //    object obj = Connect.GetObject(strFind);
    //    return int.Parse(obj.ToString()) < 1;
    //}
}