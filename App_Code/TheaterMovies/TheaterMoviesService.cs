using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for TheaterMoviesService
/// </summary>
public class TheaterMoviesService
{
    public TheaterMoviesService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void SetMovieToTheater(TheaterMovies tm)
    {
        string strSql = "INSERT INTO TheaterMovies(theaterId, MovieId) VALUES(" + tm.TheaterId + ", " + tm.MovieId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetMoviesInTheater(int id)
    {
        string strSql = "SELECT TheaterId, MovieName FROM TheaterMovies,Movies WHERE TheaterMovies.TheaterId=" + id + " " +
            "AND TheaterMovies.MovieId=Movies.MovieId";
        return Connect.GetDataSet(strSql, "TheaterMovies");
    }
}