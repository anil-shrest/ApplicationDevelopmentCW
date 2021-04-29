<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="StayBeautifulSMS.User" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="basicForm-wrapper">
        <div>
            <h2>
                <asp:Label ID="Label4" class="headings" runat="server" Text="Users"></asp:Label></h2>
        </div>
        <br />
        <br />
        <%--        <%if (User.Identity.Name == "Admin"){ %>
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label9" Font-Bold="True" Text="User Name"></asp:Label>--%>
        <%--            <br />
            <asp:TextBox ID="TextBox1" Height="25px" runat="server" Width="300px"  class="textFields" placeholder="Name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtUserName" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="CustomerGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtUserName" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="CustomerGroup"></asp:RequiredFieldValidator>
        </div>--%>
        <%--<%}%>--%>

        <% if (User.Identity.Name == "admin")
            {%>
        <div>
            <div>
            <%--<asp:Label runat="server" class="labels" ID="Label1" Font-Bold="True" Text="User Name"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUserName" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="UserGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label2" Font-Bold="True" Text="User Address"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUserAddress" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserAddress" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtUserAddress" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="UserGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label3" Font-Bold="True" Text="User Contact"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUserContact" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Contact"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserContact" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtUserContact" ErrorMessage="Must be 10 digits!" ForeColor="Red" ValidationGroup="UserGroup" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label5" Font-Bold="True" Text="User Username"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUserUsername" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUserUsername" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtUserUsername" ErrorMessage="Takes string value only!" ForeColor="Red" ValidationGroup="UserGroup" ValidationExpression="^[a-zA-Z ]+$"></asp:RegularExpressionValidator>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label6" Font-Bold="True" Text="User Email"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtUserEmail" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Invalid email address!" ForeColor="Red" ValidationGroup="UserGroup" ValidationExpression="\s*\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s*"></asp:RegularExpressionValidator>
        <br />
        <div>
            <%--<asp:Label runat="server" class="labels" ID="Label8" Font-Bold="True" Text="User Password"></asp:Label>--%>
            <br />
            <asp:TextBox ID="txtPassword" Height="25px" runat="server" Width="300px" class="textFields" placeholder="Password"></asp:TextBox>

            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Field must not be empty!" ForeColor="Red" ValidationGroup="UserGroup"></asp:RequiredFieldValidator>
        </div>
        <br />
  

        <div>
            <asp:Button ID="btnSubmit" class="submit-button" runat="server" Text="Insert" OnClick="btnSubmit_Click" ValidationGroup="UserGroup" />
        </div>
        <br />
        <br />

        <div>
            <asp:GridView ID="adminGridView" DataKeyNames="USER_ID" runat="server" AutoGenerateEditButton="true" AutoGenerateDeleteButton="true" OnRowDataBound="adminGridView_RowDataBound" OnRowUpdating="userGridView_RowUpdating" OnRowCancelingEdit="userGridView_RowCancelingEdit" OnRowDeleting="userGridView_RowDeleting" OnRowEditing="adminGridView_RowEditing" Height="369px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35">
            </asp:GridView>
        </div>

        </div>
        <%}
            else
            { %>
        <div>
        <div>
            <asp:GridView ID="userGridView" DataKeyNames="USER_ID" runat="server" Height="369px" HorizontalAlign="Justify" AutoGenerateEditButton="true" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>

        </div>
        </div>
        <%} %>

        

    </div>
</asp:Content>
