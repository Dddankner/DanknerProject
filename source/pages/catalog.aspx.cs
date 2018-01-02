using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class pages_catalog : System.Web.UI.Page
{
    PagedDataSource paged = new PagedDataSource();
    int current;
    int pageCur;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            current = 0;
            Session["currentP"] = 0;
            FillDataList();            
        }
        else
        {
            current = int.Parse(Session["currentP"].ToString());
        }
        pageCur = current + 1;
        lblShowPage.Text = paged.PageCount+ "&nbsp;" + "מתוך" + "&nbsp;" + pageCur;

        // PanelFill();
        // theaterPrev.Attributes.Add("style", "display:none");
    }


    public void FillDataList()
    {
        DataSet ds = MoviesService.GetMovies();
        paged.AllowPaging = true;
        paged.DataSource = ds.Tables[0].DefaultView;
        paged.PageSize = 6;
        paged.CurrentPageIndex = current;
        next.Enabled = !paged.IsLastPage;
        prev.Enabled = !paged.IsFirstPage;
        DataList1.DataSource = paged;
        DataList1.DataBind();
    }


    //public void PanelFill()
    //{
    //    ImageButton[,] btnSeat = new ImageButton[10, 10];
    //    CreateImg(btnSeat);
    //}
    //public void CreateImg(ImageButton[,] img)
    //{
    //    Table tbl = new Table();
    //    TableRow[] row = new TableRow[img.GetLength(1)];
    //    for (int i = 0; i < row.Length; i++)
    //    {
    //        row[i] = new TableRow();
    //    }
    //    for (int i = 0; i < img.GetLength(1); i++)
    //    {
    //        for (int j = 0; j < img.GetLength(0); j++)
    //        {
    //            TableCell cell = new TableCell();
    //            img[i, j] = new ImageButton();
    //            img[i, j].ImageUrl = "~/img/seat-white.png";
    //            img[i, j].Attributes.Add("style", "height:3vh; width:3vh");
    //            string str = i+1.ToString() + j+1.ToString();
    //            img[i, j].ID = "img-" + str;
    //            img[i, j].Click += Pages_catalog_Click;
    //            img[i, j].Load += Pages_catalog_Load;s
    //            cell.Controls.Add(img[i, j]);
    //            row[i].Controls.Add(cell);
    //        }
    //        tbl.Controls.Add(row[i]);
    //    }
    //    theaterPrev.Controls.Add(tbl);
    //}

    private void Pages_catalog_Load(object sender, EventArgs e)
    {

    }

    public void CreateCatalog()
    {

    }

    public void CreateRow(TableRow[] r)
    {
        for (int i = 0; i < r.Length; i++)
        {
            r[i] = new TableRow();
        }
    }

    private void Pages_catalog_Click(object sender, ImageClickEventArgs e)
    {
        ImageButton img = (ImageButton)sender;
        img.ImageUrl = "~/img/seat-black.png";
        img.Attributes.Add("style", "height:3vh; width:3vh");
    }



    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //(HyperLink)FindControl("HyperLink1")
        HyperLink link1 = (HyperLink)e.Item.FindControl("HyperLink1");
        //string movieId = DataList1.DataKeys[e.Item.ItemIndex].ToString();
        link1.NavigateUrl = "Insvitations.aspx?MovieId=" + link1.ToolTip + "&selectedID=0";
    }



    protected void ButtonInvite_Click(object sender, EventArgs e)
    {

        int Movieid = int.Parse(((Button)sender).ToolTip);
        Response.Redirect("/pages/Insvitations.aspx?MovieId=" + Movieid);



    }

    protected void next_Click(object sender, EventArgs e)
    {
        Session["currentP"] = Convert.ToInt32(Session["currentP"].ToString()) + 1;
        this.current = Convert.ToInt32(Session["currentP"].ToString());
        FillDataList();
        pageCur = this.current + 1;
        lblShowPage.Text = paged.PageCount + "&nbsp;" + "מתוך" + "&nbsp;" + pageCur;
    }

    protected void prev_Click(object sender, EventArgs e)
    {
        Session["currentP"] = Convert.ToInt32(Session["currentP"].ToString()) - 1;
        this.current = Convert.ToInt32(Session["currentP"].ToString());
        FillDataList();
        pageCur = this.current + 1;
        lblShowPage.Text = paged.PageCount + "&nbsp;" + "מתוך" + "&nbsp;" + pageCur;
    }
}