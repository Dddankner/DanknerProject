using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_MyOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FillGrd();
        txtDate.Attributes.Add("readonly", "true");
        txtEndDate.Attributes.Add("readonly", "true");
    }

    public void FillGrd()
    {
        DataSet ds = new DataSet();
        if (((Members)Session["Member"]).memberManager)
            ds = OrderDetailsService.GetAll();
        else
            ds = OrderDetailsService.GetAll(((Members)Session["Member"]).MemberId);
        grdOrders.DataSource = ds;
        grdOrders.DataBind();
    }

    protected void grdOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "bill")
        {
            grdDiv.Attributes.Add("style", "display:none");
            bill.Attributes.Add("style", "display:normal");
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            int orderID = int.Parse(grdOrders.DataKeys[rowIndex].Value.ToString());
            DataSet ds = OrderDetailsService.Getrder(((Members)Session["Member"]).MemberId, orderID);
            lblDate.Text = ds.Tables[0].Rows[0]["OrderTime"].ToString();
            lblID.Text = orderID.ToString();
            lblMovie.Text = ds.Tables[0].Rows[0]["MovieName"].ToString();
            lblPrice.Text = ds.Tables[0].Rows[0]["OrderPrice"].ToString();
            lblSeats.Text = ds.Tables[0].Rows[0]["MovieSeats"].ToString();
            lblCardNumber.Text = CreditCardService.GetCardNum(((Members)Session["Member"]).MemberId).ToString();
        }
    }

    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'> window.print()</script>");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        grdDiv.Attributes.Add("style", "display:normal");
        bill.Attributes.Add("style", "display:none");
    }

    protected void searchByID_Click(object sender, EventArgs e)
    {
        int orderID = int.Parse(txtByID.Text);
        DataSet ds = OrderDetailsService.Getrder(((Members)Session["Member"]).MemberId, orderID);
        grdOrders.DataSource = ds;
        grdOrders.DataBind();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        FillGrd();
    }

    protected void searchByDate_Click(object sender, EventArgs e)
    {
        DateTime end = DateE();
        DateTime s = DateS();
        DataSet ds = new DataSet();
        if (((Members)Session["Member"]).memberManager)
            ds = OrderDetailsService.SearchByDateManager(end, s);
        else
            ds = OrderDetailsService.SearchByDate(((Members)Session["Member"]).MemberId, end, s);
        grdOrders.DataSource = ds;
        grdOrders.DataBind();
    }

    public DateTime DateS()
    {
        string s = txtDate.Text.ToString().Trim();
        //dd/mm/yyyy
        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
        int d = int.Parse(s.Substring(0, 2));
        int m = int.Parse(s.Substring(3, 2));
        int y = int.Parse(s.Substring(6));
        DateTime dt = new DateTime(y, m, d, 00, 00, 00);
        return dt;
    }

    public DateTime DateE()
    {
        string s = txtEndDate.Text.ToString().Trim();
        //dd/mm/yyyy
        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
        int d = int.Parse(s.Substring(0, 2));
        int m = int.Parse(s.Substring(3, 2));
        int y = int.Parse(s.Substring(6));
        DateTime dt = new DateTime(y, m, d, 23,59,59);
        return dt;
    }

    protected void searchByMovieName_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        if (((Members)Session["Member"]).memberManager)
            ds = OrderDetailsService.SearchByNameManager(txtByMovieName.Text);
        else
            ds = OrderDetailsService.SearchByName(((Members)Session["Member"]).MemberId, txtByMovieName.Text);
        grdOrders.DataSource = ds;
        grdOrders.DataBind();
    }
}