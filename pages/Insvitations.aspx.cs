using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class pages_Insvitations : System.Web.UI.Page
{
    int movieID = 0;
    int indexImg = 0;
    int valueTheater = 0;
    CheckBox[,] btnSeat = new CheckBox[10, 10];
    List<ImageButton> imgSelect = new List<ImageButton>();
    ListItem selectedList = new ListItem();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["MovieId"] != null && Request.QueryString["MovieId"].ToString() != "")
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["selectedID"] != null && Request.QueryString["selectedID"].ToString() != "")
                {
                    Session["selectedID"] = 0;
                }
                FillDDL(int.Parse(Request.QueryString["MovieId"].ToString()));
                //ddlTheaters.SelectedItem.Equals(selectedList);
                //ClientScript.RegisterStartupScript(this.GetType(), "Script", "javascript:function(){$('ul.tabs').tabs('select_tab', 'detailsLink')}", true);
            }
            if (Session["selectedID"] != null && Session["selectedID"].ToString() != "")
            {
                if (int.Parse(Session["selectedID"].ToString()) != 0)
                    ddlTheaters.SelectedIndex = int.Parse(Session["selectedID"].ToString());
            }
            Session["selectedID"] = ddlTheaters.SelectedIndex;
           
            //CheckSeats();
            movieID = int.Parse(Request.QueryString["MovieId"].ToString());
            PanelFill();
            if(IsPostBack)
            {
                valueTheater = int.Parse(ddlTheaters.SelectedValue);
                lblShowID.Text = valueTheater.ToString();
            }
        }
    }

    public void FillDDL(int id)
    {
        DataSet dsThea = TheaterMoviesService.GetTheatersForMovie(id);
        ddlTheaters.DataSource = dsThea;
        ddlTheaters.DataTextField = "CityName";
        ddlTheaters.DataValueField = "TheaterId";
        ddlTheaters.DataBind();
        ddlTheaters.Items.Insert(0, new ListItem("-בחר קולנוע-"));
    }

    public void PanelFill()
    {
        CreateImg(btnSeat);
    }
    public void CreateImg(CheckBox[,] cbx)
    {
        Table tbl = new Table();
        TableRow[] row = new TableRow[cbx.GetLength(1)];
        for (int i = 0; i < row.Length; i++)
        {
            row[i] = new TableRow();
        }
        for (int i = 0; i < cbx.GetLength(1); i++)
        {
            for (int j = 0; j < cbx.GetLength(0); j++)
            {
                TableCell cell = new TableCell();
                cbx[i, j] = new CheckBox();
                if (i == 0)
                    cbx[i, j].Text = "" + (j + 1).ToString() + "";
                else if (j == 9)
                {
                    int num = (i + 1) * 10;
                    cbx[i, j].Text = "" + num.ToString() + "";
                }
                else
                    cbx[i, j].Text = "" + (i.ToString()) + ((j + 1).ToString()) + "";
                Image img = new Image();
                img.ImageUrl = "~/img/seat-white.png";
                //img[i, j] = new CheckBox();
                //img[i, j].ImageUrl = "~/img/seat-white.png";
                //img[i, j].Attributes.Add("style", "height:3vh; width:3vh");
                //img[i, j].PostBackUrl = "../pages/Insvitations.aspx?MovieId=" + movieID + "#selectSeats";
                //string str = i + 1.ToString() + j + 1.ToString();
                //img[i, j].ID = "img-" + str;
                //img[i, j].Click += Pages_Insvitations_Click;
                //img[i, j].Load += Pages_Insvitations_Load;
                cell.Controls.Add(cbx[i, j]);
                row[i].Controls.Add(cell);
                cell.Controls.Add(img);
                row[i].Controls.Add(cell);
            }
            tbl.Controls.Add(row[i]);
        }
        theaterPrev.Controls.Add(tbl);
    }

    private void Pages_Insvitations_Load(object sender, EventArgs e)
    {
        for (int i = 0; i < imgSelect.Count; i++)
        {
            for (int j = 0; j < btnSeat.GetLength(1); j++)
            {
                for (int k = 0; k < btnSeat.GetLength(0); k++)
                {
                    if(btnSeat[j,k].ID == imgSelect.ElementAt(i).ID)
                    {
                        //btnSeat[j, k].ImageUrl = "~/img/seat-black.png";
                    }
                }
            }
        }
    }

    public void CheckSeats()
    {
        for (int i = 0; i < imgSelect.Count; i++)
        {
            for (int j = 0; j < btnSeat.GetLength(1); j++)
            {
                for (int k = 0; k < btnSeat.GetLength(0); k++)
                {
                    if (btnSeat[j, k].ID == imgSelect.ElementAt(i).ID)
                    {
                        //btnSeat[j, k].ImageUrl = "~/img/seat-black.png";
                    }
                }
            }
        }
    }

    private void Pages_Insvitations_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        if (img.ImageUrl == "~/img/seat-black.png")
            img.ImageUrl = "~/img/seat-white.png";
        else if (img.ImageUrl == "~/img/seat-white.png")
            img.ImageUrl = "~/img/seat-black.png";
        img.Attributes.Add("style", "height:3vh; width:3vh");
        imgSelect.Add(((ImageButton)sender));
        imgSelect.Last<ImageButton>().ID = ((ImageButton)sender).ID;
        Response.Redirect("Insvitations.aspx?MovieId=" + movieID + "#selectSeats");
    }

    protected void ddlTheaters_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["selectedID"] = ddlTheaters.SelectedIndex;
        //lblShowID.Text = ddlTheaters.SelectedValue;
        //ClientScript.RegisterStartupScript(this.Page.GetType(), "Script", "function(){$('ul.tabs').tabs('select_tab', 'seatsLink')}", true);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {

        Response.Redirect("Insvitations.aspx?MovieId="+movieID+ "#selectSeats");
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        string selectedSeats = "";
        int count = 0;
        for (int i = 0; i < btnSeat.GetLength(1); i++)
        {
            for (int j = 0; j < btnSeat.GetLength(0); j++)
            {
                if(btnSeat[i,j].Checked)
                {
                    if (selectedSeats == "")
                        selectedSeats += btnSeat[i, j].Text;
                    else
                        selectedSeats += ", " + btnSeat[i, j].Text;
                    count++;
                }
            }
        }
        lblShowSeats.Text = selectedSeats;
        if (int.Parse(Session["selectedID"].ToString()) != 0)
        {
            Orders o1 = new Orders();
            o1.MemberId = ((Members)(Session["Member"])).MemberId;
            o1.OrderTime = Date1(DateTime.Now.ToShortDateString());
            o1.OrderPrice = MoviesService.GetSeatPrice(movieID) * count;
            o1.CreditCardId = 0;
            OrdersService.CreateOrder(o1);
            OrderDetails od = new OrderDetails();
            od.OrderId = OrdersService.GetId();
            //od.OrderId = 1;
            od.MovieId = movieID;
            od.MovieSeatAmount = count;
            od.MovieSeatPrice = MoviesService.GetSeatPrice(movieID);
            od.TheaterId = valueTheater;
            od.MovieSeats = GetSelectedSeats();
            OrderDetailsService.SetOrderDetails(od);
            Response.Redirect("catalog.aspx");
        }
    }

    public DateTime Date1( string s)
    {
        //string s = txtDate.Text.ToString().Trim();
        //dd/mm/yyyy
        //int.Parse(d), int.Parse(m), int.Parse(y), DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second
        int d = int.Parse(s.Substring(0, 2));
        int m = int.Parse(s.Substring(3, 2));
        int y = int.Parse(s.Substring(6));
        DateTime dt = new DateTime(y, m, d, DateTime.Now.Hour, DateTime.Now.Minute, DateTime.Now.Second);
        return dt;

    }

    public string GetSelectedSeats()
    {
        string selectedSeats = "";
        for (int i = 0; i < btnSeat.GetLength(1); i++)
        {
            for (int j = 0; j < btnSeat.GetLength(0); j++)
            {
                if (btnSeat[i, j].Checked)
                { 
                        selectedSeats += "*" + btnSeat[i, j].Text + "*";
                }
            }
        }
        return selectedSeats;
    }
}