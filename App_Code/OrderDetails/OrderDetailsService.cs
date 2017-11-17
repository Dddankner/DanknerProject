using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

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

}