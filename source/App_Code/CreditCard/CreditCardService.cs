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
            "VALUES('" + cd.CreditCardNum + "', '" + cd.CreditCardCVV + "', '" + cd.CreditCardExpiery + "', " + cd.MemberId + ")";
        Connect.InsertUpdateDelete(strSql);
    }

    public static void UpdateCreditCard(CreditCard cd)
    {
        string strSql = "UPDATE CreditCard SET CreditCardNum='" + cd.CreditCardNum + "', CreditCardCVV='" + cd.CreditCardCVV + "', " +
            "CreditCardExpiery=" + cd.CreditCardExpiery + ", MemberId=" + cd.MemberId + " " +
            "Where CreditCardId=" + cd.MemberId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static DataSet GetCreditCardDetails(int id)
    {
        string strSql = "SELECT * FROM CreditCard WHERE CreditCardId=" + id;
        return Connect.GetDataSet(strSql, "CreditCard");
    }

    public static string GetCardNum(int id)
    {
        string strSql = "SELECT CreditCardNum FROM CreditCard WHERE MemberId=" + id;
        DataSet ds = Connect.GetDataSet(strSql, "Members");
        return ds.Tables[0].Rows[0]["CreditCardNum"].ToString();
    }

    public static int GetID(int ID)
    {
        string strSql = "SELECT CreditCardId FROM CreditCard WHERE MemberId=" + ID;
        DataSet ds = Connect.GetDataSet(strSql, "CreditCard");
        return int.Parse(ds.Tables[0].Rows[0]["CreditCardId"].ToString());
    }

    public static bool HaveCard(int ID)
    {
        string strSql = "SELECT COUNT(CreditCardId) FROM CreditCard WHERE MemberId=" + ID;
        object obj = Connect.GetObject(strSql);
        return int.Parse(obj.ToString()) > 0;
    }
}