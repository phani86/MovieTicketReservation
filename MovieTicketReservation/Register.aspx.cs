/*Register.aspx.cs
  The new user can register to web site by completing the online registration form.

 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.11.15: Created     

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Odbc;
using System.Configuration;

namespace MovieTicketReservation
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private string myCon;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Submit which handles the Registration Process of a new user.
        protected void submitButton_Click(object sender, EventArgs e)
        {
          
            
                 myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
                string userId = userIdTextBox.Text.Trim();         
                string firstName = firstNameTextBox.Text.Trim();
                string lastName = lastNameTextBox.Text.Trim();
                string password="";
                if (passwordTextBox.Text == confirmPasswordTextBox.Text) password +=passwordTextBox.Text;
                string phoneNumber=phoneNumberTextBox.Text.Trim();
                string emailId = emailIdTextBox.Text.Trim();
                string address = addressTextBox.Text.Trim();
                string gender="";
                   if (maleRadioButton.Checked == true)
                    {
                      gender += maleRadioButton.Text.Trim();
                   }
                   else gender += femaleRadioButton.Text.Trim();
                   SqlConnection sqlcon=new SqlConnection(myCon);
                    sqlcon.Open();

                   //cmd.Connection = sqlcon;
                    String query="INSERT INTO RegisteredUser VALUES('"+userId+"','"+firstName+"'," +"\n"+
           " '"+lastName+"','"+password+"','"+phoneNumber+"', '"+emailId+"','"+address+"','"+gender+"')";
                    SqlCommand cmd = new SqlCommand(query, sqlcon);
                    try
                    {
                        int temp = cmd.ExecuteNonQuery();
                        if (temp > 0)
                        {

                            Response.Write(@"<script language='javascript'>alert('Regitration Successful');</script>");
                        }
                    }
                    catch
                    {

                        Response.Write(@"<script language='javascript'>alert('Registration failed');</script>");
                    }       
                 sqlcon.Close();    
                }

        
        //Clear button which clears the input data.
        protected void clearButton_Click(object sender, EventArgs e)
        {
            userIdTextBox.Text = "";
            firstNameTextBox.Text = "";
            lastNameTextBox.Text = "";
            passwordTextBox.Text = "";
            confirmPasswordTextBox.Text = "";
            phoneNumberTextBox.Text = "";
            emailIdTextBox.Text = "";
            addressTextBox.Text = "";
            if (maleRadioButton.Checked == true) maleRadioButton.Checked = false;
            if (femaleRadioButton.Checked == true) femaleRadioButton.Checked = false;

        }

       
            }
        }
    
