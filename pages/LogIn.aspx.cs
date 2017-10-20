using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LogInBtn_Click(object sender, EventArgs e)
    {
        Members m = new Members();
        MembersServer ms = new MembersServer();
        m.memberMail = Mail.Text.ToString();
        m.memberPass = Pass.Text.ToString();
        if(!ms.IsMailExist(m))
        {
            if(!ms.Login(m))
            {                
                string strSql = "SELECT * FROM Members WHERE MemberMail='" + m.memberMail.Trim() + "'";
                DataSet ds = new DataSet();
                ds = Connect.GetDataSet(strSql, "Members");
                m.memberFname = ds.Tables["Members"].Rows[0]["MemberFname"].ToString();
                m.MemberLname = ds.Tables["Members"].Rows[0]["MemberLname"].ToString();
                m.memberMail = ds.Tables["Members"].Rows[0]["MemberMail"].ToString();
                m.memberGender = ds.Tables["Members"].Rows[0]["MemberGender"].ToString();
                m.memberHobies = ds.Tables["Members"].Rows[0]["MemberHobbies"].ToString();
                m.memberPass = ds.Tables["Members"].Rows[0]["MemberPass"].ToString();
                m.memberPic  = ds.Tables["Members"].Rows[0]["MemberPic"].ToString();
                Session["Member"] = m;
                Response.Redirect("../pages/Main.aspx");
            }
            else
            {
                lblError.Text = "הסיסמא או המייל לא נכונים";
            }
        }
        else
        {
            lblError.Text = "המייל שהוקלד לא קיים במערכת";
        }
    }
}