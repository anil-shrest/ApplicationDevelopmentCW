<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Items.aspx.cs" Inherits="StayBeautifulSMS.Items" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <div class="basicForm-wrapper">
        <div>
           <h2><asp:Label ID="Label4" class="headings" runat="server" Text="Items"></asp:Label></h2>
        </div>
        <br />
        <br />
        <div>
            <asp:Label runat="server" class="labels" ID="Label1" Font-Bold="True" Text="Item Name"></asp:Label>
            <br />
            <asp:TextBox ID="txtItemName" Height="25px" runat="server" Width="300px"  class="textFields" placeholder="Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtItemName" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="ItemGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
        <br />
                <div>
            <asp:Label runat="server" class="labels" ID="Label2" Font-Bold="True" Text="Item Description"></asp:Label>
            <br />
            <asp:TextBox ID="txtDescription" Height="25px" runat="server" Width="300px"  class="textFields" placeholder="Description"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDescription" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="ItemGroup" ValidationExpression="^[a-zA-Z .]+$"></asp:RegularExpressionValidator>
        <br />
                <div>
            <asp:Label runat="server" class="labels" ID="Label3" Font-Bold="True" Text="Stock Date"></asp:Label>
            <br />
            <asp:TextBox ID="txtStockDate" Height="25px" runat="server" Width="300px" Type="Date"  class="textFields" placeholder="Stock Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStockDate" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
                <div>
            <asp:Label runat="server" class="labels" ID="Label5" Font-Bold="True" Text="Available Quantity"></asp:Label>
            <br />
            <asp:TextBox ID="txtQuantity" Height="25px" runat="server" Width="300px"  class="textFields" placeholder="Available Quantity"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Takes integer value only!" ForeColor="Red" ValidationGroup="ItemGroup" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
        <br />
                <div>
            <asp:Label runat="server" class="labels" ID="Label6" Font-Bold="True" Text="Item Rate"></asp:Label>
            <br />
            <asp:TextBox ID="txtItemRate" Height="25px" runat="server" Width="300px"  class="textFields" placeholder="Item Rate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtItemRate" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="ItemGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtItemRate" ErrorMessage="Takes integer value only!" ForeColor="Red" ValidationGroup="ItemGroup" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
        <br />
           <div>
               <asp:Button ID="insertBtn" class="submit-button" runat="server" Text="Insert" OnClick="insertBtn_Click" ValidationGroup="ItemGroup" />
           </div>
        <br />
        <br />
         <div>
             <asp:GridView ID="itemsGridView" runat="server" DataKeyNames="Item_id" EmptyDataText="No records has been added." AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" OnRowDataBound="itemsGridView_RowDataBound" OnRowCancelingEdit="itemsGridView_RowCancelingEdit" OnRowDeleting="itemsGridView_RowDeleting" OnRowUpdating="itemsGridView_RowUpdating" OnRowEditing="itemsGridView_RowEditing" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="70" CellSpacing="45"></asp:GridView>
             
        </div>
    </div>
    </asp:Content>
