<%@ Page Title="" Language="C#" MasterPageFile="~/MovieReservation.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MovieTicketReservation.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <p>
       
        &nbsp;</p>
    <p style="background-color:gray">
       


       <br />
        <asp:Label ID="userIdLabel" runat="server" Text="User Id" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="userIdTextBox" runat="server" style="margin-left: 118px" Width="100px" CssClass="validation"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="userIdRequiredFieldValidator" runat="server" ErrorMessage="User Id is required" ControlToValidate="userIdTextBox"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="firstNameLabel" runat="server" Text="First Name" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="firstNameTextBox" runat="server" style="margin-left: 94px" Width="100px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" ErrorMessage="First Name is required" ControlToValidate="firstNameTextBox"></asp:RequiredFieldValidator>
       <br />
    
       
    <br />
       
        <asp:Label ID="lastNameLabel" runat="server" Text="Last Name" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="lastNameTextBox" runat="server" style="margin-left: 94px" Width="100px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
       
        <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" ErrorMessage="Last Name is required" ControlToValidate="lastNameTextBox"></asp:RequiredFieldValidator>
       
    <br />
       
    <br />
    <asp:Label ID="passwordLabel" runat="server" Text="Password" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="passwordTextBox" runat="server" style="margin-left: 100px" TextMode="Password" Width="100px"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator" runat="server" ErrorMessage="Password is required" ControlToValidate="passwordTextBox"></asp:RequiredFieldValidator>
    <br />
    <br />
        <asp:Label ID="confirmPasswordLabel" runat="server" Text="Confirm Password" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="confirmPasswordTextBox" runat="server" style="margin-left: 45px" Width="100px" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CompareValidator ID="passwordCompareValidator" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="passwordTextBox" ControlToValidate="confirmPasswordTextBox"></asp:CompareValidator>
        <br />
        <br />
        <asp:Label ID="phoneNumberLabel" runat="server" Text="Phone No" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="phoneNumberTextBox" runat="server" style="margin-left: 95px" Width="100px" TextMode="Phone"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="phoneNumberRequiredFieldValidator" runat="server" ErrorMessage="Phone No is required" ControlToValidate="phoneNumberTextBox"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="emailIdLabel" runat="server" Text="Email Id" style="margin-left:10px"></asp:Label>
        <asp:TextBox ID="emailIdTextBox" runat="server" style="margin-left: 103px" Width="100px" TextMode="Email"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="emailIdRequiredFieldValidator" runat="server" ErrorMessage="Email Id is required" ControlToValidate="emailIdTextBox"></asp:RequiredFieldValidator>
        <br />
        <br />
   
    <asp:Label ID="addressLabel" runat="server" Text="Address" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="addressTextBox" runat="server" style="margin-left: 100px" Width="100px" TextMode="MultiLine"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
   
        <asp:RequiredFieldValidator ID="addressRequiredFieldValidator" runat="server" ErrorMessage="Address is required" ControlToValidate="addressTextBox"></asp:RequiredFieldValidator>
   
    <br />
    <br />
    <asp:Label ID="genderLabel" runat="server" Text="Gender" style="margin-left:10px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RadioButton ID="maleRadioButton" runat="server" Text="Male"  />
    
        &nbsp;&nbsp;
    
        <asp:RadioButton ID="femaleRadioButton" runat="server" Text="Female" />
    
    &nbsp;
    <br />
   <br />
    <asp:Button ID="submitButton" runat="server" Text="Sign Up" style="margin-left: 17px" Width="75px" OnClick="submitButton_Click" />
    <asp:Button ID="resetButton" runat="server" style="margin-left: 59px" Text="Reset" Width="75px" OnClick="clearButton_Click" />
    <br />
    <br />
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        
  
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <div id="footer">
         </div>
            </asp:Content>

