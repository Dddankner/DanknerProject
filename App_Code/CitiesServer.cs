using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for CitiesServer
/// </summary>
public class CitiesServer
{
	public CitiesServer()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static DataSet GetCityList()
    {
        string strSql = "SELECT * FROM Cities";
        DataSet ds = new DataSet();
        ds = Connect.GetDataSet(strSql, "Cities");
        return ds;
    }
}