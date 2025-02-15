<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PrimeMart.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <h2 class="dashboard-title">Admin Dashboard</h2>

    <!-- Dashboard Cards -->
    <div class="dashboard-container">
        <asp:Panel ID="pnlCards" runat="server">
            <div class="dashboard-card">
                <h3>Total Categories</h3>
                <asp:Label ID="lblTotalCategories" runat="server" CssClass="dashboard-value" />
            </div>
            <div class="dashboard-card">
                <h3>Total Products</h3>
                <asp:Label ID="lblTotalProducts" runat="server" CssClass="dashboard-value" />
            </div>
            <div class="dashboard-card">
                <h3>Total Customers</h3>
                <asp:Label ID="lblTotalCustomers" runat="server" CssClass="dashboard-value" />
            </div>
            <div class="dashboard-card">
                <h3>Total Orders</h3>
                <asp:Label ID="lblTotalOrders" runat="server" CssClass="dashboard-value" />
            </div>
            <div class="dashboard-card">
                <h3>Total Revenue</h3>
                <asp:Label ID="lblTotalRevenue" runat="server" CssClass="dashboard-value" />
            </div>
        </asp:Panel>
    </div>

    <!-- Recent Orders Table -->
    <h3 class="section-title">Recent Orders</h3>
    <asp:GridView ID="gvRecentOrders" runat="server" AutoGenerateColumns="False" CssClass="dashboard-table" GridLines="None">
        <Columns>
            <asp:BoundField DataField="Order_id" HeaderText="Order ID" />
            <asp:BoundField DataField="Username" HeaderText="Customer" />
            <asp:BoundField DataField="OrderDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
        </Columns>
    </asp:GridView>

</asp:Content>

