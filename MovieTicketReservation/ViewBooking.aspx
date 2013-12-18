<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewBooking.aspx.cs" Inherits="MovieTicketReservation.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
<br />


    
    
    
    &nbsp;<asp:GridView ID="BookingGridView" runat="server"  Width="708px" Height="106px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField AccessibleHeaderText="bookingId" DataField="bookingId" HeaderText="Booking Id" />
                <asp:BoundField AccessibleHeaderText="User Id" DataField="regUserId" HeaderText="User Id" />
                <asp:BoundField AccessibleHeaderText="Movie Name" DataField="movieName" HeaderText="Movie Name" />
                <asp:BoundField AccessibleHeaderText="Movie Date" DataField="movieDate" HeaderText="Movie Date" />
                <asp:BoundField AccessibleHeaderText="Movie Time" DataField="timeOfShow" HeaderText="Movie Time" />
                <asp:BoundField AccessibleHeaderText="Number Of Tickets" DataField="numberOfTickets" HeaderText="Number Of Tickets" />
                <asp:BoundField AccessibleHeaderText="Seat No" DataField="seatNo" HeaderText="Seat No" />
                <asp:BoundField AccessibleHeaderText="Total Cost" DataField="totalCost" DataFormatString="{0:c}" HeaderText="Total Cost" />
                <asp:BoundField AccessibleHeaderText="Booked Date" DataField="bookedDate" HeaderText="Booked Date" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            
          
        </asp:GridView>
    </p>
    <br />
    <br />
    
</asp:Content>
