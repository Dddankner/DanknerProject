using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for Connect
/// </summary>
public class Connect
{
	public Connect()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static void InsertUpdateDelete(string strSql)
    {
        //בניית מחרוזת התחברות
        //נתיב יחסי
        string connection = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DataBase.accdb;Persist Security Info=True";

        //אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connection);

        //אובייקט ביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);

        con.Open();

        cmd.ExecuteNonQuery();

        con.Close();
    }


    /// <summary>
    /// 
    /// </summary>
    /// <param name="strSql"></param>
    /// <param name="tableName"></param>
    /// <returns></returns>
    public static DataSet GetDataSet(string strSql, string tableName)
    {
        //בניית מחרוזת התחברות
        //נתיב יחסי
        string connection = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DataBase.accdb;Persist Security Info=True";

        //אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connection);

        //אובייקט ביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);

        //בניית אובייקט כדי להציג נתונים בדפי אינטרנט
        DataSet ds = new DataSet();

        //בניית אובייקט מתווך מתאים
        OleDbDataAdapter adapter = new OleDbDataAdapter(cmd);

        //מילוי בנתונים
        adapter.Fill(ds, tableName);

        //dataset החזרת
        return ds;
    }

    public static object GetObject(string strSql)
    {
        //בניית מחרוזת התחברות
        //נתיב יחסי
        string connection = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=|DataDirectory|\DataBase.accdb;Persist Security Info=True";

        //אובייקט התחברות
        OleDbConnection con = new OleDbConnection(connection);

        //אובייקט ביצוע
        OleDbCommand cmd = new OleDbCommand(strSql, con);

        con.Open();

        object obj = cmd.ExecuteScalar();

        con.Close();

        return obj;
    }

}
