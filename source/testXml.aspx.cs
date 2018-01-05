using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;
using System.IO;

public partial class testXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGrd();
        }
        string path = MapPath("/App_Data/XMLTest.xml");
        var stream = new FileStream(path, FileMode.Open);
        stream.Close();
    }

    public void FillGrd()
    {
        string path = MapPath("/App_Data/XMLTest.xml");
        using (var stream = new FileStream(path, FileMode.Open))
        {
            DataSet ds = new DataSet();
            ds.ReadXml(stream, XmlReadMode.Auto);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            stream.Close();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        var path = MapPath("/App_Data/XMLTest.xml");
        DataSet ds = new DataSet();
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.ReadXml(stream, XmlReadMode.Auto);
            DataTable dt = ds.Tables[0];
            DataRow dr = dt.NewRow();
            dr["name"] = txtName.Text;
            dr["pass"] = txtPass.Text;
            dr["admin"] = txtManager.Text;
            dt.Rows.Add(dr);
            stream.Close();
        }
        using (var stream = new FileStream(path, FileMode.Open))
        {
            ds.WriteXml(stream, XmlWriteMode.IgnoreSchema);
            stream.Close();
            FillGrd();
        }
    }
}