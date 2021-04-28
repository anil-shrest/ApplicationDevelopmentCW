<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="InactiveCustomers.aspx.cs" Inherits="StayBeautifulSMS.Inactive_User" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">

        <div>
            <h2><asp:Label ID="Label4" class="headings" runat="server" Text="Inactive Customers"></asp:Label> </h2>
        </div>
        <br />
        <br />
        <br />
        <div>
            <asp:GridView ID="inactiveCustomerGrid" runat="server" DataKeyNames="Customer_ID" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>
        </div>
    </div>
</asp:Content>
