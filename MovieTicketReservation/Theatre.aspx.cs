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
    public partial class WebForm5 : System.Web.UI.Page
    {
        private string myCon;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string theatreId =theatreIdTextBox.Text;
            string theatreName = theatreNameTextBox.Text;
            int theatreSize =Int32.Parse(theatreSizeTextBox.Text);
            float ticketCost= float.Parse(ticketCostTextBox.Text);
            string manager = theatreManagerTextBox.Text;
            string movieId = movieIdTextBox.Text;

           
            SqlConnection sqlcon = new SqlConnection(myCon);
            sqlcon.Open();
            String query = "INSERT INTO Theatre VALUES('" + theatreId + "','" + theatreName + "','" + Int32.Parse(theatreSizeTextBox.Text) + 
                "','"+float.Parse(ticketCostTextBox.Text)+"','" + manager + "','"+movieId+"')";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            int temp = cmd.ExecuteNonQuery();
            if (temp > 0)
            {
                Response.Write("Theatre details added successfully");

            }
            else
                Response.Write("Insertion Failed");
            sqlcon.Close();
        }
    }
}