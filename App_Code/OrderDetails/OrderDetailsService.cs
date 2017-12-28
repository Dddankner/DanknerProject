using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Data.OleDb;

/// <summary>
/// Summary description for OrderDetailsService
/// </summary>
public class OrderDetailsService
{
    public OrderDetailsService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void SetOrderDetails(OrderDetails od)
    {
        string strSql = "INSERT INTO OrderDetails(MovieId, OrderId, MovieSeatPrice, MovieSeats, MovieSeatsAmount, TheaterId) " +
            "VALUES(" + od.MovieId + ", " + od.OrderId + ", " + od.MovieSeatPrice + ", '" + od.MovieSeats + "', " +
            "" + od.MovieSeatAmount + ", " + od.TheaterId + ")";
        Connect.InsertUpdateDelete(strSql);
        //HttpContext.Current.Response.Write(strSql);
    }

    public static DataSet GetAll(int memberID)
    {
        string strSql = "SELECT * " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Orders.MemberId=" + memberID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static List<string> GetSeatsTaken(int movieID, int theaterID)
    {
        string strSql = "SELECT * FROM OrderDetails WHERE MovieId=" + movieID + " " +
            "AND TheaterId=" + theaterID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        string seats = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            seats = seats + "*" + ds.Tables[0].Rows[i]["MovieSeats"].ToString();
        }
        List<string> seatsList = new List<string>();
        string current = "";
        for (int i = 0; i < seats.Length; i++)
        {
            if(seats[i] != '*')
            {
                current += seats[i];
            }
            else
            {
                if(current != "")
                {
                    seatsList.Add(current);
                }
                current = "";
            }
        }
        return seatsList;
    }

}