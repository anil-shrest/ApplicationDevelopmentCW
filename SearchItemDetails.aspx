<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="SearchItemDetails.aspx.cs" Inherits="StayBeautifulSMS.SearchItemDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="basicForm-wrapper">
    <div>
        <div>
            <h2><asp:Label ID="Label4" class="headings" runat="server" Text="Search Item Details"></asp:Label> </h2>
        </div> <br />
        <asp:DropDownList ID="itemsddl" runat="server" DataSourceID="SqlDataSource1" DataTextField="item_name" DataValueField="item_id" Height="46px" Width="303px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=SQLNCLI11;Data Source=DESKTOP-TKS66R0;Integrated Security=SSPI;Initial Catalog=&quot;App Dev CW2&quot;" ProviderName="System.Data.OleDb" SelectCommand="SELECT [item_name], [item_id] FROM [Items]"></asp:SqlDataSource>
    </div>
    <br /> <br />
    <div>
        <asp:Button ID="searchBtn" class="submit-button" runat="server" Text="SEARCH" onClick="searchBtn_Click1"/>
    </div>
    <br />
    <br />
    <div>
        <asp:GridView ID="searchGridView" runat="server" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>
    </div>
    </div>
</asp:Content>
