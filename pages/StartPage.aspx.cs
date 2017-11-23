using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_StartPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void logIn_Click()
    {
        //Members m = new Members();
        //MembersServer ms = new MembersServer();
        //m.memberMail = txtMail.Text.ToString();
        //m.memberPass = txtPass.Text.ToString();
        //DataSet ds = ms.ShowMemberByMail(m.memberMail.Trim());
        //m.MemberId = int.Parse(ds.Tables["Members"].Rows[0]["MemberId"].ToString());
        //if (!ms.IsMailExist(m))
        //{
        //    if (!ms.Login(m))
        //    {
        //        //string strSql = "SELECT * FROM Members WHERE MemberMail='" + m.memberMail.Trim() + "'";

        //        //ds = Connect.GetDataSet(strSql, "Members");
        //        m.memberFname = ds.Tables["Members"].Rows[0]["MemberFname"].ToString();
        //        m.MemberLname = ds.Tables["Members"].Rows[0]["MemberLname"].ToString();
        //        m.memberMail = ds.Tables["Members"].Rows[0]["MemberMail"].ToString();
        //        m.memberGender = ds.Tables["Members"].Rows[0]["MemberGender"].ToString();
        //        m.memberHobies = ds.Tables["Members"].Rows[0]["MemberHobbies"].ToString();
        //        m.memberPass = ds.Tables["Members"].Rows[0]["MemberPass"].ToString();
        //        m.memberPic = ds.Tables["Members"].Rows[0]["MemberPic"].ToString();
        //        m.MemberStatus = ds.Tables["Members"].Rows[0]["MemberStatus"].ToString();
        //        m.memberManager = bool.Parse(ds.Tables["Members"].Rows[0]["MemberManager"].ToString());
        //        if (m.MemberStatus == "פעיל")
        //        {
        //            Session["Member"] = m;
        //            Response.Redirect("../pages/Main.aspx");
        //        }
        //        else
        //        {
        //            lblError.Text = "החשבון מושבת כרגע";
        //        }
        //    }
        //    else
        //    {
        //        lblError.Text = "הסיסמא או המייל לא נכונים";
        //    }
        //}
        //else
        //{
        //    lblError.Text = "המייל שהוקלד לא קיים במערכת";
        //}
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {

    }

    protected void logIn_Click1(object sender, EventArgs e)
    {

    }
}
