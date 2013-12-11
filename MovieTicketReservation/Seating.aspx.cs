using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieTicketReservation
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);

            Response.Write(tName);
            Response.Write(mName);
            Response.Write(mDate);
            Response.Write(sTime);
            //Server.Transfer("SeatBooking.aspx");
        }
    }
}