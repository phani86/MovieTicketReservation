/*SeatBooking.aspx.cs
   The seat booking page where user can book tickets based on availability by selecting row numbers from drop down list and seat numbers
   from list box respectively.

 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.11.28: Created     

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MovieTicketReservation
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        private string myCon;

        //Row Population based on seat availability for particular selected movie,theatre and timings of show.
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
          //  DateTime mDate = (DateTime)(Session["Date"]);
            string sTime = (string)(Session["Time"]);
            int quantity = (int)(Session["Quantity"]);
            float cost = (float)(Session["Cost"]);
            Response.Write("Your selected Theater is"+tName +"<br>");
            Response.Write("Your selected movie is"+ mName +"<br>");
            Response.Write("Your selected movie date  is" + mDate + "<br>");
            Response.Write("Your selected movie time  is" +sTime+ "<br>");
            Response.Write("Number of Tickets are"  + quantity+ "<br>");
            Response.Write("Your total tickets cost is" + (quantity * cost).ToString("c"));

           

            if (!Page.IsPostBack)
            {
                SqlConnection sqlCon = new SqlConnection(myCon);
                string query = "SELECT distinct rowId from seat Where Seat.asmId in (select id from AssignMovie,Theatre,Movie where" +"\n"+ 
             "AssignMovie.tid=(select theatreId from Theatre where theatreName='" + tName + "') and" +"\n"+ 
             "AssignMovie.mId=(select movieId from Movie where movieName='" + mName + "')" +"\n"+
             " and dateAvailable='" +mDate+ "' and AssignMovie.movieTime='"+(sTime)+"' and seatStatus='Available')";
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, myCon);
                DataSet d1 = new DataSet();
                da.Fill(d1, "Seat");
                rowDropDownList.DataSource = d1.Tables["Seat"];
                rowDropDownList.DataTextField = "rowId";             
                rowDropDownList.DataBind();
                sqlCon.Close();

            }


        }

      
       //Confirmation of Seat Booking and displaying the status of Booking.
        protected void confirmButton_Click(object sender, EventArgs e)
        {
          
            string rId = rowDropDownList.SelectedItem.Text;
            string sId = seatListBox.SelectedItem.Text;
            string user = (string)(Session["User"]);
             string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);
            int quantity = (int)(Session["Quantity"]);
            float cost = (float)(Session["Cost"]);
            DateTime bookedDate = DateTime.Now;

            if (seatListBox.Items.Count > 0)
            {
                for (int i = 0; i <seatListBox.Items.Count; i++)
                {
                    if (seatListBox.Items[i].Selected)
                    {
                        string selectedItem = seatListBox.Items[i].Text;                      
                        sId = selectedItem;
                        string seat = rId + sId;
                        Response.Write(seat);
                        SqlConnection sqlCon = new SqlConnection(myCon);
                        string query="UPDATE Seat SET seatStatus='Booked' WHERE (SELECT rowId + cast((seatId) as varchar(10)) as'seatNo')='"+seat+"'";
                        sqlCon.Open();
                        SqlCommand cmd = new SqlCommand(query, sqlCon);
                        int temp = cmd.ExecuteNonQuery();
                        if (temp > 0)
                         {
                         string bookingQuery = "INSERT INTO Booking Values('" + user + "','" + mName + "','" + mDate + "'," +"\n"+
                          " '" + sTime+"',"+quantity+",'" +seat+"',"+quantity*cost+",'"+bookedDate+"')";
                        SqlCommand bookingCmd = new SqlCommand(bookingQuery, sqlCon);
                        int numberOfSeats = bookingCmd.ExecuteNonQuery();
                        Response.Write("Your Seat is Booked" +"<br>");
                         }
                         else
                         {
                             Response.Write("Your Seat is not Booked");
                         }
                    }
                }
            }
        }
        //Seat Number Population based on Row Selection
        protected void rowDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rid = rowDropDownList.SelectedItem.Text;
            string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);        
            string seatQuery = "SELECT seatId FROM Seat WHERE Seat.asmId in (SELECT id FROM AssignMovie," +"\n"+
            "Theatre,Movie WHERE AssignMovie.tid=(SELECT theatreId FROM Theatre WHERE theatreName='" + tName + "')" +"\n"+ 
           "and AssignMovie.mId=(SELECT movieId FROM Movie WHERE movieName='" + mName + "')and dateAvailable='" + mDate + "'" +"\n"+
            "and AssignMovie.movieTime='" + (sTime) + "'  and rowId='" + rid + "' and seatStatus='Available')";
            SqlDataAdapter da = new SqlDataAdapter(seatQuery, myCon);
            DataSet dataSet = new DataSet();
            da.Fill(dataSet, "Seat");
            seatListBox.DataSource = dataSet.Tables["Seat"];
            seatListBox.DataTextField = "seatId";     
            seatListBox.DataBind();
           
        }

           
        }
    }
