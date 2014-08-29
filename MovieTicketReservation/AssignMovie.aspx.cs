/*AssignMovie.aspx.cs
   This form populates the movies and theatres in drop down lists and each movie is assigned a particular 
   theatre,date and time and all the details are inserted into database.
 
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
using System.Data;
using System.Globalization;


namespace MovieTicketReservation
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private string myCon;

       //Population of theatre and movie details form database.
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
             SqlConnection sqlcon = new SqlConnection(myCon);
            if (!Page.IsPostBack)
            {
                string query="SELECT theatreId,theatreName from Theatre";
                string query1 = "SELECT movieId,movieName from Movie";
                sqlcon.Open();
                SqlDataAdapter da=new SqlDataAdapter(query,myCon);
                SqlDataAdapter db = new SqlDataAdapter(query1, myCon);
              DataSet d1=new DataSet();
                da.Fill(d1,"Theatre");
                theatreDropDownList.DataSource=d1.Tables["Theatre"];
                theatreDropDownList.DataTextField="theatreName";
                theatreDropDownList.DataValueField="theatreId";
                theatreDropDownList.DataBind();
                db.Fill(d1, "Movie");
                movieDropDownList.DataSource = d1.Tables["Movie"];
                movieDropDownList.DataTextField = "movieName";
                movieDropDownList.DataValueField = "movieId";
                movieDropDownList.DataBind();
                }
                    
                sqlcon.Close();
            }
         
        
        //Assign button which assigns a movie to the theatre,date and time.
        protected void assignButton_Click(object sender, EventArgs e)
        {
            CultureInfo ci = CultureInfo.InvariantCulture;
            string movieName = movieDropDownList.SelectedItem.ToString();
            string theatreName = theatreDropDownList.SelectedItem.ToString();
            string dateAvailable = dateAvailableTextBox.Text;
            string time = timeTextBox.Text.ToString();
            String query = "INSERT INTO AssignMovie(tid,mid,dateAvailable,movieTime) VALUES" +"\n"+
           "((select theatreId from Theatre where theatreName='" + theatreName + "')," +"\n"+  
           "(select movieId from Movie where movieName='" + movieName + "') ,  '" + (@dateAvailable) + "','" + (@time) + "')";
            SqlConnection sqlcon = new SqlConnection(myCon);
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            sqlcon.Open();   
            try
            {
                int temp = cmd.ExecuteNonQuery();
                if (temp > 0)
                {
                    Response.Write("Movie assigned succesfully");

                }
            }
            catch
            {
                Response.Write("insertion failed");
            }
           
        }

       

       

      
      
    }
}