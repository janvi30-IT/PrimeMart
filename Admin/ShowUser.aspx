<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ShowUser.aspx.cs" Inherits="PrimeMart.Admin.ShowUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .gridview th, .gridview td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .gridview th {
            background-color: #4CAF50;
            color: white;
        }
        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .gridview tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .btn-edit {
            background-color: #2196F3;
            color: white;
        }
        .btn-delete {
            background-color: #f44336;
            color: white;
        }
        .message-label {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>

    <h1>User List</h1>
    <asp:Label ID="lblMessage" runat="server" CssClass="message-label"></asp:Label>
    <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="Username"
        OnRowEditing="GridViewUsers_RowEditing" OnRowUpdating="GridViewUsers_RowUpdating"
        OnRowCancelingEdit="GridViewUsers_RowCancelingEdit" CssClass="gridview">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="true" />

            <asp:BoundField DataField="First_Name" HeaderText="First Name" ReadOnly="true" />

            <asp:BoundField DataField="Last_Name" HeaderText="Last Name" ReadOnly="true" />

            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlRole" runat="server" SelectedValue='<%# Bind("Role") %>'>
                        <asp:ListItem Text="Customer" Value="Customer" />
                        <asp:ListItem Text="Prime Customer" Value="Prime Customer" />
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("IsActive").ToString() == "True" ? "Active" : "Inactive" %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox ID="chkStatus" runat="server" Checked='<%# Bind("IsActive") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-edit" />
        </Columns>
    </asp:GridView>
</asp:Content>