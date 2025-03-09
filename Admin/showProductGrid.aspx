<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="showProductGrid.aspx.cs" Inherits="PrimeMart.Admin.showProductGrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        /* General styling for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        /* GridView styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 14px;
        }

        .gridview th, .gridview td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .gridview th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
        }

        /* Image styling */
        .gridview img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
        }

        /* Button styling */
        .gridview .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 12px;
        }

        .gridview .btn-edit {
            background-color: #2196F3;
            color: white;
        }

        .gridview .btn-delete {
            background-color: #f44336;
            color: white;
        }

        .gridview .btn-edit:hover {
            background-color: #0b7dda;
        }

        .gridview .btn-delete:hover {
            background-color: #da190b;
        }

        /* Header styling */
        h1 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        /* Success message styling */
        .success-message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
    </style>

    <h1>Product List</h1>
    <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>
    <asp:GridView ID="GridViewProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="Product_id"
        OnRowEditing="GridViewProducts_RowEditing" OnRowUpdating="GridViewProducts_RowUpdating"
        OnRowCancelingEdit="GridViewProducts_RowCancelingEdit" OnRowDeleting="GridViewProducts_RowDeleting"
        CssClass="gridview">
        <Columns>
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Stock">
                <ItemTemplate>
                    <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtStock" runat="server" Text='<%# Bind("Stock") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/" + Eval("ImagePath") %>' Height="100" Width="100" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/" + Eval("ImagePath") %>' Height="100" Width="100" />
                    <br />
                    <asp:FileUpload ID="FileUploadImage" runat="server" />
                    <asp:HiddenField ID="hdnImagePath" runat="server" Value='<%# Eval("ImagePath") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" ButtonType="Button" EditText="Edit" UpdateText="Update" CancelText="Cancel"
                ControlStyle-CssClass="btn btn-edit" />
            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" DeleteText="Delete"
                ControlStyle-CssClass="btn btn-delete" />
        </Columns>
    </asp:GridView>
</asp:Content>