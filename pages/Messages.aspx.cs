using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_Messages : System.Web.UI.Page
{
    public static Members m1;
    protected void Page_Load(object sender, EventArgs e)
    {
        m1 = (Members)Session["Member"];
        
    }
    
    public void Fillddl()
    {
        DataSet ds = MembersServer.ShowMembersOnly();
        
    }
}