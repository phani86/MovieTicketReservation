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
      
      <div class="row">
        <div class="col-xs-12">

          <asp:Label ID="userIdLabel" runat="server" Text="User Id" style="margin-left:10px"></asp:Label>
              
          <asp:TextBox ID="userIdTextBox" runat="server" Width="115px"   style="margin-left: 21px"></asp:TextBox>
          <asp:RequiredFieldValidator ID="userIdRequiredFieldValidator" runat="server" ErrorMessage="User Id is required" ControlToValidate="userIdTextBox">*</asp:RequiredFieldValidator>
          
          <asp:Label ID="passwordLabel" runat="server" Text="Password" style="margin-left:10px"></asp:Label>
          <asp:TextBox ID="passwordTextBox" runat="server" Width="115px"  style="margin-left: 7px" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="passwordTextBox">*</asp:RequiredFieldValidator>
          
          <asp:Button ID="loginButton" runat="server" Text="Sign In" OnClick="loginButton_Click" class="btn btn-primary"  />
          <asp:LinkButton ID="signUpLinkButton" runat="server" PostBackUrl="~/Register.aspx" CausesValidation="False" class="btn btn-primary">Sign Up</asp:LinkButton>        
         
              
          <asp:ValidationSummary ID="userValidationSummary" runat="server" Height="58px" ShowModelStateErrors="False" style="margin-top: 4px" Width="1638px" />
        </div>
        <hr>
      </div>    

        </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
       
    <div class="row">
      <div class="col-xs-12">
        <h1>Check Ticket Availability</h1>
          <hr>
        <table class="checkAvailablity">
          <tr>
            <td><asp:label ID="placeLabel" runat="server" Text="Select Theatre"></asp:label></td>
            <td>
              <asp:DropDownList ID="theatreDropDownList" runat="server" ValidationGroup="availability" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged" class="form-control">
              <asp:ListItem>Select Theatre</asp:ListItem>
              </asp:DropDownList>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="theatreRequiredFieldValidator" runat="server" ControlToValidate="theatreDropDownList" ErrorMessage="Theatre should be selected" ValidationGroup="availability" InitialValue="Select Theatre" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="dateLabel" runat="server" Text="Select Movie"></asp:Label>
            </td>
            <td>
              <asp:DropDownList ID="movieDropDownList" runat="server" ValidationGroup="availability" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="movieDropDownList_SelectedIndexChanged" class="form-control">
              <asp:ListItem>Select Movie</asp:ListItem>
             </asp:DropDownList>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ErrorMessage="Movie Should be Selected" InitialValue="Select Movie" ControlToValidate="movieDropDownList" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="movieLabel" runat="server" Text="Select Date"></asp:Label>
            </td>
            <td>
              <asp:DropDownList ID="dateDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="dateDropDownList_SelectedIndexChanged" class="form-control">
              <asp:ListItem>Select Date</asp:ListItem>
              </asp:DropDownList>
            </td>
            <td>
              <asp:RequiredFieldValidator ID="dateRequiredFieldValidator" runat="server" ControlToValidate="dateDropDownList" ErrorMessage="Date should be selected" InitialValue="Select Date" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td>
              <asp:Label ID="timingsLabel" runat="server" Text="Select Show Timings" ></asp:Label>
            </td>            
            <td>
              <asp:DropDownList ID="timingsDropDownList" runat="server" class="form-control">
             <asp:ListItem>Select Timings</asp:ListItem>
              </asp:DropDownList>
            </td>  
            <td>
              <asp:RequiredFieldValidator ID="timingsRequiredFieldValidator" runat="server" ControlToValidate="timingsDropDownList" ErrorMessage="Time should be selected" InitialValue="Select Timings" SetFocusOnError="True" ValidationGroup="availability"></asp:RequiredFieldValidator>
            </td>            
          </tr>

          <tr>
            <td></td>
            <td><asp:Button class="btn btn-default" ID="checkAvilabilityButton" runat="server" style="margin-left: 18px" Text="Check Availability" Width="189px" ValidationGroup="availability" OnClick="checkAvilabilityButton_Click" ViewStateMode="Enabled" /></td>
            <td></td>

          </tr>
          <tr>
            <td><asp:Label ID="availabilityLabel" runat="server" Text="Number of Tickets Available"></asp:Label></td>
            <td><asp:TextBox ID="availabilityTextBox" runat="server"></asp:TextBox></td>
            <td></td>
          </tr>
        </table>

        
        <br>
        
        

      </div>
    </div>

</asp:Content>

  