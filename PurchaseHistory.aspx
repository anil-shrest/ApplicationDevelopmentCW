<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PurchaseHistory.aspx.cs" Inherits="StayBeautifulSMS.PurchaseHistory" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">
        <div>
            <h2>
                <asp:Label ID="Label4" class="headings" runat="server" Text="Purchase History"></asp:Label>
            </h2>
        </div>
        <br />
        <asp:DropDownList ID="customerDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="customer_name" DataValueField="customer_id" Height="46px" Width="303px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=SQLNCLI11;Data Source=DESKTOP-TKS66R0;Integrated Security=SSPI;Initial Catalog=&quot;App Dev CW2&quot;" ProviderName="System.Data.OleDb" SelectCommand="SELECT [customer_name], [customer_id] FROM [Customer]"></asp:SqlDataSource>
        <br /> <br />
        <div>
            <asp:Button ID="viewBtn" class="submit-button" runat="server" Text="View" OnClick="viewBtn_Click" />
        </div>
        <br /> <br />
        <div>
            <asp:GridView ID="purchaseHistoryGridView" runat="server" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView></asp:GridView>

        </div>
    </div>
</asp:Content>
