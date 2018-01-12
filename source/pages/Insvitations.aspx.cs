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
            movieID = int.Parse(Request.QueryString["MovieId"].ToString());
            if (!IsPostBack)
            {
                if (Request.QueryString["selectedID"] != null && Request.QueryString["selectedID"].ToString() != "")
                {
                    Session["selectedID"] = 0;
                    Session["valueTheater"] = 0;
                    Session["Seats"] = "";
                    Session["seatsNum"] = 0;
                    Session["MovieId"] = int.Parse(Request.QueryString["MovieId"].ToString());
                    Session["final"] = false;
                }
                else
                {
                    //CheckSeatsSelect();
                }
                FillDDL(movieID);
                //ddlTheaters.SelectedItem.Equals(selectedList);
                //ClientScript.RegisterStartupScript(this.GetType(), "Script", "javascript:function(){$('ul.tabs').tabs('select_tab', 'detailsLink')}", true);
            }
        }
        if (!CreditCardService.HaveCard(((Members)Session["Member"]).MemberId))
        {
            btnBuy.OnClientClick = "Confirm()";
        }
        if (!IsPostBack)
        {
            FillDDL(int.Parse(Session["MovieId"].ToString()));
        }
        if (Session["selectedID"] != null && Session["selectedID"].ToString() != "")
        {
            if (int.Parse(Session["selectedID"].ToString()) != 0)
                ddlTheaters.SelectedIndex = int.Parse(Session["selectedID"].ToString());
        }
        if(Session["Seats"].ToString() != "")
        {
            //SelectSession();
            //Response.Write(GetSelectedSeats());
        }
        Session["selectedID"] = ddlTheaters.SelectedIndex;

        //CheckSeats();
        if (IsPostBack)
        {
            valueTheater = int.Parse(ddlTheaters.SelectedValue);
            //lblShowID.Text = valueTheater.ToString();
            Session["valueTheater"] = valueTheater;
        }
        //Response.Write(Session["valueTheater"].ToString());
        //lblShowID.Text = PrintList();
        if (Request.QueryString["selectedID"] == null && Session["valueTheater"].ToString() != "0")
        {
            //PanelFill();
            imgPanel.ImageUrl = MoviesService.GetImageUrl(int.Parse(Session["MovieId"].ToString()));
            //CheckSeatsSelect();
            //lblShowSeats.Text = PrintList() + "- " + movieID.ToString() + ", " + Session["valueTheater"].ToString();
        }
        if(bool.Parse(Session["final"].ToString()))
        {
            imgMovie.ImageUrl = MoviesService.GetImageUrl(int.Parse(Session["MovieId"].ToString()));
            linkAddCard.NavigateUrl = "../pages/CreditCardFromOrders.aspx?MovieId=" + Session["MovieId"].ToString();
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
        imgDdl.ImageUrl = MoviesService.GetImageUrl(int.Parse(Session["MovieId"].ToString()));
    }

    public void PanelFill()
    {
        CreateImg();
    }
    public void CreateImg()
    {
        Table tbl = new Table();
        TableRow[] row = new TableRow[btnSeat.GetLength(1)];
        List<string> seatsList = new List<string>();
        seatsList = OrderDetailsService.GetSeatsTaken(movieID, int.Parse(Session["valueTheater"].ToString()));
        int listIndex = 0;
        for (int i = 0; i < row.Length; i++)
        {
            row[i] = new TableRow();
        }
        for (int i = 0; i < btnSeat.GetLength(1); i++)
        {
            for (int j = 0; j < btnSeat.GetLength(0); j++)
            {
                TableCell cell = new TableCell();
                btnSeat[i, j] = new CheckBox();
                if (i == 0)
                {
                    btnSeat[i, j].Text = "" + (j + 1).ToString() + "";
                    if (listIndex < seatsList.Count)
                    {
                        if (btnSeat[i, j].Text == seatsList.ElementAt(listIndex) && listIndex < seatsList.Count)
                        {
                            btnSeat[i, j].ForeColor = System.Drawing.Color.Red;
                            btnSeat[i, j].Checked = true;
                            btnSeat[i, j].Enabled = false;
                            listIndex++;
                        }
                    }
                }
                else if (j == 9)
                {
                    int num = (i + 1) * 10;
                    btnSeat[i, j].Text = "" + num.ToString() + "";
                    if (listIndex < seatsList.Count)
                    {
                        if (btnSeat[i, j].Text == seatsList.ElementAt(listIndex) && listIndex < seatsList.Count)
                        {
                            btnSeat[i, j].Checked = true;
                            btnSeat[i, j].Enabled = false;
                            listIndex++;
                        }
                    }
                }
                else
                    btnSeat[i, j].Text = "" + (i.ToString()) + ((j + 1).ToString()) + "";
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
                if (int.Parse(btnSeat[i, j].Text) <= TheaterMoviesService.GetSeatNum(int.Parse(Session["valueTheater"].ToString()), int.Parse(Session["MovieId"].ToString())))
                {
                    cell.Controls.Add(btnSeat[i, j]);
                    row[i].Controls.Add(cell);
                    cell.Controls.Add(img);
                }
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
                    if (btnSeat[j, k].ID == imgSelect.ElementAt(i).ID)
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
        Session["valueTheater"] = ddlTheaters.SelectedValue;
        PanelFill();
        //lblShowID.Text = ddlTheaters.SelectedValue;
        //ClientScript.RegisterStartupScript(this.Page.GetType(), "Script", "function(){$('ul.tabs').tabs('select_tab', 'seatsLink')}", true);
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        Response.Redirect("Insvitations.aspx?MovieId=" + int.Parse(Session["MovieId"].ToString()) + "#selectSeats");
    }

    public void CheckSeatsSelect()
    {
        //int selIndex = int.Parse(Session["selectedID"].ToString());
        //int theaterID = int.Parse(ddlTheaters.Items[selIndex].Value);
        //List<string> seatsList = new List<string>();
        //seatsList = OrderDetailsService.GetSeatsTaken(movieID, int.Parse(Session["valueTheater"].ToString()));
        //for (int i = 0; i < seatsList.Count; i++)
        //{
        //    for (int j = 0; j < btnSeat.GetLength(1); j++)
        //    {
        //        for (int k = 0; k < btnSeat.GetLength(0); k++)
        //        {
        //            if (btnSeat[j, k] != null)
        //            {
        //                if (btnSeat[j, k].Text != "")
        //                {
        //                    if (btnSeat[j, k].Text == seatsList.ElementAt(i))
        //                    {
        //                        btnSeat[j, k].Checked = true;
        //                        btnSeat[j, k].Enabled = false;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //}
    }

    public string PrintList(List<string> p)
    {
        string c = "";
        //List<string> p = OrderDetailsService.GetSeatsTaken(movieID, int.Parse(Session["valueTheater"].ToString()));
        for (int i = 0; i < p.Count; i++)
        {
            c += ", " + p.ElementAt(i);
        }
        if (p.Count == 0)
        {
            c = "none";
        }
        return c;
    }

    public void SelectSession()
    {
        List<string> seatsList1 = GetSeatsList();
        for (int i = 0; i < seatsList1.Count; i++)
        {
            for (int j = 0; j < btnSeat.GetLength(1); j++)
            {
                for (int k = 0; k < btnSeat.GetLength(0); k++)
                {
                    if (btnSeat[j, k].Text == seatsList1.ElementAt(i))
                    {
                        btnSeat[j, k].Checked = true;
                    }
                }
            }
        }
    }

    public List<string> GetSeatsList()
    {
        string s = Session["Seats"].ToString() + ",";
        string cur = "";
        List<string> ls = new List<string>();
        for (int i = 0; i < s.Length; i++)
        {
            if (s[i] != ',' && s[i] != ' ')
                cur += s[i];
            else
            {
                if (cur != "")
                    ls.Add(cur);
                cur = "";
            }
        }
        return ls;
    }

    protected void btnOrder_Click(object sender, EventArgs e)
    {
        string selectedSeats = "";
        int count = 0;
        for (int i = 0; i < btnSeat.GetLength(1); i++)
        {
            for (int j = 0; j < btnSeat.GetLength(0); j++)
            {
                if (btnSeat[i, j].Checked)
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
            if (CreditCardService.HaveCard(((Members)Session["Member"]).MemberId))
            {
                Orders o1 = new Orders();
                o1.MemberId = ((Members)(Session["Member"])).MemberId;
                o1.OrderTime = Date1(DateTime.Now.ToShortDateString());
                o1.OrderPrice = MoviesService.GetSeatPrice(int.Parse(Session["MovieId"].ToString())) * int.Parse(Session["seatsNum"].ToString());
                o1.CreditCardId = CreditCardService.GetID(((Members)Session["Member"]).MemberId);
                OrdersService.CreateOrder(o1);
                OrderDetails od = new OrderDetails();
                od.OrderId = OrdersService.GetId();
                //od.OrderId = 1;
                od.MovieId = int.Parse(Session["MovieId"].ToString());
                od.MovieSeatAmount = int.Parse(Session["seatsNum"].ToString());
                od.MovieSeatPrice = MoviesService.GetSeatPrice(int.Parse(Session["MovieId"].ToString()));
                od.TheaterId = int.Parse(Session["valueTheater"].ToString());
                od.MovieSeats = GetSelectedSeats();
                OrderDetailsService.SetOrderDetails(od);
                Response.Redirect("catalog.aspx");
                //Response.Write(Session["MovieId"].ToString());
            }
            else
            {
                string confirmValue = Request.Form["confirm_value"];
                if (confirmValue == "Yes")
                {
                    Response.Redirect("../pages/CreditCardFromOrders.aspx?MovieId=" + Session["MovieId"].ToString());
                }
                else
                {
                    Response.Redirect("Insvitations.aspx?MovieId=" + Session["MovieId"].ToString() + "#final");
                }
                //Response.Write("<script language='javascript'>alert('עליך להוסיף כרטיס אשראי לפני ביצוע הזמנה')</script>");
                //Response.Redirect("Insvitations.aspx?MovieId=" + Session["MovieId"].ToString() + "#final");
                //Response.Redirect("../pages/CreditCardFromOrders.aspx?MovieId=" + Session["MovieId"].ToString());
            }
        }
    }

    public DateTime Date1(string s)
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
        string selectedSeats = PrintList(GetSeatsList());
        List<string> ls = GetSeatsList();
        string c = "*";
        for (int i = 0; i < ls.Count; i++)
        {
            c = c +""+ ls.ElementAt(i) + "*";
        }
        return c;
    }

    protected void btnConToFinal_Click(object sender, EventArgs e)
    {
        string selectedSeats = "";
        int count = 0;
        for (int i = 0; i < btnSeat.GetLength(1); i++)
        {
            for (int j = 0; j < btnSeat.GetLength(0); j++)
            {
                if (btnSeat[i, j].Checked && btnSeat[i, j].Enabled)
                {
                    if (selectedSeats == "")
                        selectedSeats += btnSeat[i, j].Text;
                    else
                        selectedSeats += ", " + btnSeat[i, j].Text;
                    count++;
                }
            }
        }
        Session["Seats"] = selectedSeats;
        Session["seatsNum"] = count;
        Session["final"] = true;
        if (Session["Seats"].ToString() == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "hwa", "alertSeats('" + int.Parse(Session["MovieId"].ToString()) + "')", true);
        }
        else
            Response.Redirect("Insvitations.aspx?MovieId=" + int.Parse(Session["MovieId"].ToString()) + "#final");
    }

    protected void btnBackToPanel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Insvitations.aspx?MovieId=" + int.Parse(Session["MovieId"].ToString()) + "#selectSeats");
    }

    protected void btnBackToCity_Click(object sender, EventArgs e)
    {
        Response.Redirect("Insvitations.aspx?MovieId=" + int.Parse(Session["MovieId"].ToString()) + "#selectDetails");
    }
}