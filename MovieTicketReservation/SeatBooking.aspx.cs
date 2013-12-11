using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MovieTicketReservation
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);
            int quantity = (int)(Session["Quantity"]);
            float cost = (float)(Session["Cost"]);
            Response.Write(tName);
            Response.Write(mName);
            Response.Write(mDate);
            Response.Write(sTime);

           // myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];

            if (!Page.IsPostBack)
            {
                SqlConnection sqlcon = new SqlConnection(myCon);
                string query = "SELECT distinct rowId from Seat Where tName='" + tName + "'  and mName='" + mName + "'  and mDate='" + mDate + "' and showTime='" + sTime + "' and seatStatus='Available' ";
                sqlcon.Open();

                //SqlCommand cmd = new SqlCommand(query,sqlcon);
                //SqlDataReader dataReader = cmd.ExecuteReader();

                //if (dataReader.HasRows)
                //{
                //    while (dataReader.Read())
                //    {

                //               //rowDropDownList.DataSource = dataReader;
                //               //rowDropDownList.DataValueField = "movieId";
                //               //rowDropDownList.DataTextField = "rowId";
                //               //rowDropDownList.DataBind();
                //        rowDropDownList.Items.Add(dataReader.GetValue(0).ToString());
                //     // seatNumberDropDownList.Items.Add(dataReader.GetValue(1).ToString());

                //    }
                //}
                //dataReader.Close();


                SqlDataAdapter da = new SqlDataAdapter(query, myCon);
                DataSet d1 = new DataSet();
                da.Fill(d1, "Seat");
                rowDropDownList.DataSource = d1.Tables["Seat"];
                rowDropDownList.DataTextField = "rowId";
                //movieDropDownList.DataValueField = "movieId";
                rowDropDownList.DataBind();
                sqlcon.Close();

            }


        }

        //protected void rowDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string rid = rowDropDownList.SelectedItem.Text;
        //    string tName = (string)(Session["Theatre"]);
        //    string mName = (string)(Session["Movie"]);
        //    string mDate = (string)(Session["Date"]);
        //    string sTime = (string)(Session["Time"]);
        //    string query = "SELECT seatId from Seat Where tName='" + tName + "'  and mName='" + mName + "'  and mDate='" + mDate + "' and showTime='" + sTime + "' and rowId='" + rid + "' and seatStatus='Available'";

        //    SqlDataAdapter da = new SqlDataAdapter(query, myCon);
        //    DataSet d1 = new DataSet();
        //    da.Fill(d1, "Seat");
        //    seatDropDownList.DataSource = d1.Tables["Seat"];
        //    seatDropDownList.DataTextField = "seatId";
        //    //movieDropDownList.DataValueField = "movieId";
        //    seatDropDownList.DataBind();
        //  //  sqlcon.Close();



        //}

       
        protected void confirmButton_Click(object sender, EventArgs e)
        {
           //  string user = (string)(Session["User"]);
           //  string tName = (string)(Session["Theatre"]);
           // string mName = (string)(Session["Movie"]);
           // string mDate = (string)(Session["Date"]);
           // string sTime = (string)(Session["Time"]);
           // int quantity = (int)(Session["Quantity"]);
           // float cost = (float)(Session["Cost"]);
           // string rId = rowDropDownList.SelectedItem.Text;
           //// string sId = seatDropDownList.SelectedItem.Text;
           //// string seat = rId + sId;
           // Response.Write(seat);
           // SqlConnection sqlcon = new SqlConnection(myCon);
           // string query="UPDATE Seat SET seatStatus='Booked' WHERE (SELECT rowId + cast((seatId) as varchar(10)) as'seatNo')='"+seat+"'";
           // sqlcon.Open();
           // SqlCommand cmd = new SqlCommand(query, sqlcon);
           // int temp = cmd.ExecuteNonQuery();
           // if (temp > 0)
           // {
                
           //     string query1 = "INSERT INTO Booking Values('" + user + "','" + mName + "','" + mDate + "','" + sTime+"',"+quantity+",'" +seat+"',"+quantity*cost+")";
           //     SqlCommand cmd2 = new SqlCommand(query1, sqlcon);
           //     int temp1 = cmd2.ExecuteNonQuery();
           //     Response.Write("Your Seat is Booked");

           // }
           // else
           // {
           //     Response.Write("Your Seat is not Booked");
           // }
           // sqlcon.Close();
            string rId = rowDropDownList.SelectedItem.Text;
            string sId = seatListBox.SelectedItem.Text;
            string user = (string)(Session["User"]);
             string tName = (string)(Session["Theatre"]);
            string mName = (string)(Session["Movie"]);
            string mDate = (string)(Session["Date"]);
            string sTime = (string)(Session["Time"]);
            int quantity = (int)(Session["Quantity"]);
            float cost = (float)(Session["Cost"]);
            // string rId = rowDropDownList.SelectedItem.Text;
           // string seat;
            if (seatListBox.Items.Count > 0)
            {
                for (int i = 0; i <seatListBox.Items.Count; i++)
                {
                    if (seatListBox.Items[i].Selected)
                    {
                        string selectedItem = seatListBox.Items[i].Text;
                        //insert command
                        sId = selectedItem;
                        string seat = rId + sId;
                        Response.Write(seat);
                        SqlConnection sqlcon = new SqlConnection(myCon);
                        string query="UPDATE Seat SET seatStatus='Booked' WHERE (SELECT rowId + cast((seatId) as varchar(10)) as'seatNo')='"+seat+"'";
                        sqlcon.Open();
                        SqlCommand cmd = new SqlCommand(query, sqlcon);
                        int temp = cmd.ExecuteNonQuery();
                        if (temp > 0)
                         {

                             string query1 = "INSERT INTO Booking Values('" + user + "','" + mName + "','" + mDate + "','" + sTime+"',"+quantity+",'" +seat+"',"+quantity*cost+")";
                             SqlCommand cmd2 = new SqlCommand(query1, sqlcon);
                             int temp1 = cmd2.ExecuteNonQuery();
                             Response.Write("Your Seat is Booked");

                         }
                         else
                         {
                             Response.Write("Your Seat is not Booked");
                         }
                    }
                }
            }
        }

        protected void rowDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string rid = rowDropDownList.SelectedItem.Text;
                string tName = (string)(Session["Theatre"]);
              string mName = (string)(Session["Movie"]);
                string mDate = (string)(Session["Date"]);
                string sTime = (string)(Session["Time"]);
                string query = "SELECT seatId from Seat Where tName='" + tName + "'  and mName='" + mName + "'  and mDate='" + mDate + "' and showTime='" + sTime + "' and rowId='" + rid + "' and seatStatus='Available'";

                SqlDataAdapter da = new SqlDataAdapter(query, myCon);
                DataSet d1 = new DataSet();
                da.Fill(d1, "Seat");
                seatListBox.DataSource = d1.Tables["Seat"];
                seatListBox.DataTextField = "seatId";
                //movieDropDownList.DataValueField = "movieId";
                seatListBox.DataBind();
            //    seatDropDownList.DataBind();
            //  //  sqlcon.Close();
        }

     
       

           
        }
    }
