/*Home.aspx.cs
   The ticket avilability status can be viewed for unregistered users, admin can login with his credentials,
   and existing user can sign in.

 
   Revision History
              Puneet Kalva, 2013.11.15: Created
              Srinivasa Phanindra Valluri, 2013.11.30:modified.

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
using System.Web.Configuration;


namespace MovieTicketReservation
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string myCon;

        //Population of theatres from assigned movies table.
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
               if (!Page.IsPostBack)
                {
                   // theatreDropDownList.Items.Clear();
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
            catch(Exception ex)
            {
               
                Response.Write("Connection Unsuccessful") ;
            }
            //theatreDropDownList.Items.Clear(); 
        }

        //Population of avilable movies in selected theatre.
        protected void theatreDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
                string tname = theatreDropDownList.SelectedItem.Text;
                movieDropDownList.Items.Clear();
                    SqlConnection sqlcon = new SqlConnection(myCon);
                    string query = "SELECT distinct movieName FROM AssignMovie,Theatre,Movie where" + "\n" +
                    "(Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='" + tname + "')) and AssignMovie.mId=Movie.movieId";
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

        //To check the availability of tickets for selected movie,theatre,date and timings of movie.
        protected void checkAvilabilityButton_Click(object sender, EventArgs e)
        {
            availabilityTextBox.Text = "";
            string tName = theatreDropDownList.SelectedItem.Text;
            string mName = movieDropDownList.SelectedItem.Text;
            string mDate = dateDropDownList.SelectedItem.Text;
            string sTime = timingsDropDownList.SelectedItem.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
            string query = "SELECT count(*) from seat Where Seat.asmId in"+"\n"+ 
            "(select id from AssignMovie,Theatre,Movie where AssignMovie.tid= (select theatreId from Theatre where theatreName='" + tName + "')" +"\n"+
            "and AssignMovie.mId=(select movieId from Movie where movieName='" + mName + "')"+"\n"+ 
            "and dateAvailable='" + mDate + "' and AssignMovie.movieTime='" + (sTime) + "' and seatStatus='Available')";
            try
            {
                sqlcon.Open();
                SqlCommand cmd = new SqlCommand(query, sqlcon);
                int temp = Convert.ToInt32(cmd.ExecuteScalar());
                if (temp > 0)
                {
                    availabilityTextBox.Text = cmd.ExecuteScalar().ToString();
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Tickets not Available');</script>");
                }
                
            }

            catch (SqlException sqlex)
            {
                Response.Write(sqlex.ToString());
            }
          
                
            finally
            {
                sqlcon.Close();
            }
        }

        //User validation to check if he is an existing user or administrator.
        protected void loginButton_Click(object sender, EventArgs e)
        {
          
            string userId = userIdTextBox.Text;
            string password = passwordTextBox.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
            try
            {
                sqlcon.Open();
                string query = "SELECT userId,password FROM RegisteredUser";
                SqlCommand cmd = new SqlCommand(query, sqlcon);
                SqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.HasRows)
                {
                    while (dataReader.Read())
                    {
                        if (userId == dataReader.GetValue(0).ToString() &&
                            password == dataReader.GetValue(1).ToString())
                        {
                            Session.Add("user", userId);
                            Server.Transfer("UserHome.aspx");
                        }

                    }
                }


                if (userId == "admin" && password == "admin123")
                {
                    Response.Redirect("AdminHome.aspx");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Invalid login');</script>");
                }
            }
            catch (SqlException sqlex)
            {
                Response.Write(sqlex.ToString());

            }
            
            finally
            {
            sqlcon.Close();
            }
        }

        //Population of availability dates of selected movie in theatre
        protected void movieDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName = movieDropDownList.SelectedItem.Text;
            dateDropDownList.Items.Clear();
            string query = "SELECT distinct dateAvailable FROM AssignMovie,Theatre,Movie where" +"\n"+
            "(Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='" + tname + "'))" +"\n"+
            "and AssignMovie.mId in(select movieId from Movie where movieName='" + movieName + "')";

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

        //Population of timings of movie for selected movie in theatre on the selected date
        protected void dateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName = movieDropDownList.SelectedItem.Text;
            string movieDate = dateDropDownList.SelectedItem.Text;
            timingsDropDownList.Items.Clear();
            DateTime todayDate = DateTime.Now;
            string dt = todayDate.ToShortDateString();
          
            if (dt.CompareTo(movieDate) < 0)
            {
                Response.Write(movieDate);
                string query = "SELECT distinct movieTime FROM AssignMovie,Theatre,Movie where" +"\n"+
                "(Theatre.theatreId in (select tid from AssignMovie,Theatre where theatreName='" + tname + "'))" +"\n"+
                "and AssignMovie.mId in(select movieId from Movie where movieName='" + movieName + "') and dateAvailable='" + movieDate + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, myCon);
                DataSet d1 = new DataSet();
                da.Fill(d1, "AssignMovie");
               timingsDropDownList.DataSource = d1.Tables["AssignMovie"];               
               timingsDropDownList.DataTextField = "movieTime";            
               timingsDropDownList.DataBind();
            }
            else
            {
                Response.Write("Todays date is later than reservation date");
                Response.Redirect("UserHome.aspx");
            }

        }

       
    }
}