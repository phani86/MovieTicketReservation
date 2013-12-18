/*Theatre.aspx.cs
   This form takes Theatre details as input data and if data is valid the details are inserted to database by administrator.
 
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
    public partial class WebForm5 : System.Web.UI.Page
    {
        private string myCon;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Submit Button which inserts Theatre details to database.
        protected void submitButton_Click(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string theatreId = theatreIdTextBox.Text;
            string theatreName = theatreNameTextBox.Text;
            int theatreSize = Int32.Parse(theatreSizeTextBox.Text);
            float ticketCost = float.Parse(ticketCostTextBox.Text);
            string manager = theatreManagerTextBox.Text;
            // string movieId = movieIdTextBox.Text;

            SqlConnection sqlcon = new SqlConnection(myCon);
            sqlcon.Open();
            String query = "INSERT INTO Theatre VALUES('" + theatreId + "','" + theatreName + "','" + Int32.Parse(theatreSizeTextBox.Text) +
                "','" + float.Parse(ticketCostTextBox.Text) + "','" + manager + "')";
            SqlCommand cmd = new SqlCommand(query, sqlcon);
            int temp = cmd.ExecuteNonQuery();
            try
            {
                if (temp > 0)
                {
                    Response.Write("Theatre details added successfully");
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
            theatreIdTextBox.Text = "";
            theatreNameTextBox.Text = "";
            theatreSizeTextBox.Text = "";
            ticketCostTextBox.Text = "";
            theatreManagerTextBox.Text = "";
        }
    }
}