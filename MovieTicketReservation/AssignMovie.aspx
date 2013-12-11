<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AssignMovie.aspx.cs" Inherits="MovieTicketReservation.WebForm6" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p style="margin-left: 40px">
        <br />
    &nbsp;&nbsp;
    &nbsp;&nbsp;
    <br />
    <br />
    &nbsp;
    <asp:Label ID="theatreLabel" runat="server" Text="Theatre Name"></asp:Label>
    <asp:DropDownList ID="theatreDropDownList" runat="server" style="margin-left: 35px" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged1" AppendDataBoundItems="True" >
        <asp:ListItem>Select Theatre</asp:ListItem>
    </asp:DropDownList>
    
    <br />
   <br /> 
   <asp:Label ID="movieLabel" runat="server" Text="Movie Name"></asp:Label>
    <asp:DropDownList ID="movieDropDownList" runat="server" style="margin-left: 56px"  >
        <asp:ListItem>Select Movie</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    &nbsp;
    <asp:Label ID="dateAvailableLabel" runat="server" Text="Date Available"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="dateAvailableTextBox" runat="server" TextMode="Date"></asp:TextBox>
<br />
    <br />
    </p>
<asp:Calendar ID="dateCalendar" runat="server" style="margin-left: 77px; margin-bottom: 0px;"></asp:Calendar>
&nbsp;&nbsp;
    <br />
&nbsp; Time
    <asp:TextBox ID="timeTextBox" runat="server" style="margin-left: 62px" TextMode="Time"></asp:TextBox>
    <br />
<br />
<asp:Button ID="assignButton" runat="server" style="margin-left: 41px" Text="Assign" OnClick="assignButton_Click" />
<asp:Button ID="viewButton" runat="server" style="margin-left: 74px" Text="View" />
    <br />
<br />
</asp:Content>
