using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_DeleteOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            OrdersService.DeleteOrder(int.Parse(Request.QueryString["id"].ToString()));
            Response.Redirect("Main.aspx");
        }
        else
            Response.Redirect("Main.aspx");
    }
}