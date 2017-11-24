using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_MovieAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataSet ds = TheatersService.GetTheaters();
            ddlCity.DataSource = ds;
            ddlCity.DataValueField = "TheaterId";
            ddlCity.DataTextField = "CityName";
            ddlCity.DataBind();
            FillDBCities();
            DataSet ds1 = CitiesServer.GetCityList();
            ddlAllCities.DataSource = ds1;
            ddlAllCities.DataValueField = "CityId";
            ddlAllCities.DataTextField = "CityName";
            ddlAllCities.DataBind();
            DataSet ds2 = CategoriesService.GetCategories();
            ddlCategory.DataSource = ds2;
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataTextField = "categoryName";
            ddlCategory.DataBind();
        }
        
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {

    }

    protected void btnAddTheater_Click(object sender, EventArgs e)
    {
        Theaters t = new Theaters();
        t.CityId = int.Parse(ddlAllCities.SelectedItem.Value);
        TheatersService.CreateTheater(t);
        DataSet ds = TheatersService.GetTheaters();
        ddlCity.DataSource = ds;
        ddlCity.DataValueField = "TheaterId";
        ddlCity.DataTextField = "CityName";
        ddlCity.DataBind();
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

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        Categories c = new Categories();
        c.CategoryName = txtCategoryName.Text.ToString();
        CategoriesService.AddCategory(c);
        DataSet ds2 = CategoriesService.GetCategories();
        ddlCategory.DataSource = ds2;
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataTextField = "categoryName";
        ddlCategory.DataBind();
    }
}