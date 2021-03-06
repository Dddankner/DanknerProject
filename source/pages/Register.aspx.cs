﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class Register : System.Web.UI.Page
{
    static int i = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //FillCBX();
            FillDBCities();
            DataSet ds = new DataSet();
            ds = CitiesServer.GetCityList();
            cities.DataSource = ds;
            cities.DataTextField = "CityName";
            cities.DataValueField = "CityId";
            cities.DataBind();
            cities.Items.Insert(0, new ListItem("-בחר עיר-"));
            string dateNow = DateTime.Today.ToShortDateString();
            //CheckDateValid.ValueToCompare = dateNow = DateTime.Now.AddYears(-15);
            Cal.EndDate = DateTime.Now.AddYears(-15);
            Cal.Enabled = true;

            txtDate.Attributes.Add("readonly", "true");
            //}
            //btnDate.Attributes.Add("style", "height:25px; width:25px");
        }
    }


    protected void btnSend_Click(object sender, EventArgs e)
    {
        string photoName = "";
        if (photoUpload.HasFile)
        {
            photoUpload.SaveAs(Server.MapPath("/MembersImg/" + photoUpload.FileName));
            photoName = photoUpload.FileName;
        }
        else
            photoName = "ferrarisym.jpg";
        Members m = new Members();
        //DateTime date1 = Date1();
        MembersServer ms = new MembersServer();
        m.memberFname = txtfName.Text.ToString();
        m.MemberLname = txtlName.Text.ToString();
        m.memberPass = txtPass.Text.ToString();
        m.cityId = int.Parse(cities.SelectedItem.Value.Trim());
        m.memberGender = rbtGender.SelectedItem.Text.ToString().Trim();
        //m.memberHobies = CheckHobbies();
        m.memberPic = photoName;
        //m.memberDate = date1;
        m.memberMail = txtMail.Text.ToString();
        if (ms.IsMailExist(m))
        {
            ms.Register(m);
            m.MemberId = MembersServer.GetMemberId(m.memberMail);
            Session["Member"] = m;
            Response.Redirect("../pages/Main.aspx");
        }
        else
        {
            lblEror.Text = "המייל כבר קיים במערכת";
        }

    }

    //public string CheckHobbies()
    //{
    //    string hob = "";
    //    for (int i = 0; i < cbxHobbies.Items.Count; i++)
    //    {
    //        if (cbxHobbies.Items[i].Selected)
    //        {
    //            if (hob == "")
    //                hob += cbxHobbies.Items[i].Text;
    //            else
    //                hob += "," + cbxHobbies.Items[i].Text;
    //        }
    //    }
    //    return hob;
    //}

    //    public DateTime Date1()
    //    {
    //        string s = txtDate.Text.ToString().Trim();
    //        //dd/mm/yyyy
    //        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
    //        int d = int.Parse(s.Substring(0, 2));
    //        int m = int.Parse(s.Substring(3, 2));
    //        int y = int.Parse(s.Substring(6));
    //        DateTime dt = new DateTime(y, m, d, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
    //        return dt;

    //    }
    public void FillCBX()
    {
        //DataSet ds = CategoriesService.GetCategories();
        //cbxCategories.DataSource = ds;
        //cbxCategories.DataTextField = "CategoryName";
        //cbxCategories.DataValueField = "CategoryId";
        //cbxCategories.DataBind();
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
    public void PrintMembers()
    {

    }
}


