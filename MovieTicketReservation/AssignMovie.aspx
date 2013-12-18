<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AssignMovie.aspx.cs" Inherits="MovieTicketReservation.WebForm6" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:Label ID="theatreLabel" runat="server" Text="Theatre Name"></asp:Label>
    <asp:DropDownList ID="theatreDropDownList" runat="server" style="margin-left: 35px" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged1" AppendDataBoundItems="True" >
        <asp:ListItem>Select Theatre</asp:ListItem>
    </asp:DropDownList>
    
        <asp:RequiredFieldValidator ID="theatreRequiredFieldValidator" runat="server" ControlToValidate="theatreDropDownList" ErrorMessage="Theatre should be selected" SetFocusOnError="True" InitialValue="Select Theatre">*</asp:RequiredFieldValidator>
    
    <br />
   <br /> 
   <asp:Label ID="movieLabel" runat="server" Text="Movie Name"></asp:Label>
    <asp:DropDownList ID="movieDropDownList" runat="server" style="margin-left: 42px" AppendDataBoundItems="True" AutoPostBack="True"  >
        <asp:ListItem>Select Movie</asp:ListItem>
    </asp:DropDownList>
       <asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ErrorMessage="Movie should be selected" ControlToValidate="movieDropDownList" InitialValue="Select Movie" SetFocusOnError="True">*</asp:RequiredFieldValidator>
    <br />
    <br />
    
    <asp:Label ID="dateAvailableLabel" runat="server" Text="Date Available"></asp:Label>
    
<asp:TextBox ID="dateAvailableTextBox" runat="server" TextMode="Date" Width="100px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="dateRequiredFieldValidator" runat="server" ErrorMessage="Date should be assigned" ControlToValidate="dateAvailableTextBox">*</asp:RequiredFieldValidator>
<br />
    <br />
   
<asp:Calendar ID="dateCalendar" runat="server" style="margin-left: 70px; margin-bottom: 0px;"></asp:Calendar>

    <br />
 Time
    <asp:TextBox ID="timeTextBox" runat="server" style="margin-left: 73px" TextMode="Time" Width="100px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="timeRequiredFieldValidator" runat="server" ErrorMessage="Time should be assigned" ControlToValidate="timeTextBox">*</asp:RequiredFieldValidator>
    <br />
<br />
        <br />
<asp:Button ID="assignButton" runat="server" style="margin-left: 13px" Text="Assign" OnClick="assignButton_Click" Width="70px" />
    <br />
        <br />         
      <asp:ValidationSummary ID="assignValidationSummary" runat="server" />
      </p>
</asp:Content>
