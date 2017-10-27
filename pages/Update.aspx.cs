using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_Update : System.Web.UI.Page
{
    public static Members origin;
    public static int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {       
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        { 
            id = int.Parse(Request.QueryString["id"].ToString());
            if (!IsPostBack)
                fill(id);            
            btnDate.Attributes.Add("style", "height:25px; width:25px");
            FillDBCities();
            DataSet ds = new DataSet();
            ds = CitiesServer.GetCityList();
            cities.DataSource = ds;
            cities.DataTextField = "CityName";
            cities.DataValueField = "CityId";
            cities.DataBind();
            Cal.EndDate = DateTime.Now.AddYears(-15);
            txtDate.Attributes.Add("readonly", "true");
            //cities.Items.Insert(0, new ListItem("-בחר עיר-"));
        }
        else
            Response.Write("אין לך גישה לדף זה");
    }
    public void fill(int id)
    {
        MembersServer ms = new MembersServer();
        DataSet ds = MembersServer.ShowMemberById(id);
        Members m = CreateMember(ds);
        origin = m;
        m.MemberId = id;
        txtfName.Text = m.memberFname.ToString().Trim();
        txtlName.Text = m.MemberLname.ToString().Trim();
        txtMail.Text = m.memberMail.ToString().Trim();
        txtPass.Text = m.memberPass.ToString().Trim();
        txtPass.Attributes.Add("value", m.memberPass.ToString().Trim());
        txtRePass.Attributes.Add("value", m.memberPass.ToString().Trim());
        txtRePass.Text = m.memberPass.ToString().Trim();
        Cal.SelectedDate = ((DateTime)m.memberDate).Date;
        //txtDate.Text = m.memberDate.ToShortDateString().Trim();
        if (rbtGender.Items[0].Text == m.memberGender.ToString().Trim())
            rbtGender.Items[0].Selected = true;
        else
            rbtGender.Items[1].Selected = true;
        string[] hobbies = HobbiesFill(id);
        for (int i = 0; i < cbxHobbies.Items.Count; i++)
        {
            for (int j = 0; j < hobbies.Length; j++)
            {
                if(cbxHobbies.Items[i].Text == hobbies[j])
                {
                    cbxHobbies.Items[i].Selected = true;
                }
            }
        }
        //string cityName = ds.Tables["Cities"].Rows[0]["CityName"].ToString();
        //((Image)r1.FindControl("MemberImage")).ImageUrl = "../MembersImg/" + pic + "";
        //photoUpload.FileName = "../MembersImg/" + m.memberPic + "";
        //for (int i = 0; i < cities.Items.Count; i++)
        //{
        //    if (int.Parse(cities.Items[i].Value.ToString()) == m.cityId)
        //    {
        //        //cities.SelectedItem.Value = m.cityId.ToString();
        //        cities.Items[i].Selected = true;
        //    }
        //}
        cities.SelectedIndex = m.cityId - 1;
        lblEror.Text = m.cityId.ToString();
    }

    public string[] HobbiesFill(int id)
    {
        string[] hobbies = new string[cbxHobbies.Items.Count];
        for (int i = 0; i < hobbies.Length; i++)
        {
            hobbies[i] = "";
        }
        MembersServer ms = new MembersServer();
        DataSet ds = MembersServer.ShowMemberById(id);
        Members m = CreateMember(ds);
        string hobbie = m.memberHobies;
        string hobbieCount = "";
        int j = 0, comaCount = 0;
        for (int i = 0; i < hobbie.Length; i++)
        {
            if (hobbie[i] != ',')
                hobbieCount += hobbie[i];
            else
            {
                hobbies[j] = hobbieCount;
                j++;
                comaCount++;
                hobbieCount = "";
            }
        }
        hobbies[j] = hobbieCount;
        if (comaCount == 0)
            hobbies[j] = hobbie;
        return hobbies;
    }

    public Members CreateMember(DataSet ds)
    {
        Members m = new Members();
        m.memberFname = ds.Tables["Members"].Rows[0]["MemberFname"].ToString();
        m.MemberLname = ds.Tables["Members"].Rows[0]["MemberLname"].ToString();
        m.memberMail = ds.Tables["Members"].Rows[0]["MemberMail"].ToString();
        m.memberGender = ds.Tables["Members"].Rows[0]["MemberGender"].ToString();
        m.memberHobies = ds.Tables["Members"].Rows[0]["MemberHobbies"].ToString();
        m.memberDate = DateTime.Parse(ds.Tables["Members"].Rows[0]["memberDate"].ToString()); 
        m.memberPass = ds.Tables["Members"].Rows[0]["MemberPass"].ToString();
        m.memberPic = ds.Tables["Members"].Rows[0]["MemberPic"].ToString();
        m.cityId = int.Parse(ds.Tables["Members"].Rows[0]["Members.CityId"].ToString());
        m.memberManager = bool.Parse(ds.Tables["Members"].Rows[0]["MemberManager"].ToString());
        return m;
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        DateTime date1 = Date1(txtDate.Text.ToString().Trim());
        Members m = new Members();
        m.memberFname = txtfName.Text;
        m.MemberLname = txtlName.Text;
        m.memberPass = txtPass.Text;
        m.cityId = int.Parse(cities.SelectedItem.Value.Trim());
        m.memberGender = rbtGender.SelectedItem.Text.ToString().Trim();
        m.memberHobies = CheckHobbies();
        //m.memberPic = photoName;
        m.memberDate = date1;
        m.memberMail = txtMail.Text;
        MembersServer ms = new MembersServer();
        if (ms.IsMailExist(m))
        {
            if (photoUpload.HasFile)
            {
                photoUpload.SaveAs(Server.MapPath("../MembersImg/" + photoUpload.FileName));
                m.memberPic = photoUpload.FileName;
            }
            else
                m.memberPic = origin.memberPic;
            ms.UpdatePic(m);
            Session["Member"] = m;
            Response.Redirect("../pages/ShowUsers.aspx");
        }
        else
            lblEror.Text = "המייל קיים במערכת";
    }

    public string CheckHobbies()
    {
        string hob = "";
        for (int i = 0; i < cbxHobbies.Items.Count; i++)
        {
            if (cbxHobbies.Items[i].Selected)
            {
                if (hob == "")
                    hob += cbxHobbies.Items[i].Text;
                else
                    hob += "," + cbxHobbies.Items[i].Text;
            }
        }
        return hob;
    }

    public DateTime Date1(string s)
    {
        //dd/mm/yyyy
        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
        int d = int.Parse(s.Substring(0, 2));
        int m = int.Parse(s.Substring(3, 2));
        int y = int.Parse(s.Substring(6));
        DateTime dt = new DateTime(y, m, d, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        return dt;
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

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Response.Redirect("../pages/ShowUsers.aspx");
    }
}