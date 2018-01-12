﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public Members m;
    protected void Page_Load(object sender, EventArgs e)
    {
        m = (Members)Session["Member"];
        if (Session["Member"] != null)
            imgUser.ImageUrl = "~/MembersImg/" + MembersServer.PicUrl(m.memberMail);
    }
}
