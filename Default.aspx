<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StayBeautifulSMS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="body">
        <div class="container">
            <nav class="navbar">
                <div class="nav_icon" onclick="toggleSidebar()">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <div class="navbar__left">
      <%--              <a href="#">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </a>
                    <a href="#">
                        <i class="fa fa-clock-o" aria-hidden="true"></i>
                    </a>--%>
                     <span class="font-bold text-title" id="username" runat="server"></span>
                    <a href="#">
                        <img width="30" src="assets/avatar.svg" alt="" />
                        <!-- <i class="fa fa-user-circle-o" aria-hidden="true"></i> -->
                    </a>
                </div>
            </nav>

            <main>
                <div class="main__container">
                    <!-- MAIN TITLE STARTS HERE -->

                    <div class="main__title">
                        <img src="assets/hello.svg" alt="" />
                        <div class="main__greeting">
                            <h1>Stay Beautiful Management System</h1>
                            <p>Admin Dashboard</p>

                        </div>
                    </div>

                    <!-- MAIN TITLE ENDS HERE -->

                    <!-- MAIN CARDS STARTS HERE -->
                    <div class="main__cards">
                        <div class="card">
                            <i
                                class="fa fa-user-o fa-2x text-lightblue"
                                aria-hidden="true"></i>
                            <div class="card_inner">
                                <p class="text-primary-p">Number of brands</p>
                                <span class="font-bold text-title" id="brands" runat="server"></span>
                            </div>
                        </div>

                        <div class="card">
                            <i class="fa fa-calendar fa-2x text-red" aria-hidden="true"></i>
                            <div class="card_inner">
                                <p class="text-primary-p">Number of items</p>
                                <span class="font-bold text-title" id="items" runat="server"></span>
                            </div>
                        </div>

                        <div class="card">
                            <i
                                class="fa fa-video-camera fa-2x text-yellow"
                                aria-hidden="true"></i>
                            <div class="card_inner">
                                <p class="text-primary-p">Number of customers</p>
                                <span class="font-bold text-title" id="customers" runat="server"></span>
                            </div>
                        </div>

                        <div class="card">
                            <i
                                class="fa fa-thumbs-up fa-2x text-green"
                                aria-hidden="true"></i>
                            <div class="card_inner">
                                <p class="text-primary-p">Number of purchases</p>
                                <span class="font-bold text-title" id="purchases" runat="server"></span>
                            </div>
                        </div>
                    </div>
                    <!-- MAIN CARDS ENDS HERE -->

                    <!-- CHARTS STARTS HERE -->
                    <div class="charts">
                        <div class="charts__left">
                            <img src="Assets/bg.png" style="width: 620px; object-fit: contain;"
                                alt="Background">
                            <%--                            <div class="charts__left__title">
                                <div>
                                    <h1>Daily Reports</h1>
                                    <p>Cupertino, California, USA</p>
                                </div>
                                <i class="fa fa-usd" aria-hidden="true"></i>
                            </div>
                            <div id="apex1"></div>--%>
                        </div>

                        <div class="charts__right">
                            <div class="charts__right__title">
                                <div>
                                    <h1>Details</h1>
                                </div>
                                <i class="fa fa-usd" aria-hidden="true"></i>
                            </div>

                            <div class="charts__right__cards">
                                <div class="card1">
                                    <h3>Categories</h3>
                                    <span class="font-bold text-title" style="font-size:2em" id="totalCategories" runat="server"></span>

                                </div>

                                <div class="card2">
                                    <h3>Low In Stock</h3>
                                    <span class="font-bold text-title" style="font-size:2em" id="lowStock" runat="server"></span>
                                </div>

                                <div class="card3">
                                    <h3>Inactive Customers</h3>
                                    <span class="font-bold text-title" style="font-size:2em" id="inactiveCustomer" runat="server"></span>
                                </div>

                                <div class="card4">
                                    <h3>Unsold Stock</h3>
                                    <span class="font-bold text-title" style="font-size:2em" id="unsoldStock" runat="server"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- CHARTS ENDS HERE -->
                </div>
            </main>


        </div>

        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script src="Scripts/dashboard.js"></script>

    </div>

    <%--</html>--%>
</asp:Content>
