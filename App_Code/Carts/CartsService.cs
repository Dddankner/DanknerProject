using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for CartsService
/// </summary>
public class CartsService
{
    public CartsService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void AddCart(Carts c)
    {
        string strSql = "INSERT INTO Carts(MemberId, CartTime, CartPrice, MovieSeats, MovieSeatPrice, MovieId) " +
            "VALUES('" + c.MemberId + "', " + c.CartTime + ", " + c.CartPrice + ", '" + c.MovieSeats + "', " + c.MovieSeatPrice + "," +
            " " + c.MovieId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static void AddToCart(Carts c)
    {
        string strSql = "UPDATE Carts SET CartTime=" + c.CartTime + ", CartPrice=" + c.CartPrice + ", " +
            "MovieSeats='" + c.MovieSeats + "' WHERE MemberId=" + c.MemberId + " AND MovieId=" + c.MovieId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static List<int> GetSeatList(int memberID, int movieID)
    {
        string strSql = "SELECT MovieSeats FROM Carts WHERE MemberId=" + memberID + " AND MovieId=" + movieID;
        DataSet ds = Connect.GetDataSet(strSql, "Carts");
        string seats = ds.Tables[0].Rows[0]["MovieSeats"].ToString();
        string seatIn = "";
        List<int> arr = new List<int>();
        for (int i = 0; i < seats.Length; i++)
        {
            if (seats[i] != ',')
                seatIn += seats[i];
            else if(seats[i] == ',')
            {
                arr.Add(int.Parse(seatIn));
                seatIn = "";
            }
        }
        return arr;
    }
}