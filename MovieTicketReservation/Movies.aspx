<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="MovieTicketReservation.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="background-color: #808080"> 
    &nbsp;&nbsp;    
    <br />
    &nbsp;&nbsp;
    <asp:Label ID="movieIdLabel" runat="server" Text="Movie Id"></asp:Label>
    <asp:TextBox ID="movieIdTextBox" runat="server" style="margin-left: 65px" Width="100px"></asp:TextBox>
    &nbsp;&nbsp;    <asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ErrorMessage="Movie Id is Required" ControlToValidate="movieIdTextBox">*</asp:RequiredFieldValidator>
    <br />
    <br />

        <asp:Label ID="movieLabel" runat="server" Text="Movie Name" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="movieTextBox" runat="server" style="margin-left: 41px" Width="100px"></asp:TextBox>
      &nbsp;&nbsp;  <asp:RequiredFieldValidator ID="movieNameRequiredFieldValidator" runat="server" ErrorMessage="Movie Name is Required" ControlToValidate="movieTextBox">*</asp:RequiredFieldValidator>
        <br />
        <br />
         <asp:Label ID="directorLabel" runat="server" Text="Movie Director" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="directorTextBox" runat="server" style="margin-left: 26px" Width="100px"></asp:TextBox>
      &nbsp;&nbsp; <asp:RequiredFieldValidator ID="movieDirectorRequiredFieldValidator" runat="server" ErrorMessage="Director is Required" ControlToValidate="directorTextBox">*</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="actorsLabel" runat="server" Text="Actors" style="margin-left:10px"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="actorsTextBox" runat="server" style="margin-left: 61px" Width="100px"></asp:TextBox>
     &nbsp;&nbsp;      <asp:RequiredFieldValidator ID="movieActorsRequiredFieldValidator" runat="server" ErrorMessage="Actors are Required" ControlToValidate="actorsTextBox">*</asp:RequiredFieldValidator>
           <br />
        <br />
        <asp:Label ID="genreLabel" runat="server" Text="Genre" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="genreTextBox" runat="server" style="margin-left: 78px" Width="100px"></asp:TextBox>
    &nbsp;&nbsp;    <asp:RequiredFieldValidator ID="movieGenreRequiredFieldValidator" runat="server" ErrorMessage="Genre is Required" ControlToValidate="genreTextBox">*</asp:RequiredFieldValidator>
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Release Date"></asp:Label>
&nbsp;<asp:TextBox ID="releaseDateTextBox" runat="server" style="margin-left: 29px" Width="100px" TextMode="Date" ></asp:TextBox>
&nbsp;&nbsp;      <asp:RequiredFieldValidator ID="releaseDateRequiredFieldValidator" runat="server" ErrorMessage="Release Date is required" ControlToValidate="releaseDateTextBox">*</asp:RequiredFieldValidator>
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
        <br />
        <br />
         <asp:Button ID="addButton" runat="server" style="margin-left: 18px" Text="Add" Width="80px" OnClick="addButton_Click" />&nbsp;&nbsp;
        <asp:Button ID="clearButton" runat="server" style="margin-left: 58px" Text="Clear" Width="80px" OnClick="clearButton_Click" /><br />
        <br />
    <asp:ValidationSummary ID="movieValidationSummary" runat="server" />   
       
        
    
    
   
  
   
    
    
    
   
        
    
    
   
  
   
    
    
 </asp:Content>
