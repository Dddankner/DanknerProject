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

    public static void UpdateTheater(Theaters t)
    {
        string strSql = "UPDATE Theaters SET CityId=" + t.CityId + " WHERE TheaterId=" + t.TheaterId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetTheaters()
    {
        string strSql = "SELECT * FROM Theaters, Cities WHERE Theaters.CityId=Cities.CityId";
        return Connect.GetDataSet(strSql, "Theaters");
    }

    public static bool isExist(int cityId)
    {
        string strFind = "SELECT COUNT(TheaterId) FROM Theaters WHERE CityId=" + cityId + "";
        object obj = Connect.GetObject(strFind);
        return int.Parse(obj.ToString()) < 1;
    }
}