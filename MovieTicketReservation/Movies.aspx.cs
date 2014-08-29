/*Movies.aspx.cs
   This form takes movie details as input data and if data is valid the details are inserted to database
   by administrator.
 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.11.20: Created     

*/
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
            //releaseDateTextBox.Text = releaseDateCalendar.SelectedDate.ToShortDateString();
        }

        //Add Button which inserts movie details to database.
        protected void addButton_Click(object sender, EventArgs e)
        {

            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string movieId = movieIdTextBox.Text.Trim();
            string movieName =movieTextBox.Text.Trim();
            string movieDirector = directorTextBox.Text.Trim();
            string actors = actorsTextBox.Text.Trim() ;
            string genre = genreTextBox.Text.Trim();
           
            string releaseDate = releaseDateTextBox.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
            sqlcon.Open();
            String query = "INSERT INTO Movie VALUES('" + movieId + "','" + movieName + "', '" + movieDirector + "','" + actors + "','" + genre + "', '" + releaseDate + "')";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            try
            {
                int temp = cmd.ExecuteNonQuery();
                if (temp > 0)
                {
                    Response.Write("Movie details added successfully");

                }
            }
            catch
            {
                Response.Write("Insertion Failed");
            }
                sqlcon.Close();
        }

        //Clear button which clears the input data.
        protected void clearButton_Click(object sender, EventArgs e)
        {
            movieIdTextBox.Text = "";
            movieTextBox.Text = "";
            directorTextBox.Text = "";
            actorsTextBox.Text = "";
            genreTextBox.Text = "";
        }

        




        }
    }
