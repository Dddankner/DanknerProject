using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_MovieAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Member"] != null && Session["Member"].ToString() != "")
        {
            if (((Members)Session["Member"]).memberManager)
            {
                if (!IsPostBack)
                {
                    FillDdl();
                }
            }
            else
            {
                Response.Redirect("../pages/Main.aspx");
            }
        }
        else
        {
            Response.Redirect("../pages/Main.aspx");
        }

    }

    public void FillDdl()
    {
        DataSet ds = TheatersService.GetTheaters();
        ddlCity.DataSource = ds;
        ddlCity.DataValueField = "TheaterId";
        ddlCity.DataTextField = "CityName";
        ddlCity.DataBind();
        for (int i = 0; i < ddlCity.Items.Count; i++)
        {
            ddlCity.Items[i].Enabled = true;
        }
        ddlTheatersUpdate.DataSource = ds;
        ddlTheatersUpdate.DataValueField = "TheaterId";
        ddlTheatersUpdate.DataTextField = "CityName";
        ddlTheatersUpdate.DataBind();
        //ddlCity.Items.Insert(0, new ListItem("-בחר עיר-"));
        theaterGrd.DataSource = ds;
        theaterGrd.DataBind();
        FillDBCities();
        DataSet ds1 = CitiesServer.GetCityList();
        ddlAllCities.DataSource = ds1;
        ddlAllCities.DataValueField = "CityId";
        ddlAllCities.DataTextField = "CityName";
        ddlAllCities.DataBind();
        ddlAllCities.Items.Insert(0, new ListItem("-בחר עיר-"));
        DataSet ds2 = CategoriesService.GetCategories();
        ddlCategory.DataSource = ds2;
        ddlCategory.DataValueField = "CategoryId";
        ddlCategory.DataTextField = "categoryName";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("-בחר קטגוריה-"));
        ddlCategoruUpdate.DataSource = ds2;
        ddlCategoruUpdate.DataValueField = "CategoryId";
        ddlCategoruUpdate.DataTextField = "categoryName";
        ddlCategoruUpdate.DataBind();
        ddlUpdateCategory.DataSource = ds2;
        ddlUpdateCategory.DataValueField = "CategoryId";
        ddlUpdateCategory.DataTextField = "categoryName";
        ddlUpdateCategory.DataBind();
        ddlUpdateCategory.Items.Insert(0, new ListItem("-בחר קטגוריה-"));
        categoryGrd.DataSource = ds2;
        categoryGrd.DataBind();
        DataSet dsMov = MoviesService.GetMovies();
        ddlMovies.DataSource = dsMov;
        ddlMovies.DataValueField = "MovieId";
        ddlMovies.DataTextField = "MovieName";
        ddlMovies.DataBind();
        MoviesGrd.DataSource = dsMov;
        MoviesGrd.DataBind();
    }

    public List<int> GetTheaters()
    {
        List<int> idThe = new List<int>();
        for (int i = 0; i < ddlCity.Items.Count; i++)
        {
            if (ddlCity.Items[i].Selected)
                idThe.Add(int.Parse(ddlCity.Items[i].Value.ToString()));
        }
        return idThe;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Movies m = new Movies();
        m.MovieName = txtMovieName.Text;
        //m.MovieSeatNum = int.Parse(txtNumSeats.Text);
        m.MovieSeatPrice = int.Parse(txtMovieSeatPrice.Text);
        m.CategoryId = int.Parse(ddlCategory.SelectedItem.Value);
        m.MovieTrailer = txtTrailer.Text;
        string photoName = "";
        fuPic.SaveAs(Server.MapPath("/moviesImg/" + fuPic.FileName));
        photoName = "/moviesImg/" + fuPic.FileName;
        m.MoviePic = photoName;
        MoviesService.AddMovie(m);
        List<int> idThe = GetTheaters();
        List<TheaterMovies> tms = new List<TheaterMovies>();
        for (int i = 0; i < idThe.Count; i++)
        {
            TheaterMovies tm = new TheaterMovies();
            tm.MovieId = MoviesService.GetMaxID();
            tm.TheaterId = idThe[i];
            tm.TheaterMovieSeatNum = int.Parse(txtNumSeats.Text);
            tms.Add(tm);
        }
        TheaterMoviesService.AddList(tms);
        txtTrailer.Text = "";
        txtMovieSeatPrice.Text = "";
        txtNumSeats.Text = "";
        txtMovieName.Text = "";
        ddlCategory.SelectedIndex = 0;
    }

    protected void btnAddTheater_Click(object sender, EventArgs e)
    {
        Theaters t = new Theaters();
        t.CityId = int.Parse(ddlAllCities.SelectedItem.Value);
        if (TheatersService.isExist(t.CityId))
        {
            TheatersService.CreateTheater(t);
            DataSet ds = TheatersService.GetTheaters();
            ddlCity.DataSource = ds;
            ddlCity.DataValueField = "TheaterId";
            ddlCity.DataTextField = "CityName";
            ddlCity.DataBind();
            ddlAllCities.SelectedIndex = 0;
            theaterGrd.DataSource = ds;
            theaterGrd.DataBind();
        }
        else
        {
            //errorThea.Text = "הקולנוע כבר קיים";
        }
        
    }

    

    public void FillDBCities()
    {
        IsraelCities.WebServiceCities myCities = new IsraelCities.WebServiceCities();
        DataSet dsWS = myCities.GetAllCitiesFromIsrael();
        string connection = Connect.GetConnectionString();
        string strSearch = "SELECT * FROM Cities ORDER BY CityName";
        DataSet dsDB = Connect.GetDataSet(strSearch, "Cities");
        DataTable dtDB = dsDB.Tables[0];
        OleDbConnection con = new OleDbConnection(connection);
        con.Open();
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Cities(CityName) VALUES(@CityName)";
        cmd.Parameters.Add("@CityName", OleDbType.VarWChar, 255);
        OleDbTransaction trans = con.BeginTransaction();
        cmd.Transaction = trans;
        for (int i = 0; i < dsWS.Tables[0].Rows.Count; i++)
        {
            string CityName = dsWS.Tables[0].Rows[i]["Heb"].ToString();
            CityName.Replace(")", "");
            CityName.Replace("(", "");
            bool exist = dtDB.AsEnumerable().Where(c => c.Field<string>("CityName").Equals(CityName)).Count() > 0;
            if (!exist)
            {
                cmd.Parameters[0].Value = CityName;
                cmd.ExecuteNonQuery();
            }
        }
        trans.Commit();
        con.Close();
    }

    protected void btnAddCategory_Click(object sender, EventArgs e)
    {
        Categories c = new Categories();
        c.CategoryName = txtCategoryName.Text.ToString();
        if (CategoriesService.IsExist(c.CategoryName))
        {
            CategoriesService.AddCategory(c);
            DataSet ds2 = CategoriesService.GetCategories();
            ddlCategory.DataSource = ds2;
            ddlCategory.DataValueField = "CategoryId";
            ddlCategory.DataTextField = "categoryName";
            ddlCategory.DataBind();
            ddlCategory.SelectedIndex = 0;
            txtCategoryName.Text = "";
            categoryGrd.DataSource = ds2;
            categoryGrd.DataBind();
        } 
        else
        {
            //ErrorCat.Text = "הקטגויה כבר קיימת";
        }      
    }

    protected void theaterGrd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow r1 = e.Row;
        r1.CssClass = "row";
    }

    protected void categoryGrd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow r1 = e.Row;
        r1.CssClass = "highlight";
    }

    protected void MoviesGrd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow r1 = e.Row;
        r1.CssClass = "row";
        if (r1.RowType == DataControlRowType.DataRow)
        {
            //int id = int.Parse(MoviesGrd.DataKeys[r1.RowIndex].ToString());
            //string pic = MoviesService.GetMoviePic(id);
            //((Image)r1.FindControl("MemberImage")).ImageUrl = "../MoviesImg/" + pic + "";
        }
    }

    protected void theaterGrd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "update")
        {
            
        }
    }

    protected void categoryGrd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "update")
        {
            
        }
    }

    protected void categoryGrd_RowEditing(object sender, GridViewEditEventArgs e)
    {
        tblCatUpdate.Attributes.Add("style", "display:normal");
        hidID.Text = categoryGrd.Rows[e.NewEditIndex].Cells[0].Text;
        txtUpdateCat.Text = categoryGrd.Rows[e.NewEditIndex].Cells[1].Text;
        e.NewEditIndex = -1;
    }

    protected void btnUpdateCategory_Click(object sender, EventArgs e)
    {
        Categories c = new Categories();
        c.CategoryId = int.Parse(ddlUpdateCategory.SelectedValue);
        c.CategoryName = txtCategoryNameUpdate.Text;
        CategoriesService.UpdateCategory(c);
        DataSet ds2 = CategoriesService.GetCategories();
        ddlUpdateCategory.DataSource = ds2;
        ddlUpdateCategory.DataValueField = "CategoryId";
        ddlUpdateCategory.DataTextField = "categoryName";
        ddlUpdateCategory.DataBind();
        ddlUpdateCategory.Items.Insert(0, new ListItem("-בחר קטגוריה-"));
        txtCategoryNameUpdate.Text = "";
        categoryGrd.DataSource = ds2;
        categoryGrd.DataBind();
        //CheckSome.Text = ddlUpdateCategory.SelectedValue;
    }
}