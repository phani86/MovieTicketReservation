<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="MovieTicketReservation.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
      <div class="col-xs-12">
        <table class="booking">
            <tr>
                <td>
     <asp:Label ID="theatreLabel" runat="server" Text="Select Theatre"></asp:Label></td>
    <td><asp:DropDownList class="form-control" ID="theatreDropDownList" runat="server"  AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="theatreDropDownList_SelectedIndexChanged" required ="">
        <asp:ListItem>Select Theatre</asp:ListItem>
    </asp:DropDownList></td>
</tr>
     <tr>
    <td><asp:Label ID="movieLabel" runat="server" Text="Select Movie" ></asp:Label></td>
    <td><asp:DropDownList class="form-control" ID="movieDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="movieDropDownList_SelectedIndexChanged" AppendDataBoundItems="True" required ="">
        <asp:ListItem>Select Movie</asp:ListItem>
    </asp:DropDownList></td>
</tr>
      <tr>
    <td><asp:Label ID="dateLabel" runat="server" Text="Select Date" ></asp:Label></td>
    <td><asp:DropDownList class="form-control" ID="dateDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dateDropDownList_SelectedIndexChanged" AppendDataBoundItems="True" required ="">
        <asp:ListItem>Select Date</asp:ListItem>
    </asp:DropDownList></td>
     </tr>
     <tr>
    <td><asp:Label ID="showLabel" runat="server" Text="Select Show" ></asp:Label></td>
    <td >
    <asp:DropDownList class="form-control" ID="showDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" ValidationGroup="booking" required ="">
        <asp:ListItem>Select Show</asp:ListItem>
    </asp:DropDownList></td>
      </tr>
      <tr>
    <td><asp:Label ID="numberOfTicketsLabel" runat="server" Text="Number of Tickets" ></asp:Label></td>
    <td><asp:DropDownList class="form-control" ID="quantityDropDownList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quantityDropDownList_SelectedIndexChanged" AppendDataBoundItems="True" ValidationGroup="booking" required ="">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
    </asp:DropDownList></td>
    </tr>
    <tr>    
    <td><asp:Label ID="Label" runat="server" Text="Cost"></asp:Label></td>
    <td><asp:DropDownList class="form-control" ID="costDropDownList" runat="server" required ="" >
    </asp:DropDownList></td>
      <td>  &nbsp;</td>
     </tr> 
    <tr>
        <td><asp:Button class="btn btn-default" ID="bookButton" runat="server"  Text="Book" OnClick="bookButton_Click" /></td>
    
   <td>&nbsp;</td>
</tr>
</table>
<br>
</div>
</div>
    
</asp:Content>
