using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for wsComments
/// </summary>
public class wsComments
{
    public int commentRating { get; set; }
    public int commentID { get; set; }
    public int MemberID { get; set; }
    public int movieID { get; set; }
    public string commentSubject { get; set; }
    public string commentContent { get; set; }

    public wsComments()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}