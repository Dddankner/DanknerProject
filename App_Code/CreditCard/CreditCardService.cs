using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CreditCardService
/// </summary>
public class CreditCardService
{
    public CreditCardService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void InsertCreditCard(CreditCard cd)
    {
        string strSql = "INSERT INTO CreditCard(CreditCardNum, CreditCardCVV, CreditCardExpiery, MemberId)" +
            "VALUES('" + cd.CreditCardNum + "', '" + cd.CreditCardCVV + "', " + cd.CreditCardExpiery + ", " + cd.MemberId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static void UpdateCreditCard(CreditCard cd, int id)
    {
        string strSql = "UPDATE CreditCard SET CreditCardNum='" + cd.CreditCardNum + "', CreditCardCVV='" + cd.CreditCardCVV + "', " +
            "CreditCardExpiery=" + cd.CreditCardExpiery + ", MemberId=" + cd.MemberId + " " +
            "Where CreditCardId=" + id;
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetCreditCardDetails(int id)
    {
        string strSql = "SELECT * FROM CreditCard WHERE CreditCardId=" + id;
        return Connect.GetDataSet(strSql, "CreditCard");
    }
}