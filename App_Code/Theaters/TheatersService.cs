using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TheatersService
/// </summary>
public class TheatersService
{
    public TheatersService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void CreateTheater(Theaters t)
    {
        string strSql = "INSERT INTO Theaters(CityId) VALUES(" + t.CityId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static string GetTheaterCity(int theaterID)
    {
        string strSql = "SELECT * FROM Theaters,Cities WHERE Theaters.TheaterId=" + theaterID + " " +
            "AND Theaters.CityId=Cities.CityId";
        DataSet ds = Connect.GetDataSet(strSql, "Cities");
        return ds.Tables[0].Rows[0]["CityName"].ToString();
    }

    public static DataSet GetTheaters()
    {
        string strSql = "SELECT * FROM Theaters, Cities WHERE Theaters.CityId=Cities.CityId";
        return Connect.GetDataSet(strSql, "Theaters");
    }
}