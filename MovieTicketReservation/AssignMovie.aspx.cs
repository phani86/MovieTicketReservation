using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace MovieTicketReservation
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
             SqlConnection sqlcon = new SqlConnection(myCon);
            if (!Page.IsPostBack)
            {
                string query="SELECT theatreId,theatreName from Theatre"; 
 
               
                sqlcon.Open();

                //SqlCommand cmd = new SqlCommand(query, sqlcon);
                //SqlDataReader dataReader = cmd.ExecuteReader();
                //if (dataReader.HasRows)
                //{
                //    while (dataReader.Read())
                //    {
                //        theatreDropDownList.Items.Add(dataReader.GetValue(0).ToString());
                //      //  movieDropDownList.Items.Add(dataReader.GetValue(1).ToString());
                        
                       
                //    }
                SqlDataAdapter da=new SqlDataAdapter(query,myCon);
              DataSet d1=new DataSet();
                da.Fill(d1,"Theatre");
                theatreDropDownList.DataSource=d1.Tables["Theatre"];
                theatreDropDownList.DataTextField="theatreName";
                theatreDropDownList.DataValueField="theatreId";
                theatreDropDownList.DataBind();
                

                }
              
          //      dataReader.Close();
          
                
              //  string query2 = "SELECT theatreName FROM Theatre";
              ////  SqlConnection sqlcon = new SqlConnection(myCon);
              //  //sqlcon.Open();

              //  SqlCommand cmd2 = new SqlCommand(query2, sqlcon);
              //  SqlDataReader dataReader2 = cmd2.ExecuteReader();
              //  if (dataReader2.HasRows)
              //  {
              //      while (dataReader2.Read())
              //      {
              //          theatreDropDownList.Items.Add(dataReader2.GetValue(0).ToString());
              //      }
              //  }

              //  dataReader2.Close();
               // sqlcon.Close();
               // theatreDropDownList.DataSource = dataReader.GetValue(0).ToString();
                //theatreDropDownList.DataTextField = "theatreName";
                //theatreDropDownList.DataBind();
              //  dataReader.Close();
                sqlcon.Close();
            }
           // dateAvailableTextBox.Text = dateCalendar.SelectedDate.ToString();
        
        protected void movieDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            //SqlConnection sqlcon = new SqlConnection(myCon);
            //string query = "select movieName from Movie,Theatre where theatre.mid=movie.movieId";
            //sqlcon.Open();

            //SqlCommand cmd = new SqlCommand(query, sqlcon);
            //SqlDataReader dataReader = cmd.ExecuteReader();
            //if (dataReader.HasRows)
            //{
            //    while (dataReader.Read())
            //    {

            //        if (theatreDropDownList.SelectedItem.ToString() == dataReader.GetValue(0).ToString())
            //        {
            //            movieDropDownList.Items.Add(dataReader.GetValue(1).ToString());
            //        }
            //    }
            //}
            //dataReader.Close();

        }
        protected void assignButton_Click(object sender, EventArgs e)
        {
            string movieName = movieDropDownList.SelectedItem.ToString();
            string theatreName = theatreDropDownList.SelectedItem.ToString();
            dateAvailableTextBox.Text = dateCalendar.SelectedDate.ToShortDateString();
            string dateAvailable = dateAvailableTextBox.Text;
            string time = timeTextBox.Text;
            String query = "INSERT INTO AssignMovie VALUES('" + theatreName + "','" + movieName + "', '" + dateAvailable + "','" + timeTextBox.Text + "')";
            SqlConnection sqlcon = new SqlConnection(myCon);
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            sqlcon.Open();
            int temp = cmd.ExecuteNonQuery();
            if (temp > 0)
            {
                Response.Write("Movie assigned succesfully");

            }
            else
                Response.Write("insertion failed");
        }

       

        protected void theatreDropDownList_SelectedIndexChanged1(object sender, EventArgs e)
        {
            string tname = theatreDropDownList.SelectedItem.Text;
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            SqlConnection sqlcon = new SqlConnection(myCon);


            string query = "select movieName from Movie,Theatre where Theatre.mid = Movie.movieId and theatreName='"+ tname +"'";
            sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, myCon);
            DataSet d1 = new DataSet();
            da.Fill(d1, "Movie");
            movieDropDownList.DataSource = d1.Tables["Movie"];
            movieDropDownList.DataTextField = "movieName";
            //movieDropDownList.DataValueField = "movieId";
            movieDropDownList.DataBind();

            //sqlcon.Open();

            //SqlCommand cmd = new SqlCommand(query, sqlcon);
            //SqlDataReader dataReader = cmd.ExecuteReader();
            //if (dataReader.HasRows)
            //{
            //    while (dataReader.Read())
            //    {

            //        movieDropDownList.DataSource = dataReader;
            //       movieDropDownList.DataValueField = "movieId";
            //        movieDropDownList.DataTextField = "movieName";
            //        movieDropDownList.DataBind();
            //       // movieDropDownList.Items.Add(dataReader.GetValue(0).ToString());

            //    }
            //}
            //dataReader.Close();
            sqlcon.Close();
        }

      
      
    }
}