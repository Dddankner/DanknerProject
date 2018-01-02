﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_CreditCardPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddCard_Click(object sender, EventArgs e)
    {
        CreditCard cd = new CreditCard();
        cd.CreditCardNum = txtCardNumber.Text;
        cd.CreditCardCVV = txtCardCVV.Text;
        cd.CreditCardExpiery = GetExpiery();
        cd.MemberId = ((Members)Session["Member"]).MemberId;
        if (!CreditCardService.HaveCard(((Members)Session["Member"]).MemberId))
            CreditCardService.InsertCreditCard(cd);
        else
            CreditCardService.UpdateCreditCard(cd);
        Response.Redirect("../pages/Main.aspx");
    }

    public DateTime GetExpiery()
    {
        int month = int.Parse(txtMonth.Text);
        int year = 2000 + int.Parse(txtYear.Text);
        return new DateTime(year, month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
    }

    protected void btnConToBuy_Click(object sender, EventArgs e)
    {
        CreditCard cd = new CreditCard();
        cd.CreditCardNum = txtCardNumber.Text;
        cd.CreditCardCVV = txtCardCVV.Text;
        cd.CreditCardExpiery = GetExpiery();
        cd.MemberId = ((Members)Session["Member"]).MemberId;
        if (!CreditCardService.HaveCard(((Members)Session["Member"]).MemberId))
            CreditCardService.InsertCreditCard(cd);
        else
            CreditCardService.UpdateCreditCard(cd);
        Response.Redirect("../pages/Insvitations.aspx?#final");
    }
}