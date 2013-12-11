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

        protected void submitButton_Click(object sender, EventArgs e)
        {
          
            
                 myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];


                string userId = userIdTextBox.Text;         
                string firstName = firstNameTextBox.Text;
                string lastName = lastNameTextBox.Text;
                string password="";
                if (passwordTextBox.Text == confirmPasswordTextBox.Text) password +=passwordTextBox.Text;
                string phoneNumber=phoneNumberTextBox.Text;
                string emailId = emailIdTextBox.Text;
                string address = addressTextBox.Text;
                string gender="";
                   if (maleRadioButton.Checked == true)
                    {
                      gender += maleRadioButton.Text;
                   }
                   else gender += femaleRadioButton.Text;
                   SqlConnection sqlcon=new SqlConnection(myCon);
                    sqlcon.Open();

                   //cmd.Connection = sqlcon;

                    String query="INSERT INTO RegisteredUser VALUES('"+userId+"','"+firstName+"', '"+lastName+"','"+password+"','"+phoneNumber+"', '"+emailId+"','"+address+"','"+gender+"')";
                    SqlCommand cmd = new SqlCommand(query, sqlcon);
                    int temp = cmd.ExecuteNonQuery();

                 
                    if (temp > 0)
                    {
                    
                        Response.Write("User data inserted successfully");
                    }
                    else
                        
                        Response.Write("User Data insertion failed");
                            
                 sqlcon.Close();    
                }
            }
        }
    
