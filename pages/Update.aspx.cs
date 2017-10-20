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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        fill();
    }
    public void fill()
    {
        Members m = (Members)Session["Member"];
        txtfName.Text = m.memberFname.ToString().Trim();
        txtlName.Text = m.MemberLname.ToString().Trim();
        txtMail.Text = m.memberMail.ToString().Trim();
        txtPass.Text = m.memberPass.ToString().Trim();
        txtPass.Attributes.Add("value", m.memberPass.ToString().Trim());
        txtRePass.Attributes.Add("value", m.memberPass.ToString().Trim());
        txtRePass.Text = m.memberPass.ToString().Trim();
        txtDate.Text = m.memberDate.ToString().Trim();
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
        DateTime date1 = Date1();
        Members m = new Members();
        m.memberFname = txtfName.ToString();
        m.MemberLname = txtlName.ToString();
        m.memberPass = txtPass.ToString();
        m.cityId = int.Parse(cities.SelectedItem.Value.Trim());
        m.memberGender = rbtGender.SelectedItem.Text.ToString().Trim();
        m.memberHobies = cbxHobbies.SelectedItem.Text.ToString().Trim();
        m.memberNotes = txtNotes.ToString();
        m.memberPic = photoName;
        m.memberDate = date1;
        m.memberMail = txtMail.ToString();
    }

    public DateTime Date1()
    {
        string s = txtDate.Text.ToString().Trim();
        //dd/mm/yyyy
        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
        int d = int.Parse(s.Substring(0, 2));
        int m = int.Parse(s.Substring(3, 2));
        int y = int.Parse(s.Substring(6));
        DateTime dt = new DateTime(y, m, d, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        return dt;

    }
}