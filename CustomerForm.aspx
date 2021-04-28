<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerForm.aspx.cs" Inherits="StayBeautifulSMS.CustomerForm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">
        <div>
            <h2>
                <asp:Label ID="Label4" class="headings" runat="server" Text="Customer Details"></asp:Label></h2>
        </div>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label1" Font-Bold="True" Text="Customer Name"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtCustomertName" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomertName" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CustomerGroup"></asp:RequiredFieldValidator>
        </div>

        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label2" Font-Bold="True" Text="Customer Address"></asp:Label>--%>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCustomertName" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="CustomerGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtCustomerAddress" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerAddress" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CustomerGroup"></asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtCustomerAddress" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="CustomerGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtCustomerPhone" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerPhone" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CustomerGroup"></asp:RequiredFieldValidator>
        </div>

        <div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCustomerPhone" ErrorMessage="Takes integer value only!" ForeColor="Red" ValidationGroup="CustomerGroup" ValidationExpression="^[0-9]{1,10}$"></asp:RegularExpressionValidator>
            <br />
            <asp:TextBox ID="txtCustomerEmail" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerEmail" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CustomerGroup" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RequiredFieldValidator>
        </div>

        <div>
            <div>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Email Address" ValidationExpression="\s*\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*" ControlToValidate="txtCustomerEmail" ValidationGroup="CustomerGroup" ForeColor="Red"></asp:RegularExpressionValidator>
                <br />
                <asp:DropDownList ID="userTypeDropDown" runat="server" Height="46px" Width="303px">
                    <asp:ListItem>New</asp:ListItem>
                    <asp:ListItem>Regular</asp:ListItem>
                    <asp:ListItem>Normal</asp:ListItem>
                </asp:DropDownList>
                <br />
                <br />
                <br />
            </div>
        </div>
        <br />

        <div>
            <asp:Button ID="btnSubmit" class="submit-button" runat="server" Text="INSERT" OnClick="btnSubmit_Click" ValidationGroup="CustomerGroup" />
            <asp:Button ID="btnCancel" class="cancel-button" runat="server" Text="CANCEL" OnClick="btnCancel_Click" ValidationGroup="CustomerGroup" />

        </div>
        <br />
        <br />
        <br />

        <div>
            <asp:GridView ID="customerGridView" runat="server" DataKeyNames="CUSTOMER_ID" OnRowEditing="customerGridView_RowEditing" OnRowCancelingEdit="customerGridView_RowCancelingEdit" OnRowUpdating="customerGridView_RowUpdating" EmptyDataText="No records has been added." Height="369px" HorizontalAlign="Justify" AutoGenerateEditButton="true" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35">
            </asp:GridView>
        </div>
    </div>
</asp:Content>


                                                                                                                                   