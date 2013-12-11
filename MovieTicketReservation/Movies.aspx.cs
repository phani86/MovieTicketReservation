using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace MovieTicketReservation
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            releaseDateTextBox.Text = releaseDateCalendar.SelectedDate.ToShortDateString();
        }

        protected void addButton_Click(object sender, EventArgs e)
        {
            
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string movieId = movieIdTextBox.Text;
            string movieName =movieTextBox.Text;
            string movieDirector = directorTextBox.Text;
            string actors = actorsTextBox.Text;
            string genre = genreTextBox.Text;
           
            string releaseDate = releaseDateTextBox.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
            sqlcon.Open();
            String query = "INSERT INTO Movie VALUES('" + movieId + "','" + movieName + "', '" + movieDirector + "','" + actors + "','" + genre + "', '" + releaseDate + "')";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            int temp = cmd.ExecuteNonQuery();
            if (temp > 0)
            {
                Response.Write("Movie details added successfully");

            }
            else
                Response.Write("Insertion Failed");
            sqlcon.Close();
        }

        //protected void releaseDateCalendar_SelectionChanged(object sender, EventArgs e)
        //{
        //    releaseDateTextBox.Text = releaseDateCalendar.SelectedDate.ToShortDateString();
        //}




        }
    }
