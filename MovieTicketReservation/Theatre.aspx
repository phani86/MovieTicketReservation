<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Theatre.aspx.cs" Inherits="MovieTicketReservation.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
<br />
    <asp:Label ID="theatreIdLabel" runat="server" Text="Theatre Id" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreIdTextBox" runat="server" style="margin-left: 55px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="theatreNameLabel" runat="server" Text="Theatre Name" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreNameTextBox" runat="server" style="margin-left: 33px"></asp:TextBox>
    <br />
    <br />

    <asp:Label ID="theatreSizeLabel" runat="server" Text="Theatre Size" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreSizeTextBox" runat="server" style="margin-left: 44px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="ticketCostLabel" runat="server" Text="Ticket Cost" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="ticketCostTextBox" runat="server" style="margin-left: 46px" TextMode="Number"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="theatreManagerLabel" runat="server" Text="Theatre Manager" style="margin-left:10px"></asp:Label>
    <asp:TextBox ID="theatreManagerTextBox" runat="server" style="margin-left: 10px" Width="122px"></asp:TextBox>
    <br />
&nbsp;
    <br />
&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="movieIdLabel" runat="server" Text="Movie Id"></asp:Label>
    <asp:TextBox ID="movieIdTextBox" runat="server" style="margin-left: 47px"></asp:TextBox>
    <br />
&nbsp;&nbsp;
    <br />
    <br />
    <asp:Button ID="submitButton" runat="server" Text="Submit" style="margin-left:10px" OnClick="submitButton_Click" />&nbsp;&nbsp;&nbsp;
    <asp:Button ID="clearButton" runat="server" Text="Clear" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:LinkButton ID="viewLinkButton" runat="server">View</asp:LinkButton>
    <br />
    <br />
</asp:Content>
