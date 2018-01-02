using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

public partial class testXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillGrd();
    }

    public void FillGrd()
    {
        DataSet ds = new DataSet();
        XmlReader xmlFile = XmlReader.Create(MapPath("/App_Data/XMLTest.xml"));
        ds.ReadXml(xmlFile);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        ds.ReadXml(Server.MapPath("/App_Data/XMLTest.xml"));
        DataTable dt = ds.Tables[0];
        DataRow dr = dt.NewRow();
        dr["name"] = txtName.Text;
        dr["pass"] = txtPass.Text;
        dr["admin"] = txtManager.Text;
        dt.Rows.Add(dr);
        ds.WriteXml(Server.MapPath("/App_Data/XMLTest.xml"));
    }
}