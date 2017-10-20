using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Members
/// </summary>
public class Members
{
    public string memberFname { get; set; }
    public string MemberLname { get; set; }
    public string memberPass { get; set; }
    public int cityId { get; set; }
    public string memberGender { get; set; }
    public string memberHobies { get; set; }
    public string memberNotes { get; set; }
    public string memberPic { get; set; }
    public DateTime memberDate { get; set; }
    public string memberMail { get; set; }

    public Members()
    {
        
    }
    public Members(string f, string l, string p, int id, string g, string h, string n, string pic, DateTime d, string m)
    {
        this.memberFname = f;
        this.MemberLname = l;
        this.memberPass = p;
        this.cityId = id;
        this.memberGender = g;
        this.memberHobies = h;
        this.memberNotes = n;
        this.memberPic = pic;
        this.memberDate = d;
        this.memberMail = m;
    }
}