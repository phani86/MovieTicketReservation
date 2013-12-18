/*Seating.aspx.cs
   The Seating arrangement and available Seats based on row selection from drop down list  shown in a tabbed view.

 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.11.25: Created     

*/

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
          // DateTime mDate = (DateTime)(Session["Date"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);
            int quantity = (int)(Session["Quantity"]);
            float cost=(float)(Session["Cost"]);

            Response.Write("Your selected Theater is" + tName + "<br>");
            Response.Write("Your selected movie is" + mName + "<br>");
            Response.Write("Your selected movie date  is" + mDate + "<br>");
            Response.Write("Your selected movie time  is" + sTime + "<br>");
            Response.Write("Number of Tickets are" + quantity +"<br>");
            Response.Write("Your Total tickets cost is" + (quantity*cost).ToString("c"));

            if (!IsPostBack)
            {
               
                seatArrangementTabButton.CssClass = "Clicked";
                MainView.ActiveViewIndex = 0;
            }
            //Server.Transfer("SeatBooking.aspx");
        }

        protected void TabButton1_Click(object sender, EventArgs e)
        {
            seatArrangementTabButton.CssClass = "Clicked";
            seatBookTabButton.CssClass = "Initial";
            MainView.ActiveViewIndex = 0;
        }

        protected void TabButton2_Click(object sender, EventArgs e)
        {
            seatArrangementTabButton.CssClass = "Initial";
            seatBookTabButton.CssClass = "Clicked"; 
            MainView.ActiveViewIndex = 1;
        }

        

        protected void PreviousViewButton_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 0;
        }
    }
}