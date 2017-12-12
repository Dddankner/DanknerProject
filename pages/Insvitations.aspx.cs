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
    ListItem selectedList = new ListItem();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["MovieId"] != null && Request.QueryString["MovieId"].ToString() != "")
        {
            if(IsPostBack)
            {
                ddlTheaters.SelectedItem.Equals(selectedList);
            }
            movieID = int.Parse(Request.QueryString["MovieId"].ToString());
            PanelFill();
            FillDDL(int.Parse(Request.QueryString["MovieId"].ToString()));
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
        ImageButton[,] btnSeat = new ImageButton[10, 10];
        CreateImg(btnSeat);
    }
    public void CreateImg(ImageButton[,] img)
    {
        Table tbl = new Table();
        TableRow[] row = new TableRow[img.GetLength(1)];
        for (int i = 0; i < row.Length; i++)
        {
            row[i] = new TableRow();
        }
        for (int i = 0; i < img.GetLength(1); i++)
        {
            for (int j = 0; j < img.GetLength(0); j++)
            {
                TableCell cell = new TableCell();
                img[i, j] = new ImageButton();
                img[i, j].ImageUrl = "~/img/seat-white.png";
                img[i, j].Attributes.Add("style", "height:3vh; width:3vh");
                img[i, j].PostBackUrl = "../pages/Insvitations.aspx?MovieId=" + movieID + "#selectSeats";
                string str = i + 1.ToString() + j + 1.ToString();
                img[i, j].ID = "img-" + str;
                img[i, j].Click += Pages_Insvitations_Click;
                img[i, j].Load += Pages_Insvitations_Load;
                cell.Controls.Add(img[i, j]);
                row[i].Controls.Add(cell);
            }
            tbl.Controls.Add(row[i]);
        }
        theaterPrev.Controls.Add(tbl);
    }

    private void Pages_Insvitations_Load(object sender, EventArgs e)
    {

    }

    private void Pages_Insvitations_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        if (img.ImageUrl == "~/img/seat-black.png")
            img.ImageUrl = "~/img/seat-white.png";
        else if (img.ImageUrl == "~/img/seat-white.png")
            img.ImageUrl = "~/img/seat-black.png";
        img.Attributes.Add("style", "height:3vh; width:3vh");
    }

    protected void ddlTheaters_SelectedIndexChanged(object sender, EventArgs e)
    {
        instructionContinue.Attributes.Add("style", "display:normal");
        selectedList = ddlTheaters.SelectedItem;
    }
}