using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Movies
/// </summary>
public class Movies
{
    public int MovieId { get; set; }
    public string MovieName { get; set; }
    public int MovieSeatPrice { get; set; }
    public string MoviePic { get; set; }
    public int CategoryId { get; set; }
    public string MovieTrailer { get; set; }
    public string MovieDescription { get; set; }
    public Movies()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}