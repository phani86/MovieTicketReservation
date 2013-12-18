<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="MovieTicketReservation.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
&nbsp;&nbsp;
    <p style="background-color:#999966">
    <br />
   &nbsp;&nbsp; <asp:Label ID="theatreLabel" runat="server" Text="Select Theatre"></asp:Label>
    <asp:DropDownList ID="theatreDropDownList" runat="server" style="margin-left: 48px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged">
        <asp:ListItem>Select Theatre</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="theatreRequiredFieldValidator" runat="server" ErrorMessage="Theatre should be selected" ControlToValidate="theatreDropDownList" ValidationGroup="booking"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="movieLabel" runat="server" Text="Select Movie" style="margin-left:10px"></asp:Label>
    <asp:DropDownList ID="movieDropDownList" runat="server" style="margin-left: 55px" Height="18px" Width="126px" AutoPostBack="True" OnSelectedIndexChanged="movieDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
        <asp:ListItem>Select Movie</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="movieRequiredFieldValidator" runat="server" ErrorMessage="Movie should be selected" ControlToValidate="movieDropDownList" InitialValue="Select Movie" SetFocusOnError="True" ValidationGroup="booking"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="dateLabel" runat="server" Text="Select Date" style="margin-left:10px"></asp:Label>
    <asp:DropDownList ID="dateDropDownList" runat="server" style="margin-left: 63px" Width="110px" AutoPostBack="True" OnSelectedIndexChanged="dateDropDownList_SelectedIndexChanged" AppendDataBoundItems="True">
        <asp:ListItem>Select Date</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="dateRequiredFieldValidator" runat="server" ErrorMessage="Date should be selected" ControlToValidate="dateDropDownList" InitialValue="Select Show" SetFocusOnError="True" ValidationGroup="booking"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="showLabel" runat="server" Text="Select Show" style="margin-left:10px"></asp:Label>
    <asp:DropDownList ID="showDropDownList" runat="server" Height="37px" style="margin-left: 56px" Width="111px" AppendDataBoundItems="True" AutoPostBack="True" ValidationGroup="booking">
        <asp:ListItem>Select Show</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="showRequiredFieldValidator" runat="server" ErrorMessage="Show should be selected" ControlToValidate="showDropDownList" SetFocusOnError="True" ValidationGroup="booking"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="numberOfTicketsLabel" runat="server" Text="Number of Tickets" style="margin-left:10px"></asp:Label>
    <asp:DropDownList ID="quantityDropDownList" runat="server" style="margin-left: 18px" Height="16px" Width="106px" AutoPostBack="True" OnSelectedIndexChanged="quantityDropDownList_SelectedIndexChanged" AppendDataBoundItems="True" ValidationGroup="booking">
        <asp:ListItem>Select Quantity</asp:ListItem>
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <br />
    <br />
&nbsp;&nbsp;
    <asp:Label ID="Label" runat="server" Text="Cost"></asp:Label>
    <asp:DropDownList ID="costDropDownList" runat="server" style="margin-left: 99px" Width="112px">
        <asp:ListItem>Select Cost</asp:ListItem>
    </asp:DropDownList>&nbsp;&nbsp;&nbsp;
        <br />
    <br />
    <br />
    <asp:Button ID="bookButton" runat="server" style="margin-left: 30px" Text="Book" OnClick="bookButton_Click" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="backButton" runat="server" style="margin-left: 24px" Text="Back" />
    <br />
    <br />
        </p>
</asp:Content>
