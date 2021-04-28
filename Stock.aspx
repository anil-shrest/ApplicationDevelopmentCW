<%@ Page Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true"  CodeBehind="Stock.aspx.cs" Inherits="StayBeautifulSMS.Stock" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
           <div class="basicForm-wrapper">
    <div>
        <div>
           <h2> <asp:Label ID="Label1" class="headings" runat="server" Text="Item Stock Details"></asp:Label></h2>
        </div>
        <br />
        <br />
        <div>
            <asp:Label ID="Label6" CssClass="labels" runat="server" Text="Item"></asp:Label>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="item_name" DataValueField="item_id" Height="46px" Width="303px"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [item_id], [item_name] FROM [Items]"></asp:SqlDataSource>
        </div>
        <br />
        <div>
            <%--<asp:Label ID="Label2" class="labels" runat="server" Text="Updated Quantity"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUpdatedQuantity" runat="server"  class="textFields" placeholder="Updated Quantity"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUpdatedQuantity" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="StockGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <%--<asp:Label ID="Label3" class="labels" runat="server" Text="Date Of Stock"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtDateOfStock" type="Date" runat="server"  class="textFields" placeholder="Date Of Stock"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDateOfStock" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="StockGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <%--<asp:Label ID="Label4" class="labels" runat="server" Text="Manufactured Date"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtMfd" type="Date" runat="server"  class="textFields" placeholder="Manufactured Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMfd" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="StockGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
        <div>
            <%--<asp:Label ID="Label5" class="labels" runat="server" Text="Expiry Date"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtExp" type="Date" runat="server"  class="textFields" placeholder="Expiry Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtExp" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="StockGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
        <br />
        <div>
            <asp:Button ID="btnInsert" class="submit-button" runat="server" Text="INSERT" OnClick="btnInsert_Click" ValidationGroup="StockGroup"/>
        </div>
      
        <br />
        <br />
        <br />
       <div>
           <asp:GridView ID="stockGridView" DataKeyNames="stock_id" runat="server" EmptyDataText="No records has been added."  OnRowCancelingEdit="stockGridView_RowCancelingEdit" OnRowEditing="stockGridView_RowEditing" OnRowUpdating="stockGridView_RowUpdating"  AutoGenerateEditButton="true" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35" ></asp:GridView>
       </div>
    </div>
               </div>
</asp:Content>

