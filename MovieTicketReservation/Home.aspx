<%@ Page Title="" Language="C#" MasterPageFile="~/MovieReservation.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MovieTicketReservation.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #footer {
            height: 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     
    <div id="ticketavilability"> 
   
    <p style="background-color: #CC6600; position: absolute; top: 252px; left: -259px; width: 1900px; height: 530px; margin-left: 260px; margin-top: 112px; display:block">
   
       <br />
      <br />    
       
      
             
       
        <br />
        <br />
       <br />
       <br />
       <br />
        <asp:Label ID="userIdLabel" runat="server" Text="User Id" style="margin-left:10px"></asp:Label>
            
        <asp:TextBox ID="userIdTextBox" runat="server" Width="115px"   style="margin-left: 21px"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="userIdRequiredFieldValidator" runat="server" ErrorMessage="User Id is required" ControlToValidate="userIdTextBox"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Label ID="passwordLabel" runat="server" Text="Password" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="passwordTextBox" runat="server" Width="115px"  style="margin-left: 7px" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="passwordTextBox"></asp:RequiredFieldValidator>
        <br />
    &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="loginButton" runat="server" style="margin-right: 20px; margin-top:10px; margin-left: 76px;" Text="Sign In" Width="100px" Height="25px" OnClick="loginButton_Click"  />
    &nbsp;<asp:LinkButton ID="signUpLinkButton" runat="server" PostBackUrl="~/Register.aspx" CausesValidation="False">Sign Up</asp:LinkButton>        
   
        &nbsp;
   <asp:ValidationSummary ID="ValidationSummary1" runat="server" Height="58px" ShowModelStateErrors="False" style="margin-top: 4px" Width="1638px" />
        </div>
</asp:Content>
  <asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
       
    <p style="background-color:darkslateblue; position:absolute; top: 136px; left: -3px; width: 1900px; height:186px; display:block; font-family: 'Arial Narrow'; font-size: larger; font-weight: 300; font-style: oblique; font-variant: small-caps; text-transform: uppercase; color: #999966;">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      Check Ticket Availability
        <br />
        <br />
   
        <asp:label ID="placeLabel" runat="server" Text="Select Theatre" style="margin-left:20px" ></asp:label>
        <asp:DropDownList ID="theatreDropDownList" runat="server" style="margin-left: 50px" CausesValidation="True" ValidationGroup="availability">
            <asp:ListItem>Select Theatre</asp:ListItem>
            <asp:ListItem>Cineplex</asp:ListItem>
            <asp:ListItem>PVR</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:RequiredFieldValidator ID="theatreRequiredFieldValidator" runat="server" ControlToValidate="theatreDropDownList" ErrorMessage="Theatre should be selected" ValidationGroup="availability" InitialValue="Select Theatre" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Label ID="dateLabel" runat="server" Text="Select Date"></asp:Label>&nbsp;&nbsp;
       <asp:DropDownList ID="dateDropDownList" runat="server" CausesValidation="True" ValidationGroup="availability" style="margin-left: 14px">
           <asp:ListItem>Select Date</asp:ListItem>
           <asp:ListItem>11/20/2013</asp:ListItem>
           <asp:ListItem>11/19/2013</asp:ListItem>
       </asp:DropDownList>&nbsp;&nbsp&nbsp;&nbsp;<asp:RequiredFieldValidator ID="dateRequiredFieldValidator" runat="server" ErrorMessage="Date Should be Selected" InitialValue="Select Date" ControlToValidate="dateDropDownList" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        &nbsp;&nbsp&nbsp;&nbsp;
       <asp:Label ID="movieLabel" runat="server" Text="Select Movie "></asp:Label>
       <asp:DropDownList ID="movieDropDownList" runat="server" style="margin-left: 23px" Width="135px">
           <asp:ListItem>Select Movie</asp:ListItem>
       </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ControlToValidate="movieDropDownList" ErrorMessage="Movie should be selected" InitialValue="Select Movie" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        &nbsp;&nbsp;
        <br />
        <br />
       <asp:Label ID="timingsLabel" runat="server" Text="Select Show Timings" style="margin-left: 18px"></asp:Label>
       <asp:DropDownList ID="timingsDropDownList" runat="server" style="margin-left: 19px">
           <asp:ListItem>Select Timings</asp:ListItem>
       </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="timingsRequiredFieldValidator" runat="server" ControlToValidate="timingsDropDownList" ErrorMessage="Time should be selected" InitialValue="Select Timings" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        <br />
        <br />
       <br />
        <asp:Button ID="checkAvilabilityButton" runat="server" style="margin-left: 18px" Text="Check Availability" Width="189px" ValidationGroup="availability" OnClick="checkAvilabilityButton_Click" ViewStateMode="Enabled" />
      </p> 
        
       
        <p>
       <br />
      </p> 
     
</asp:Content>

  