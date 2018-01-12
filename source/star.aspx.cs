using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class star : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CheckVaildParameters();
        //BoundData();
    }
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    Page.Validate();
    //    if (!Page.IsValid) return;
    //    var pid = int.Parse(Request.QueryString["pid"].ToString());
    //    var uid = ((User)Session["User"]).UserId;

    //    var review = new Review
    //    {
    //        Rate = int.Parse(txtRate.Text.Trim().Replace("'", "")),
    //        Title = txtTitle.Text.Trim().Replace("'", ""),
    //        Content = txtTitle.Text.Trim().Replace("'", ""),
    //        Positive = txtPositive.Text.Trim().Replace("'", ""),
    //        Negative = txtNegative.Text.Trim().Replace("'", ""),
    //        Date = DateTime.Now,
    //        UserID = uid,
    //        ProductID = pid
    //    };

    //    if (!ReviewsService.IsUserWroteAReview(uid, pid))
    //    {
    //        //add the review
    //        var result = ReviewsService.AddNewReview(review);
    //        if (result)
    //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Materialize.toast('Review Added!', 4000); " +
    //                                                                        "setTimeout(function() { location.href = '" + Paths.eUserOrders + "' }, 4000);", true); // added
    //        else
    //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "Materialize.toast('Error: Review was unable to added', 4000);", true); //error
    //    }
    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Materialize.toast('Error', 4000);", true); //error
    //}

    //private void CheckVaildParameters()
    //{
    //    if (string.IsNullOrEmpty(Request.QueryString["pid"]) || string.IsNullOrEmpty(Request.QueryString["oid"]))
    //        Response.Redirect(Paths.Home);
    //    else if (Session["User"] == null)
    //        Response.Redirect(Paths.Home);

    //    var pid = int.Parse(Request.QueryString["pid"]);
    //    var oid = int.Parse(Request.QueryString["oid"]);
    //    var uid = ((User)Session["User"]).UserId;

    //    if (!OrderService.IsUserBoughtProduct(oid, pid, uid))
    //        Response.Redirect(Paths.Home);

    //    if (!ReviewsService.IsUserWroteAReview(uid, pid)) return;
    //    txtContent.Enabled = false;
    //    txtNegative.Enabled = false;
    //    txtPositive.Enabled = false;
    //    txtRate.Enabled = false;
    //    txtTitle.Enabled = false;
    //    btnSave.Enabled = false;
    //    ClientScript.RegisterStartupScript(this.GetType(), "alert", "Materialize.toast" +
    //                                                                "('You already wrote a review for this product. Redirecting', 4000);", true);
    //    ClientScript.RegisterStartupScript(this.GetType(), "aa", "setTimeout( function() { " +
    //                                                             " location.href='" + Paths.eUserOrders + "' }, 4050);", true);
    //}

    //private void BoundData()
    //{
    //    var pid = int.Parse(Request.QueryString["pid"].ToString());
    //    var oid = int.Parse(Request.QueryString["oid"].ToString());
    //    var uid = ((User)Session["User"]).UserId;

    //    var p = new Product();
    //    ProductsService.Fill(p, pid);
    //    lblBrand.Text = p.ProductBrand;
    //    lblProductName.Text = p.Name;
    //    imgProduct.ImageUrl = ProductImagesService.GetImagesPathByProductId(pid)[0];

    //    var o = new Order();
    //    OrderService.Fill(o, oid);
    //    lblBoughtOn.Text = @"You Bought It On " + o.OrderOn;
    //}
}