<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Theatre.aspx.cs" Inherits="MovieTicketReservation.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
    <p style="background-color: #808080">
        <br />
    <asp:Label ID="theatreIdLabel" runat="server" Text="Theatre Id" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreIdTextBox" runat="server" style="margin-left: 59px" Width="100px"></asp:TextBox>
    &nbsp;&nbsp;    <asp:RequiredFieldValidator ID="theatreIdRequiredFieldValidator" runat="server" ErrorMessage="Theatre Id is required" ControlToValidate="theatreIdTextBox">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="theatreNameLabel" runat="server" Text="Theatre Name" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreNameTextBox" runat="server" style="margin-left: 33px" Width="100px"></asp:TextBox>
    &nbsp;&nbsp;     <asp:RequiredFieldValidator ID="theatreNameRequiredFieldValidator" runat="server" ErrorMessage="Theatre Name is required" ControlToValidate="theatreNameTextBox">*</asp:RequiredFieldValidator>
    <br />
    <br />

    <asp:Label ID="theatreSizeLabel" runat="server" Text="Theatre Size" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreSizeTextBox" runat="server" style="margin-left: 44px" Width="100px"></asp:TextBox>
    &nbsp;&nbsp;     <asp:RequiredFieldValidator ID="theatreSizeRequiredFieldValidator" runat="server" ErrorMessage="Theatre Size is required" ControlToValidate="theatreSizeTextBox">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="ticketCostLabel" runat="server" Text="Ticket Cost" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="ticketCostTextBox" runat="server" style="margin-left: 46px" Width="100px" ></asp:TextBox>
     &nbsp;&nbsp;    <asp:RequiredFieldValidator ID="ticketCostRequiredFieldValidator" runat="server" ErrorMessage="Ticket cost is required" ControlToValidate="ticketCostTextBox">*</asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="theatreManagerLabel" runat="server" Text="Theatre Manager" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreManagerTextBox" runat="server" style="margin-left: 10px" Width="100px" Height="16px"></asp:TextBox>
    &nbsp;&nbsp;     <asp:RequiredFieldValidator ID="theatreManagerRequiredFieldValidator" runat="server" ErrorMessage="Theatre Manager is required" ControlToValidate="theatreManagerTextBox">*</asp:RequiredFieldValidator>
    <br />
&nbsp;
    <br />
&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;
   
    <asp:Button ID="submitButton" runat="server" Text="Submit" style="margin-left:10px" OnClick="submitButton_Click" Width="80px" />&nbsp;&nbsp;&nbsp;
    <asp:Button ID="clearButton" runat="server" Text="Clear" OnClick="clearButton_Click" Width="80px" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />    
     <asp:ValidationSummary ID="theatreValidationSummary" runat="server" />  
       
 
</asp:Content>
