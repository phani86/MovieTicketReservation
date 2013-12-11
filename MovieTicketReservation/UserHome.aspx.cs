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
    public partial class WebForm11 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string user = (string)(Session["User"]);
            Response.Write(user);
            if (!Page.IsPostBack)
            {
             
                string query = "SELECT tName FROM AssignMovie";
              
                SqlConnection sqlcon = new SqlConnection(myCon);
                sqlcon.Open();
                
                SqlCommand cmd = new SqlCommand(query, sqlcon);
               
                SqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.HasRows)
                {
                    
                    while (dataReader.Read())
                    {
                        theatreDropDownList.Items.Add(dataReader.GetValue(0).ToString());
                        //movieDropDownList.Items.Add(dataReader.GetValue(1).ToString());
                        //dateDropDownList.Items.Add(dataReader.GetValue(2).ToString());
                        //showDropDownList.Items.Add(dataReader.GetValue(3).ToString());
                       

                    }
                    dataReader.Close();
                }
               

            }
        }

        protected void theatreDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            
            
            string tname = theatreDropDownList.SelectedItem.Text;
            //string query="SELECT mName,dateAvailable,movieTime FROM AssignMovie Where tName='"+tname+"'";
             //SqlConnection sqlcon = new SqlConnection(myCon);
             //   sqlcon.Open();
                
             //   SqlCommand cmd = new SqlCommand(query, sqlcon);
             //   SqlDataReader dataReader = cmd.ExecuteReader();
             //   if (dataReader.HasRows)
             //   {

             //       while (dataReader.Read())
             //       {
             //           movieDropDownList.Items.Add(dataReader.GetValue(0).ToString());
             //           //dateDropDownList.Items.Add(dataReader.GetValue(1).ToString());
             //           //showDropDownList.Items.Add(dataReader.GetValue(2).ToString());
             //       }
             //   }
             //   dataReader.Close();
                SqlConnection sqlcon = new SqlConnection(myCon);


                string query = "SELECT mName FROM AssignMovie Where tName='"+tname+"'";
                sqlcon.Open();
                SqlDataAdapter da = new SqlDataAdapter(query, myCon);
                DataSet d1 = new DataSet();
                da.Fill(d1, "AssignMovie");
                movieDropDownList.DataSource = d1.Tables["AssignMovie"];
                movieDropDownList.DataTextField = "mName";
               // dateDropDownList.DataTextField = "dateAvailable";
                //showDropDownList.DataTextField = "movieTime";
                //movieDropDownList.DataValueField = "movieId";
                movieDropDownList.DataBind();
                //dateDropDownList.DataBind();
                //showDropDownList.DataBind();
        }

        protected void movieDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName=movieDropDownList.SelectedItem.Text;
            string query = "SELECT dateAvailable FROM AssignMovie Where tName='"+tname+"' and mName='"+movieName+"'";
            //sqlcon.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, myCon);
            DataSet d1 = new DataSet();
            da.Fill(d1, "AssignMovie");
            dateDropDownList.DataSource = d1.Tables["AssignMovie"];
           // movieDropDownList.DataTextField = "mName";
            dateDropDownList.DataTextField = "dateAvailable";
           // dateDropDownList.DataTextFormatString = "{0:yyyy-MM-dd}";
            //showDropDownList.DataTextField = "movieTime";
            dateDropDownList.DataBind();
        }

        protected void dateDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           // System.IFormatProvider ifpformat = new System.Globalization.CultureInfo("en-US", true);
            string tname = theatreDropDownList.SelectedItem.Text;
            string movieName = movieDropDownList.SelectedItem.Text;
            //DateTime movieDate = DateTime.ParseExact(dateDropDownList.SelectedItem.Text,"YYYY-MM-DD",CultureInfo.GetCultureInfo("en-us"));
            string movieDate = dateDropDownList.SelectedItem.Text;
         
            Response.Write(movieDate);

            string query = "SELECT movieTime FROM AssignMovie Where tName='" + tname + "' and mName='" + movieName + "' and dateAvailable='"+movieDate+"'";
            SqlDataAdapter da = new SqlDataAdapter(query, myCon);
            DataSet d1 = new DataSet();
            da.Fill(d1, "AssignMovie");
            showDropDownList.DataSource = d1.Tables["AssignMovie"];
            // movieDropDownList.DataTextField = "mName";
            //  dateDropDownList.DataTextField = "dateAvailable";
            showDropDownList.DataTextField = "movieTime";
            //  dateDropDownList.DataBind();
            showDropDownList.DataBind();
        }

        protected void bookButton_Click(object sender, EventArgs e)
        {
            
            string tName = theatreDropDownList.SelectedItem.Text;
            string mName = movieDropDownList.SelectedItem.Text;
            string mDate = dateDropDownList.SelectedItem.Text;
            string sTime = showDropDownList.SelectedItem.Text;
            int quantity = Convert.ToInt32(quantityDropDownList.SelectedItem.Value);
            float cost = float.Parse(costDropDownList.SelectedItem.Value);
            Session.Add("Theatre", tName);
            Session.Add("Movie", mName);
            Session.Add("Date", mDate);
            Session.Add("Time",sTime);
            Session.Add("Quantity", quantity);
            Session.Add("Cost", cost);
            Server.Transfer("Seating.aspx");
        }

        protected void quantityDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tname = theatreDropDownList.SelectedItem.Text;
            string query = "SELECT ticketCost FROM Theatre where theatreName='"+tname +"'";

            SqlConnection sqlcon = new SqlConnection(myCon);
            sqlcon.Open();

            SqlCommand cmd = new SqlCommand(query, sqlcon);

            SqlDataReader dataReader = cmd.ExecuteReader();
            if (dataReader.HasRows)
            {

                while (dataReader.Read())
                {
                    //theatreDropDownList.Items.Add(dataReader.GetValue(0).ToString());
                    costDropDownList.Items.Add(dataReader.GetValue(0).ToString());


                }
                dataReader.Close();
            }
               
        }
    }
}