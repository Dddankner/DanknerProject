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
        string strSql = "INSERT INTO Movies(MovieName, MovieSeatNum, MovieSeatPrice, MoviePic, CategoryId, MovieTrailer) " +
            "VALUES('" + m.MovieName + "', " + m.MovieSeatNum + ", " + m.MovieSeatPrice + ", '" + m.MoviePic + "', " + m.CategoryId + ", '" + m.MovieTrailer + "')";
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetMovieByPic(string pic)
    {
        string strSql = "SELECT * FROM Movie,Categories WHERE Categories.CategoryId=Movies.CategoryID AND" +
            "Movies.MoviePic=" + pic;
        return Connect.GetDataSet(strSql, "Movies");
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

    public static void UpdateMovie(Movies m)
    {
        string strSql = "UPDATE Movies SET MovieName='" + m.MovieName + "', MovieSeatNum=" + m.MovieSeatNum + ", " +
            "MovieSeatPrice='" + m.MovieSeatPrice + "', MoviePic='" + m.MoviePic + "', CategoryId=" + m.CategoryId + " " +
            "WHERE MovieId=" + m.MovieId;
        Connect.InsertUpdateDelete(strSql);
    }
}