using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Carts
/// </summary>
public class Carts
{
    public int CartId { get; set; }
    public int MemberId { get; set; }
    public DateTime CartTime { get; set; }
    public int CartPrice { get; set; }
    public string MovieSeats { get; set; }
    public int MovieSeatPrice { get; set; }
    public int MovieId { get; set; }

    public Carts()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}