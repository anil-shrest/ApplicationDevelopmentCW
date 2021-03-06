<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Category.aspx.cs" Inherits="StayBeautifulSMS.Category" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">
        <div>
           <h2><asp:Label ID="title" runat="server" Text="Item Category"></asp:Label> </h2>
        </div>
        <br />
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label2" Font-Bold="True" Text="Category Name" class="textFields" placeholder="Category Name"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtCategoryName" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Category Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CategoryGroup"></asp:RequiredFieldValidator>
        </div>
        
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCategoryName" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="CategoryGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
        
        <br />
        <br />
        <div>
            <asp:Button ID="btnSubmit" class="submit-button" runat="server" Text="INSERT" OnClick="btnSubmit_Click" ValidationGroup="CategoryGroup"/>
        </div>
        <br />
        <br />
        <br />
        <div>
            <asp:GridView ID="categoryGridView" runat="server" DataKeyNames="CATEGORY_ID" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" OnRowCancelingEdit="categoryGridView_RowCancelingEdit" OnRowEditing="categoryGridView_RowEditing" OnRowUpdating="categoryGridView_RowUpdating" OnRowDeleting="categoryGridView_RowDeleting" OnRowDataBound="categoryGridView_RowDataBound"  Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35">
                </asp:GridView>
        </div>
        
    </div>
    </asp:Content>