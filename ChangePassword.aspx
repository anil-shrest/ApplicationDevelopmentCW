<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="StayBeautifulSMS.ChangePassword" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="basicForm-wrapper">
        <div>
            <h2>
                <asp:Label ID="Label1" class="headings" runat="server" Text="Change Password"></asp:Label>
            </h2>
        </div>
    <br />
    <br />
    <div>
        <%--<asp:Label ID="Label2" runat="server" Text="Current Password"></asp:Label>--%>
        <br />
        <asp:TextBox ID="txtCurrentPw" runat="server" class="textFields" placeholder="Current Password"></asp:TextBox>
    </div>
    <div>
        <%--<asp:Label ID="Label3" runat="server" Text="New Password"></asp:Label>--%>
        <br />
        <asp:TextBox ID="txtNewPw1" runat="server" class="textFields" placeholder="New Password"></asp:TextBox>
    </div>
    <div>
        <%--<asp:Label ID="Label4" runat="server" Text="Re-Enter Password"></asp:Label>--%>
        <br />
        <asp:TextBox ID="txtNewPw2" runat="server" class="textFields" placeholder="Re-enter Password"></asp:TextBox>
    </div>
            <br />
    <div>
        <asp:Button ID="btnSave" class="submit-button" runat="server" OnClick="btnSave_Click" Text="Save" />
    </div>
            <div></div>
            </div>
    </asp:Content>