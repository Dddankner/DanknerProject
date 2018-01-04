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
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Orders.MemberId=" + memberID + " " +
            "ORDER BY Orders.OrderTime DESC";
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet Getrder(int memberID, int orderID)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND OrderDetails.OrderId=" + orderID + " " +
            "AND Orders.MemberId=" + memberID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet GetOrderManager(int orderID)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND OrderDetails.OrderId=" + orderID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet GetAll()
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "ORDER BY Orders.OrderTime DESC";
            DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
            return ds;
        
    }

    public static DataSet SearchByName(int memberID, string movieName)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Movies.MovieName='" + movieName + "'" +
            "AND Orders.MemberId=" + memberID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet SearchByNameManager( string movieName)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Movies.MovieName='" + movieName + "'";
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet SearchByDate(int memberID, DateTime e, DateTime s)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Orders.OrderTime>#" + s + "# AND Orders.OrderTime<#" + e + "# " +
            "AND Orders.MemberId=" + memberID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        return ds;
    }

    public static DataSet SearchByDateManager(DateTime e, DateTime s)
    {
        string strSql = "SELECT OrderDetails.OrderId, OrderDetails.MovieSeatsAmount, OrderDetails.MovieSeats, " +
            "Orders.OrderPrice, Orders.OrderTime, Cities.CityName, Movies.MovieName " +
            "FROM OrderDetails, Orders, Movies, Theaters, Cities " +
            "WHERE OrderDetails.OrderId=Orders.OrderId " +
            "AND OrderDetails.MovieId=Movies.MovieId " +
            "AND OrderDetails.TheaterId=Theaters.TheaterId " +
            "AND Theaters.CityId=Cities.CityId " +
            "AND Orders.OrderTime>#" + s + "# AND Orders.OrderTime<#" + e + "# ";
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