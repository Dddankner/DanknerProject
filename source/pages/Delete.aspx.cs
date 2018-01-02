using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembersServer.DeleteMember(Request.QueryString["mail"].ToString());
        Members m = (Members)Session["Member"];
        if (m.memberManager)
            Response.Redirect("../pages/Main.aspx");
        else
            Response.Redirect("../pages/LogOut.aspx");
    }
}