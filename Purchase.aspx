<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Purchase.aspx.cs" Inherits="StayBeautifulSMS.Purchase" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="basicForm-wrapper">
        <div>
           <h2><asp:Label ID="Label1" runat="server" Text="Purchase"></asp:Label></h2>
        </div>
        <br />
        <br />

        <div>
            <asp:Label ID="Label2" runat="server" Text="Customer"></asp:Label>
            <br /> <br /> 
            <asp:DropDownList ID="customerDDL" runat="server" DataTextField="customer_name" DataValueField="customer_id" DataSourceID="SqlDataSource1" Height="46px" Width="303px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=SQLNCLI11;Data Source=DESKTOP-TKS66R0;Integrated Security=SSPI;Initial Catalog=&quot;App Dev CW2&quot;" ProviderName="System.Data.OleDb" SelectCommand="SELECT [customer_id], [customer_name] FROM [Customer]"></asp:SqlDataSource>
            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [customer_id], [customer_name] FROM [Customer]"></asp:SqlDataSource>--%>
        </div>
        <br />
        <br />
        <div>
            <asp:Label ID="Label4" runat="server" Text="Item"></asp:Label>
            <br /> <br /> 
            <asp:DropDownList ID="itemDDL" runat="server" DataTextField="item_name" DataValueField="item_id" DataSourceID="SqlDataSource2" Height="46px" Width="303px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=SQLNCLI11;Data Source=DESKTOP-TKS66R0;Integrated Security=SSPI;Initial Catalog=&quot;App Dev CW2&quot;" ProviderName="System.Data.OleDb" SelectCommand="SELECT [item_id], [item_name] FROM [Items]"></asp:SqlDataSource>
            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [item_id], [item_name] FROM [Items]"></asp:SqlDataSource>--%>
        </div>
        <br />
        <br />
        <div>
            <%--<asp:Label ID="Label3" runat="server" Text="Quantity"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txQuantity" runat="server" class="textFields" placeholder="Quantity"></asp:TextBox>
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="btnItemAdd" class="submit-button" runat="server" Text="Add Item" OnClick="btnItemAdd_Click" />
        </div>
        <br />
        <br />
        <div>
            <asp:GridView ID="purchaseItemGridView" runat="server"  Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="btnPurchase" class="submit-button" runat="server" Text="Purchase" OnClick="btnPurchase_Click" />
        </div>
    </div>
    </asp:Content>