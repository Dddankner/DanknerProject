using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.OleDb;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class masterTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //FillDBCities();
            //DataSet ds = new DataSet();
            //ds = CitiesServer.GetCityList();
            //cities.DataSource = ds;
            //cities.DataTextField = "CityName";
            //cities.DataValueField = "CityId";
            //cities.DataBind();
        }
    }
    public void FillDBCities()
    {
        IsraelCities.WebServiceCities myCities = new IsraelCities.WebServiceCities();
        DataSet dsWS = myCities.GetAllCitiesFromIsrael();
        string connection = Connect.GetConnectionString();
        string strSearch = "SELECT * FROM Cities ORDER BY CityName";
        DataSet dsDB = Connect.GetDataSet(strSearch, "Cities");
        DataTable dtDB = dsDB.Tables[0];
        OleDbConnection con = new OleDbConnection(connection);
        con.Open();
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Cities(CityName) VALUES(@CityName)";
        cmd.Parameters.Add("@CityName", OleDbType.VarWChar, 255);
        OleDbTransaction trans = con.BeginTransaction();
        cmd.Transaction = trans;
        for (int i = 0; i < dsWS.Tables[0].Rows.Count; i++)
        {
            string CityName = dsWS.Tables[0].Rows[i]["Heb"].ToString();
            CityName.Replace(")", "");
            CityName.Replace("(", "");
            bool exist = dtDB.AsEnumerable().Where(c => c.Field<string>("CityName").Equals(CityName)).Count() > 0;
            if (!exist)
            {
                cmd.Parameters[0].Value = CityName;
                cmd.ExecuteNonQuery();
            }
        }
        trans.Commit();
        con.Close();
    }
}