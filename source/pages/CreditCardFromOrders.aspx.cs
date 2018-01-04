using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_CreditCardFromOrders : System.Web.UI.Page
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
        {
            if (GetExpiery() >= DateTime.Now.AddMonths(+3))
            {
                CreditCardService.InsertCreditCard(cd);
                Response.Redirect("../pages/Insvitations.aspx?#final");
            }
            else
                Response.Write("<script language='javascript'>alert('הכרטיס לא בתוקף')</script>");
        }
        //Response.Write(((Members)Session["Member"]).MemberId);
    }

    public DateTime GetExpiery()
    {
        int month = int.Parse(txtMonth.Text);
        int year = 2000 + int.Parse(txtYear.Text);
        return new DateTime(year, month, DateTime.Now.Day, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
    }

}