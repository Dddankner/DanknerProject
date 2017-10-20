using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Summary description for MembersServer
/// </summary>
public class MembersServer
{
    

	public MembersServer()
	{
		
	}

    

    public void Register(Members m)
    {
        string strSql = "INSERT INTO Members(MemberFname, MemberLname, MemberPass, CityId, MemberGender, MemberHobbies, MemberPic, MemberDate, MemberMail, MemberManager, MemberStatus)";
        strSql += "VALUES('" + m.memberFname.Trim() + "', '" + m.MemberLname.Trim() + "', '" + m.memberPass.Trim() + "'," + m.cityId + ",'" + m.memberGender.Trim() + "','" + m.memberHobies.Trim() + "','" + m.memberPic.Trim() + "','" + m.memberDate + "','" + m.memberMail + "',"+true+",'פעיל')";
        Connect.InsertUpdateDelete(strSql);
    }

    public bool IsMailExist(Members m)
    {
        string strFind = "SELECT COUNT(MemberId) FROM Members WHERE MemberMail ='" + m.memberMail.Trim() + "'";
        object obj = Connect.GetObject(strFind);
        return int.Parse(obj.ToString()) < 1;
    }
    public bool Login(Members m)
    {
        string strFind = "SELECT COUNT(MemberMail) FROM Members WHERE MemberPass ='" + m.memberPass.Trim() + "' AND MemberMail ='" + m.memberMail.Trim() + "'";
        object obj = Connect.GetObject(strFind);
        return int.Parse(obj.ToString()) < 1;
    }

    public DataSet ShowAll()
    { 
        string strSql = strSql = "SELECT * FROM Members,Cities WHERE Members.CityId=Cities.CityId";
        DataSet ds = Connect.GetDataSet(strSql, "Members");
        return ds;
    }

    public DataSet ShowMember(string memberMail)
    {
        string strSql = strSql = "SELECT * FROM Members,Cities WHERE Members.CityId=Cities.CityId AND MemberMail='" + memberMail + "'";
        DataSet ds = Connect.GetDataSet(strSql, "Members");
        return ds;
    }

    public DataSet ShowMemberCityNum(string memberMail)
    {
        string strSql = strSql = "SELECT * FROM Members,Cities WHERE MemberMail='" + memberMail + "'";
        DataSet ds = Connect.GetDataSet(strSql, "Members");
        return ds;
    }

    public void UpdatePic(Members m)
    {
        string strSql = "UPDATE Members SET MemberFname='" + m.memberFname.Trim() + "', MemberLname='" + m.MemberLname.Trim() + "', MemberPass='" + m.memberPass.Trim() + "', CityId=" + m.cityId + ", MemberGender='" + m.memberGender.Trim() + "', MemberHobbies='" + m.memberHobies.Trim() + "', MemberPic='" + m.memberPic.Trim() + "', MemberDate='" + m.memberDate + "', MemberMail='" + m.memberMail.Trim() + "'";
        strSql += "WHERE MemberMail='" + m.memberMail.Trim() + "'";
        Connect.InsertUpdateDelete(strSql);
    }

    public string PicUrl(string mail)
    {
        string strSql = "SELECT * FROM Members WHERE MemberMail='" + mail.Trim() + "'";
        DataSet ds = Connect.GetDataSet(strSql, "Members");
        string pic = ds.Tables["Members"].Rows[0]["MemberPic"].ToString();
        return pic;
    }

    public static void DeleteMember(string mail)
    {
        string strSql = "UPDATE Members SET MemberStatus='לא פעיל' WHERE MemberMail='" + mail + "'";
        Connect.InsertUpdateDelete(strSql);
    }

    
    

}