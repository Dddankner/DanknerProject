using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

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
        //for (int i = 0; i < ddlCity.Items.Count; i++)
        //{
        //    ddlCity.Items[i].Enabled = true;
        //}
        ddlTheatersUpdate.DataSource = ds;
        ddlTheatersUpdate.DataValueField = "TheaterId";
        ddlTheatersUpdate.DataTextField = "CityName";
        ddlTheatersUpdate.DataBind();
        //ddlCity.Items.Insert(0, new ListItem("-בחר עיר-"));
        theaterGrd.DataSource = ds;
        theaterGrd.DataBind();
        //FillDBCities();
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
        ddlCategoruUpdate.Items.Insert(0, new ListItem("-בחר קטגוריה-"));
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
        ddlMovies.Items.Insert(0, new ListItem("-בחר סרט-"));
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
        m.MovieDescription = txtSum.Text;
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
        FillDdl();
    }

    protected void btnUpMovie_Click(object sender, EventArgs e)
    {
        Movies m = new Movies();
        m.MovieId = int.Parse(ddlMovies.SelectedValue);
        m.CategoryId = int.Parse(ddlCategoruUpdate.SelectedValue);
        m.MovieName = txtMovieNameUpdate.Text;
        m.MovieSeatPrice = int.Parse(txtSeatPriceUpdate.Text);
        m.MovieTrailer = txtTrailerUpdate.Text;
        string photoName = "";
        if (fuPicUpdate.HasFiles)
        {
            fuPicUpdate.SaveAs(Server.MapPath("/moviesImg/" + fuPicUpdate.FileName));
            photoName = "/moviesImg/" + fuPicUpdate.FileName;
        }
        else
        {
            photoName = MoviesService.GetImageUrl(int.Parse(ddlMovies.SelectedValue));
        }
        m.MoviePic = photoName;
        m.MovieDescription = txtSumUpdate.Text;
        MoviesService.UpdateMovie(m);
        TheaterMovies tm = new TheaterMovies();
        tm.MovieId = int.Parse(ddlMovies.SelectedValue);
        tm.TheaterId = int.Parse(ddlTheatersUpdate.SelectedValue);
        tm.TheaterMovieSeatNum = int.Parse(txtSeatNumUpdate.Text);
        if (TheaterMoviesService.IsExist(tm.TheaterId, tm.MovieId))
            TheaterMoviesService.UpdateTheaterMovie(tm);
        else
        {
            TheaterMoviesService.SetMovieToTheater(tm);
        }
        //Response.Write(photoName);
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
            Response.Write("<script language='javascript'>alert('הקטגוריה קיימת במערכת ולכן אי אפשר להוסף אותה')</script>");
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

    protected void categoryGrd_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "delete")
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            int catID = int.Parse(categoryGrd.Rows[rowIndex].Cells[0].Text);
            string catName = categoryGrd.Rows[rowIndex].Cells[1].Text;
            if(CategoriesService.IsConnected(catID))
            {
                Response.Write("<script>alert('הקטגוריה לא יכולה להימחק מכיוון שהיא מקושרת');</script>");
            }
            else
            {
                CategoriesService.DeleteCategory(catID);
                Response.Write("<script>alert('הקטגוריה נמחקה');</script>");
                FillDdl();
            }
        }
    }

    protected void categoryGrd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void theaterGrd_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "delete")
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            int theaID = int.Parse(theaterGrd.Rows[rowIndex].Cells[0].Text);
            if(TheatersService.IsConnected(theaID))
            {
                Response.Write("<script>alert('הקולנוע לא יכולה להימחק מכיוון שהוא מקושר');</script>");
            }
            else
            {
                TheatersService.DeleteTheater(theaID);
                Response.Write("<script>alert('הקולנוע נמחק');</script>");
                FillDdl();
            }
        }
    }

    protected void theaterGrd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetMovieDetails(int movieID)
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        DataSet ds = MoviesService.GetMovieDS(movieID);
        Movies m = new Movies();
        m.MovieDescription = ds.Tables[0].Rows[0]["MovieDescreption"].ToString();
        m.MovieName = ds.Tables[0].Rows[0]["MovieName"].ToString();
        m.MovieId = int.Parse(ds.Tables[0].Rows[0]["MovieId"].ToString());
        m.MoviePic = ds.Tables[0].Rows[0]["MoviePic"].ToString();
        m.MovieTrailer = ds.Tables[0].Rows[0]["MovieTrailer"].ToString();
        m.CategoryId = int.Parse(ds.Tables[0].Rows[0]["CategoryId"].ToString());
        m.MovieSeatPrice = int.Parse(ds.Tables[0].Rows[0]["MovieSeatPrice"].ToString());
        return js.Serialize(m);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetSeatNum(int movieID, int theaID)
    {
        JavaScriptSerializer js = new JavaScriptSerializer();
        string num = "0";
        if (TheaterMoviesService.IsExist(theaID, movieID))
            num = TheaterMoviesService.GetSeatNum(theaID, movieID).ToString();
        return js.Serialize(num);
    }
}