/*ViewBooking.aspx.cs
   The user can view details of booked tickets by clicking on View Booking Hyper link in a grid view.

 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.12.05: Created     

*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

namespace MovieTicketReservation
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            if (!IsPostBack)
                bindToGrid();


        }

        //Data Binding function which binds the database data to DataGridView.
        protected void bindToGrid()
        {
            
            string user = (string)(Session["User"]);
            DataSet ds = new DataSet();
            SqlDataAdapter da;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(myCon);
            conn.Open();
            da = null;

            string strsql = "Select * from Booking where regUserId='" + user + "'";

            da = new SqlDataAdapter(strsql, conn);
            da.Fill(ds, "Booking");
            BookingGridView.DataSource = ds.Tables["Booking"].DefaultView;
            BookingGridView.DataBind();
        }

       
    }
}
