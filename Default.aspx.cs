using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IsraelCities.WebServiceCities cit = new IsraelCities.WebServiceCities();
        DataSet ds = cit.GetAllCitiesFromIsrael();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        stam.WebServiceGeneral st = new stam.WebServiceGeneral();
        string date = TextBox1.Text;
        string result = st.GetAgeByDate(date);
        TextBox2.Text = result;
    }
}