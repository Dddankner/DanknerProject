﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoriesService
/// </summary>
public class CategoriesService
{
    public CategoriesService()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static void AddCategory(Categories c)
    {
        string strSql = "INSERT INTO Categories(CategoryName) VALUES('" + c.CategoryName + "')";
        Connect.InsertUpdateDelete(strSql);
    }

    public static void UpdateCategory(Categories c)
    {
        string strSql = "UPDATE Categories SET CategoryName='" + c.CategoryName + "' WHERE CategoryId=" + c.CategoryId;
        Connect.InsertUpdateDelete(strSql);
    }

    public static int GetCategoryID(string name)
    {
        string strSql = "SELECT CategoryId FROM Categories WHERE CategoryName='" + name + "'";
        DataSet ds = Connect.GetDataSet(strSql, "Categories");
        return int.Parse(ds.Tables[0].Rows[0]["CategoryId"].ToString());
    }
    public static DataSet GetCategories()
    {
        string strSql = "SELECT * FROM Categories";
        return Connect.GetDataSet(strSql, "Categories");
    }

    public static bool IsExist(string name)
    {
        string strFind = "SELECT COUNT(CategoryId) FROM Categories WHERE CategoryName='" + name + "'";
        object obj = Connect.GetObject(strFind);
        return int.Parse(obj.ToString()) < 1;
    }
}