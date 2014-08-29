<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewMovie.aspx.cs" Inherits="MovieTicketReservation.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="movieGridView" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField AccessibleHeaderText="Movie Id" DataField="movieId" HeaderText="Movie Id" />
        <asp:BoundField AccessibleHeaderText="Movie Name" DataField="movieName" HeaderText="Movie Name" />
        <asp:BoundField AccessibleHeaderText="Movie Director" DataField="movieDirector" HeaderText="Movie Director" />
        <asp:BoundField AccessibleHeaderText="Actors" DataField="actors" HeaderText="Actors" />
        <asp:BoundField AccessibleHeaderText="Genre" DataField="genre" HeaderText="Genre" />
        <asp:BoundField AccessibleHeaderText="Release Date" DataField="releaseDate" HeaderText="Release Date" />
    </Columns>
</asp:GridView>
<br />
<br />



</asp:Content>
