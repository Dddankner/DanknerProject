using System;
using System.Collections.Generic;
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
        string strSql = "INSERT INTO Movies(MovieName, MovieSeatNum, MovieSeatPrice, MoviePic, CategoryId) " +
            "VALUES('" + m.MovieName + "', " + m.MovieSeatNum + ", " + m.MovieSeatPrice + ", '" + m.MoviePic + "', " + m.CategoryId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static void UpdateMovie(Movies m)
    {
        string strSql = "UPDATE Movies SET MovieName='" + m.MovieName + "', MovieSeatNum=" + m.MovieSeatNum + ", " +
            "MovieSeatPrice='" + m.MovieSeatPrice + "', MoviePic='" + m.MoviePic + "', CategoryId=" + m.CategoryId + " " +
            "WHERE MovieId=" + m.MovieId;
        Connect.InsertUpdateDelete(strSql);
    }
}