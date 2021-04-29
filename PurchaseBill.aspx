<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PurchaseBill.aspx.cs" Inherits="StayBeautifulSMS.PurchaseBill" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="billBody" style="padding:6rem 0 5rem 5rem;">
    <div>
        <asp:Label ID="Label8" style="font-size:30px; font-weight:bolder" class="headings" runat="server" Text="Billing"></asp:Label>
    </div>
    <br/>
    <br/>
    <br/>
     <div>
        <asp:Label ID="Label1" runat="server" style="font-weight:bold; font-size:16px;" Text="Purchase ID - "></asp:Label>
        <asp:Label ID="lblPID" style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:Label ID="Label3" runat="server" style="font-weight:bold; font-size:16px;" Text="Purchased Date - "></asp:Label>
        <asp:Label ID="lblPD"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:Label ID="Label5" runat="server"  style="font-weight:bold; font-size:16px;" Text="Customer ID - "></asp:Label>
        <asp:Label ID="lblCID"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:Label ID="Label7" runat="server"  style="font-weight:bold; font-size:16px;" Text="Customer Name - "></asp:Label>
        <asp:Label ID="lblCN"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <br/>
    <br/>
    <div>
        <asp:Label ID="Label9" runat="server"  style="font-weight:bold; font-size:16px;" Text="Billing By - "></asp:Label>
        <asp:Label ID="lblBill"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:GridView ID="billGridView" runat="server" Height="169px" HorizontalAlign="Justify" PageSize="15" Width="1200px" GridLines="Horizontal" BorderColor="#CCCCCC" BorderStyle="None" CellPadding="60" CellSpacing="35"></asp:GridView>
    </div>
    <br/>
    <br/>
    <br/>
    <div>
        <asp:Label ID="Label2" runat="server"  style="font-weight:bold; font-size:16px;" Text="Amount - "></asp:Label>
        <asp:Label ID="lblAmount"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:Label ID="Label4" runat="server"  style="font-weight:bold; font-size:16px;" Text="Discount - "></asp:Label>
        <asp:Label ID="lblDis"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
    <br/>
    <div>
        <asp:Label ID="Label6" runat="server"  style="font-weight:bold; font-size:16px;" Text="Total Amount - "></asp:Label>
        <asp:Label ID="lblTotal"  style="font-size:18px; color:green;" runat="server"></asp:Label>
    </div>
        </div>
    </asp:Content>