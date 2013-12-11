<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="MovieTicketReservation.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    &nbsp;&nbsp;
    <asp:Label ID="movieIdLabel" runat="server" Text="Movie Id"></asp:Label>
    <asp:TextBox ID="movieIdTextBox" runat="server" style="margin-left: 65px"></asp:TextBox>
    <br />
    <br />

        <asp:Label ID="movieLabel" runat="server" Text="Movie Name" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="movieTextBox" runat="server" style="margin-left: 41px"></asp:TextBox>
        <br />
        <br />
         <asp:Label ID="directorLabel" runat="server" Text="Movie Director" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="directorTextBox" runat="server" style="margin-left: 23px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="actorsLabel" runat="server" Text="Actors" style="margin-left:10px"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="actorsTextBox" runat="server" style="margin-left: 57px"></asp:TextBox>
           <br />
        <br />
        <asp:Label ID="genreLabel" runat="server" Text="Genre" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="genreTextBox" runat="server" style="margin-left: 73px"></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Release Date"></asp:Label>
&nbsp;<asp:TextBox ID="releaseDateTextBox" runat="server" style="margin-left: 22px" TextMode="Date"></asp:TextBox>
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Calendar ID="releaseDateCalendar" runat="server" style="margin-left: 64px" ></asp:Calendar>
    <br />
        <br />
        <br />
         <asp:Button ID="addButton" runat="server" style="margin-left: 18px" Text="Add" Width="80px" OnClick="addButton_Click" />&nbsp;&nbsp;
        <asp:LinkButton ID="viewLinkButton" runat="server" PostBackUrl="~/ViewMovie.aspx">View</asp:LinkButton>
        <asp:Button ID="clearButton" runat="server" style="margin-left: 58px" Text="Clear" Width="80px" />
       
    
   
        
    
    
   
  
   
    
    
</asp:Content>
