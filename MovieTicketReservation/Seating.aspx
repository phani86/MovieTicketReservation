<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Seating.aspx.cs" Inherits="MovieTicketReservation.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
   
    <script src="yui-min.js"></script>
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
            <p><a href="SeatBooking.aspx">Book Seat</a></p>
        </div>
      
    </div>
</div>
   
     <script type="text/javascript">
         YUI().use('tabview', function (Y) {
             var tabview = new Y.TabView({ srcNode: '#demo' });
             tabview.render();
         });
</script>
       
</asp:Content>
