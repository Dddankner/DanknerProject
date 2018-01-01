using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

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
        string strSql = "INSERT INTO TheaterMovies(theaterId, MovieId, TheaterMovieSeatNum) VALUES(" + tm.TheaterId + ", " + tm.MovieId + "," + tm.TheaterMovieSeatNum + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static int GetSeatNum(int theaID, int movieID)
    {
        string strSql = "SELECT * FROM TheaterMovies WHERE TheaterId=" + theaID + " " +
            "AND MovieId=" + movieID;
        return int.Parse(Connect.GetDataSet(strSql, "TheaterMovies").Tables[0].Rows[0]["TheaterMovieSeatNum"].ToString());
    }

    public static DataSet GetTheatersForMovie(int movieID)
    {
        string strSql = "SELECT TheaterMovies.TheaterId, Cities.CityName FROM TheaterMovies,Theaters,Cities WHERE" +
            " TheaterMovies.TheaterId=Theaters.TheaterId AND" +
            " Theaters.CityId=Cities.CityId AND" +
            " TheaterMovies.MovieId=" + movieID;
        return Connect.GetDataSet(strSql, "TheaterMovies");
    }

    public static DataSet GetMoviesInTheater(int id)
    {
        string strSql = "SELECT TheaterId, MovieName FROM TheaterMovies,Movies WHERE TheaterMovies.TheaterId=" + id + " " +
            "AND TheaterMovies.MovieId=Movies.MovieId";
        return Connect.GetDataSet(strSql, "TheaterMovies");
    }
    public static void AddList(List<TheaterMovies> tms)
    {
        DataTable messages = new DataTable();
        messages.Columns.Add("MovieId");
        messages.Columns.Add("TheaterId");
        messages.Columns.Add("TheaterMovieSeatNum");

        for (int i = 0; i < tms.Count; i++)
        {
            DataRow dr = messages.NewRow();
            dr["MovieId"] = tms[i].MovieId;
            dr["TheaterId"] = tms[i].TheaterId;
            dr["TheaterMovieSeatNum"] = tms[i].TheaterMovieSeatNum;
            messages.Rows.Add(dr);
        }
        InsertAllMessages(messages);
    }

    private static void InsertAllMessages(DataTable dt)
    {
        OleDbConnection con = new OleDbConnection(Connect.GetConnectionString());

        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO TheaterMovies(MovieId, TheaterId, TheaterMovieSeatNum) " +
                "VALUES " +
            "(@MovieId, @TheaterId, @TheaterMovieSeatNum)";
        cmd.Parameters.Add("@MovieId", OleDbType.Integer);
        cmd.Parameters.Add("@TheaterId", OleDbType.Integer);
        cmd.Parameters.Add("@TheaterMovieSeatNum", OleDbType.Integer);
        con.Open();
        cmd.Prepare();

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            cmd.Parameters[0].Value = int.Parse(dt.Rows[i]["MovieId"].ToString());
            cmd.Parameters[1].Value = int.Parse(dt.Rows[i]["TheaterId"].ToString());
            cmd.Parameters[2].Value = int.Parse(dt.Rows[i]["TheaterMovieSeatNum"].ToString());
            cmd.ExecuteNonQuery();
        }

        OleDbTransaction trance = con.BeginTransaction();
        cmd.Transaction = trance;
        trance.Commit();
        con.Close();
    }

    public static void UpdateTheaterMovie(TheaterMovies tm)
    {
        string strSql = "UPDATE TheaterMovies SET TheaterMovieSeatNum=" + tm.TheaterMovieSeatNum + "," +
            " MovieId=" + tm.MovieId + ", TheaterId=" + tm.TheaterId + " " +
            "WHERE MovieId=" + tm.MovieId + " AND TheaterId=" + tm.TheaterId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static bool IsExist(int theaID, int movieID)
    {
        string strSql = "SELECT COUNT(MovieId) FROM TheaterMovies WHERE TheaterId=" + theaID + " " +
            "AND MovieId=" + movieID;
        object obj = Connect.GetObject(strSql);
        return int.Parse(obj.ToString()) > 0;
    }
}