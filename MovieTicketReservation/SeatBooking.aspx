<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SeatBooking.aspx.cs" Inherits="MovieTicketReservation.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="height: 248px; width: 1243px">
        &nbsp;
        <br />
        <asp:Label ID="rowLabel" runat="server" Text="Select Row"></asp:Label>
        <asp:DropDownList ID="rowDropDownList" runat="server" style="margin-left: 141px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="rowDropDownList_SelectedIndexChanged">
            <asp:ListItem>Select Row</asp:ListItem>
        </asp:DropDownList>
       <br />
        <br />

        <asp:Label ID="seatNumberLabel" runat="server" Text="Select Seat No"></asp:Label>
      
        <asp:ListBox ID="seatListBox" runat="server" SelectionMode="Multiple" style="margin-left: 115px" Width="200px" Height="200px"  overflow="scroll"></asp:ListBox><br />
     <asp:Button ID="confirmButton" runat="server" style="margin-left: 87px" Text="Confirm" OnClick="confirmButton_Click" />
        <br />
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
   
        
    
    
         &nbsp;&nbsp;&nbsp;
    
    
         <br />
        <br />
    
    
    </p>
    
    
</asp:Content>
