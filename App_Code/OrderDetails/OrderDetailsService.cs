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
        string strSql = "INSERT INTO OrderDetails(MovieId, OrderId, MovieSeatPrice, MovieSeats, MovieSeatsAmount) " +
            "VALUES(" + od.MovieId + ", " + od.OrderId + ", " + od.MovieSeatPrice + ", '" + od.MovieSeats + "', " + od.MovieSeatAmount + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static List<int> GetSeatsTaken(int movieID, int theaterID)
    {
        string strSql = "SELECT MovieSeats FROM OrderDetails WHERE MovieId=" + movieID + " AND TheaterId=" + theaterID;
        DataSet ds = Connect.GetDataSet(strSql, "OrderDetails");
        string seats = "";
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            seats += ds.Tables[0].Rows[0]["MovieSeats"].ToString() + ",";
        }
        List<int> seatsList = new List<int>();
        string current = "";
        for (int i = 0; i < seats.Length; i++)
        {
            if(seats[i] != ',')
            {
                current += seats[i];
            }
            else
            {
                seatsList.Add(int.Parse(current));
                current = "";
            }
        }
        return seatsList;
    }

}