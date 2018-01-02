using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CreditCard
/// </summary>
public class CreditCard
{
    public int CreditCardId { get; set; }
    public string CreditCardNum { get; set; }
    public string CreditCardCVV { get; set; }
    public DateTime CreditCardExpiery { get; set; }
    public int MemberId { get; set; }
    public CreditCard()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}