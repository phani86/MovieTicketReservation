/*UserHome.aspx.cs
  User Home Page where user can book tickets based on theatre,movie,date and timings of movie of his choice
  based on selected options from drop down list.
   
  Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.12.25: Created     

*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace MovieTicketReservation
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        private string myCon;

        //Population of Theatres from AssignMovie Table
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string user = (string)(Session["User"]);
            Response.Write("Welcome:" + user);
            if (!Page.IsPostBack)
            {             
                string query = "SELECT distinct theatreName FROM AssignMovie,Theatre where Theatre.theatreId=AssignMovie.tid";              
                SqlConnection sqlcon = new SqlConnection(myCon);
                sqlcon.Open();                
                SqlCommand cmd = new SqlCommand(query, sqlcon);
               
                SqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.HasRows)
                {
                    
                    while (dataReader.Read())
                    {
                        theatreDropDownList.Items.Add(dataReader.GetValue(0).ToString());
                                             
                    }
                    dataReader.Close();
                }
            }
        }

        //Population of movie from selected theatre.
        protected void theatreDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            movieDropDownList.Items.Clear();    
            string tname = theatreDropDownList.SelectedItem.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
            string query = "SELECT distinct movieName FROM AssignMovie,Theatre,Movie where" +"\n"+
            "(Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='"+tname+"')) and AssignMovie.mId=Movie.movieId";
            sqlcon.Open();
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            SqlDataReader dataReader = cmd.ExecuteReader();
            if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        movieDropDownList.Items.Add(dataReader.GetValue(0).ToString());                    
                    }
                }
                dataReader.Close();
        }

        //Population of date baased on the selected theatre and movie.
        protected void movieDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            dateDropDownList.Items.Clear();
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName=movieDropDownList.SelectedItem.Text;
            string query = "SELECT distinct dateAvailable FROM AssignMovie,Theatre,Movie where" +"\n"+
            "(Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='" + tname + "'))"+"\n"+ 
            "and AssignMovie.mId in(select movieId from Movie where movieName='"+movieName+"')";

            SqlDataAdapter da = new SqlDataAdapter(query, myCon);
            DataSet d1 = new DataSet();
            da.Fill(d1, "AssignMovie");
            dateDropDownList.DataSource = d1.Tables["AssignMovie"];
         
            dateDropDownList.DataTextField = "dateAvailable";
           dateDropDownList.DataTextFormatString = "{0:MM/dd/yyyy}";
           DateTime todayDate = new DateTime();
           string dt = todayDate.ToShortDateString();
        
            dateDropDownList.DataBind();
        }

        protected void dateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {

            showDropDownList.Items.Clear();
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName = movieDropDownList.SelectedItem.Text;
          
            string movieDate = dateDropDownList.SelectedItem.Text;
            DateTime todayDate=DateTime.Now;
            string dt = todayDate.ToShortDateString();
        
           if (dt.CompareTo(movieDate) < 0)
           {
               Response.Write(movieDate);

               string query = "SELECT distinct movieTime FROM AssignMovie,Theatre,Movie where" +"\n"+
              " (Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='" + tname + "')) " +"\n"+
               "and AssignMovie.mId in(select movieId from Movie where movieName='" + movieName + "') and dateAvailable='" + movieDate + "'";
               SqlDataAdapter da = new SqlDataAdapter(query, myCon);
               DataSet d1 = new DataSet();
               da.Fill(d1, "AssignMovie");
               showDropDownList.DataSource = d1.Tables["AssignMovie"];            
               showDropDownList.DataTextField = "movieTime";
               showDropDownList.DataBind();
           }
           else
           {
               Response.Write("Todays date is later than reservation date");
               Response.Redirect("UserHome.aspx");
           }

           }


        protected void bookButton_Click(object sender, EventArgs e)
        {
          
                string tName = theatreDropDownList.SelectedItem.Text;
                string mName = movieDropDownList.SelectedItem.Text;                
                string mDate = dateDropDownList.SelectedItem.Text;
                string sTime = showDropDownList.SelectedItem.Text;
                int quantity = int.Parse(quantityDropDownList.SelectedItem.Value);
                float cost = float.Parse(costDropDownList.SelectedItem.Value);
                Session.Add("Theatre", tName);
                Session.Add("Movie", mName);
                Session.Add("Date", mDate);
                Session.Add("Time", sTime);
                Session.Add("Quantity", quantity);
                Session.Add("Cost", cost);
                Server.Transfer("Seating.aspx");
           
        }

        protected void quantityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            costDropDownList.Items.Clear();
            string tname = theatreDropDownList.SelectedItem.Text;
            string query = "SELECT ticketCost FROM Theatre where theatreName='"+tname +"'";           
            SqlDataAdapter da = new SqlDataAdapter(query, myCon);
            DataSet dataSet = new DataSet();
            da.Fill(dataSet, "Theatre");
            costDropDownList.DataSource = dataSet.Tables["Theatre"];
            costDropDownList.DataTextField= "ticketCost";
            costDropDownList.DataBind();
        }
    }
}