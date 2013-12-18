<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Seating.aspx.cs" Inherits="MovieTicketReservation.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
    <link href="SeatStyle.css" rel="stylesheet" type="text/css" />
   
   <%-- <script src="yui-min.js"></script>
    <div id="demo">
   
        
        <ul>
        <li><a href="#Seating">Seating Arrangement</a></li>
        <li><a href="#Booking">Book Seat</a>
        </li>
    </ul>
    <div>
        <div id="Seating">
            <p><img src="Seating.jpg" /></p>
        </div>
        <div id="Booking">
            <p><a href="SeatBooking.aspx" target="_top">Book Seat</a></p>
        </div>
      
    </div>
</div>
   
     <script type="text/javascript">
         YUI().use('tabview', function (Y) {
             var tabview = new Y.TabView({ srcNode: '#demo' });
             tabview.render();
         });
</script>--%>
    <asp:Button ID="seatArrangementTabButton" runat="server" BorderStyle="None" Text="Seat Arrangement" CssClass="Initial" OnClick="TabButton1_Click" />
    <asp:Button ID="seatBookTabButton"  runat="server" BorderStyle="None" Text="Book Seat" CssClass="Initial" OnClick="TabButton2_Click" />
    <br />
    <asp:MultiView ID="MainView" runat="server">
        
        <asp:View ID="View1" runat="server">
          <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                      <span><img src="Seating.jpg" style="background-color: #666699" /></span>
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
        
        <asp:View ID="View2" runat="server">
        <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                        <iframe src="SeatBooking.aspx" width="600" height="600" scrolling="no"></iframe>
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
        
        
        <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                    <h3>
                      View 3
                    </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
       
    
    </asp:MultiView>
    <br />
    <br />
    <br />   
</asp:Content>
