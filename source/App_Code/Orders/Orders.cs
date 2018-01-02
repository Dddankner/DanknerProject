using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Orders
/// </summary>
public class Orders
{
    public int OrderId { get; set; }
    public int MemberId { get; set; }
    public DateTime OrderTime { get; set; }
    public double OrderPrice { get; set; }
    public int CreditCardId { get; set; }

    public Orders()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}