<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="LowStock.aspx.cs" Inherits="StayBeautifulSMS.LowStock" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">
        <div>
            <h2>
                <asp:Label ID="Label4" class="headings" runat="server" Text="Low Stock Items"></asp:Label>
            </h2>
        </div>
        <br />
        <div>
            <asp:DropDownList ID="sortCategoryDropDown" runat="server" Height="46px" Width="303px">
                <asp:ListItem>Item Name</asp:ListItem>
                <asp:ListItem>Stock Quantity</asp:ListItem>
                <asp:ListItem>Stocked Date</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="searchBtn" class="submit-button" runat="server" Text="Search" OnClick="searchBtn_Click" />
        </div>
        <br />
        <br />
        <div>
            <asp:GridView ID="lowStockGridView" runat="server" DataKeyNames="Item_id" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>
        </div>
        <div>
            <asp:GridView ID="lowStockGridView2" runat="server" DataKeyNames="Item_id" OnRowDataBound="lowStockGridView2_RowDataBound" OnRowEditing="lowStockGridView2_RowEditing" OnRowDeleting="lowStockGridView2_RowDeleting" OnRowUpdating="lowStockGridView2_RowUpdating" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>

        </div>
    </div>
</asp:Content>
