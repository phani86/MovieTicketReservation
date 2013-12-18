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
   
    <p style="background-color: #C0C0C0; position: absolute; top: 252px; left: -259px; width: 1900px; height: 530px; margin-left: 260px; margin-top: 112px; display:block">
   
     
        <asp:Label ID="userIdLabel" runat="server" Text="User Id" style="margin-left:10px"></asp:Label>
            
        <asp:TextBox ID="userIdTextBox" runat="server" Width="115px"   style="margin-left: 21px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="userIdRequiredFieldValidator" runat="server" ErrorMessage="User Id is required" ControlToValidate="userIdTextBox">*</asp:RequiredFieldValidator>
        
        <asp:Label ID="passwordLabel" runat="server" Text="Password" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="passwordTextBox" runat="server" Width="115px"  style="margin-left: 7px" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="passwordTextBox">*</asp:RequiredFieldValidator>
        
        <asp:Button ID="loginButton" runat="server" style="margin-right: 20px; margin-top:10px; margin-left: 76px;" Text="Sign In" Width="100px" Height="25px" OnClick="loginButton_Click"  />
    <asp:LinkButton ID="signUpLinkButton" runat="server" PostBackUrl="~/Register.aspx" CausesValidation="False">Sign Up</asp:LinkButton>        
   
        
   <asp:ValidationSummary ID="userValidationSummary" runat="server" Height="58px" ShowModelStateErrors="False" style="margin-top: 4px" Width="1638px" />
        </div>
</asp:Content>
  <asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
       
    <p style="background-color:lightgray; position:absolute; top: 136px; left: -3px; width: 1900px; height:186px; display:block; font-family: 'Arial Narrow'; font-size: larger; font-weight: 300; font-style: oblique; font-variant: small-caps; text-transform: uppercase; color: #000000;">
     
      Check Ticket Availability
        <br />
        <br />
   
        <asp:label ID="placeLabel" runat="server" Text="Select Theatre" style="margin-left:20px" ></asp:label>
        <asp:DropDownList ID="theatreDropDownList" runat="server" style="margin-left: 50px" ValidationGroup="availability" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged">
            <asp:ListItem>Select Theatre</asp:ListItem>
        </asp:DropDownList>
        
       <asp:RequiredFieldValidator ID="theatreRequiredFieldValidator" runat="server" ControlToValidate="theatreDropDownList" ErrorMessage="Theatre should be selected" ValidationGroup="availability" InitialValue="Select Theatre" SetFocusOnError="True"></asp:RequiredFieldValidator>

       <asp:Label ID="dateLabel" runat="server" Text="Select Movie"></asp:Label>
       <asp:DropDownList ID="movieDropDownList" runat="server" ValidationGroup="availability" style="margin-left: 14px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="movieDropDownList_SelectedIndexChanged">
           <asp:ListItem>Select Movie</asp:ListItem>
       </asp:DropDownList><asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ErrorMessage="Movie Should be Selected" InitialValue="Select Movie" ControlToValidate="movieDropDownList" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        
       <asp:Label ID="movieLabel" runat="server" Text="Select Date"></asp:Label>
       <asp:DropDownList ID="dateDropDownList" runat="server" style="margin-left: 23px" Width="135px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="dateDropDownList_SelectedIndexChanged">
           <asp:ListItem>Select Date</asp:ListItem>
       </asp:DropDownList>
        <asp:RequiredFieldValidator ID="dateRequiredFieldValidator" runat="server" ControlToValidate="dateDropDownList" ErrorMessage="Date should be selected" InitialValue="Select Date" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        
        <br />
        <br />
       <asp:Label ID="timingsLabel" runat="server" Text="Select Show Timings" style="margin-left: 18px"></asp:Label>
       <asp:DropDownList ID="timingsDropDownList" runat="server" style="margin-left: 19px">
           <asp:ListItem>Select Timings</asp:ListItem>
       </asp:DropDownList>
        <asp:RequiredFieldValidator ID="timingsRequiredFieldValidator" runat="server" ControlToValidate="timingsDropDownList" ErrorMessage="Time should be selected" InitialValue="Select Timings" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
        <br />
        <br />
       <br />
        <asp:Button ID="checkAvilabilityButton" runat="server" style="margin-left: 18px" Text="Check Availability" Width="189px" ValidationGroup="availability" OnClick="checkAvilabilityButton_Click" ViewStateMode="Enabled" />
        <asp:Label ID="availabilityLabel" runat="server" Text="Number of Tickets Available"></asp:Label>
        <asp:TextBox ID="availabilityTextBox" runat="server" style="margin-left: 104px"></asp:TextBox>
      </p> 
        
       
        <p>
       <br />
      </p> 
     
</asp:Content>

  