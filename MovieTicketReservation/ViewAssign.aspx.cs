/* ViewAssign.aspx.cs
   This form displays the assigned movie details in a datagrid. 
 
   Revision History
              Srinivasa Phanindra Valluri, Puneet Kalva, 2013.12.15: Created     

*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace MovieTicketReservation
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private string myCon;
        protected void Page_Load(object sender, EventArgs e)
        {
            myCon = ConfigurationManager.AppSettings["MovieTicketReservation"];
            if (!Page.IsPostBack)
                bindToGrid();
        }

        //Data Binding function which binds the database data to DataGridView.
        protected void bindToGrid()
        {

            DataSet ds = new DataSet();
            SqlDataAdapter da;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(myCon);
            conn.Open();
            da = null;
            string strsql = "Select * from AssignMovie";
            da = new SqlDataAdapter(strsql, conn);
            da.Fill(ds, "AssignMovie");
            assignMovieGridView.DataSource = ds.Tables["AssignMovie"].DefaultView;
            assignMovieGridView.DataBind();
        }
    }
}