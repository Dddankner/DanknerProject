using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pages_CreditCardPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillGrd();
    }

    public void FillGrd()
    {
        DataSet ds = CreditCardService.GetCreditCardDetails(((Members)Session["Member"]).MemberId);
        grdCard.DataSource = ds;
        grdCard.DataBind();
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
        {
            if (GetExpiery() >= DateTime.Now.AddMonths(+3))
            {
                CreditCardService.InsertCreditCard(cd);
            }
            else
                Response.Write("<script language='javascript'>alert('הכרטיס לא בתוקף')</script>");
        }
        else
            CreditCardService.UpdateCreditCard(cd);
    }

    public DateTime GetExpieryUpdate()
    {
        int month = int.Parse(txtMonthUp.Text);
        int year = 2000 + int.Parse(txtYearUp.Text);
        return new DateTime(year, month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        CreditCard cd = new CreditCard();
        cd.CreditCardNum = txtCardNumUp.Text;
        cd.CreditCardCVV = txtCardCVVUp.Text;
        cd.MemberId = ((Members)Session["Member"]).MemberId;
        cd.CreditCardExpiery = GetExpieryUpdate();
        if (GetExpieryUpdate() >= DateTime.Now.AddMonths(+3))
        {
            CreditCardService.UpdateCreditCard(cd);
            Response.Write("<script language='javascript'>alert('הכרטיס עודכן')</script>");
        }
        else
            Response.Write("<script language='javascript'>alert('הכרטיס לא בתוקף')</script>");
    }
}