using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderDetails
/// </summary>
public class OrderDetails
{
    public int MovieId { get; set; }
    public int OrderId { get; set; }
    public int MovieSeatPrice { get; set; }
    public string MovieSeats { get; set; }
    public int MovieSeatAmount { get; set; }
    public OrderDetails()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}