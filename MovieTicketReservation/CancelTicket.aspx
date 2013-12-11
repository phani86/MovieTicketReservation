<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CancelTicket.aspx.cs" Inherits="MovieTicketReservation.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:Label ID="reservationNumberLabel" runat="server" Text="Enter Reservation No" style="margin-left:10px" ></asp:Label>
    <asp:TextBox ID="reservationNumberTextBox" runat="server" style="margin-left: 50px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="userIdLabel" runat="server" Text="Enter User Id" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="userIdTextBox" runat="server" style="margin-left: 95px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="cancelButton" runat="server" style="margin-left: 17px" Text="Cancel" />
    <br />
    <br />
</asp:Content>
