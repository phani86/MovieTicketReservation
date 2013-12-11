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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
                
        }

        protected void checkAvilabilityButton_Click(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    if (theatreDropDownList.SelectedIndex == 0)
            //        theatreRequiredFieldValidator.ErrorMessage = "Theatre should be selected";
            //}
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string userId = userIdTextBox.Text;
            string password = passwordTextBox.Text;
            SqlConnection sqlcon = new SqlConnection(myCon);
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
                 dataReader.Close();
             }
             if (userId == "admin" && password == "admin123")
             {
                 Response.Redirect("AdminHome.aspx");
             }
            else Response.Write("Invalid login");
             sqlcon.Close();

        }
    }
}