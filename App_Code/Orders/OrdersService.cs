using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;

/// <summary>
/// Summary description for OrdersService
/// </summary>
public class OrdersService
{
    public OrdersService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void CreateOrder(Orders o)
    {
        string strSql = "INSERT INTO Orders(MemberId, OrderTime, OrderPrice, CreditCardId)" +
            "VALUES(" + o.MemberId + ", " + o.OrderTime + ", " + o.OrderPrice + ", " + o.CreditCardId + ")";
        Connect.InsertUpdateDelete(strSql);
    }
}