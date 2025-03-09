<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ShowUser.aspx.cs" Inherits="PrimeMart.Admin.ShowUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show User Data</title>
</head>
<body>
        <div>
            <h1>User Data</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="First_Name" HeaderText="First Name" />
                    <asp:BoundField DataField="Last_Name" HeaderText="Last Name" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="Phone_Number" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="State" HeaderText="State" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="Postal_Code" HeaderText="Postal Code" />
                </Columns>
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
</asp:Content>--%>
