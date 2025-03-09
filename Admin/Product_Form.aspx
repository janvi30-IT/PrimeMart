<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product_form.aspx.cs" Inherits="PrimeMart.Admin.Product_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-wrapper">
        <div class="form-container">
            <h2 class="form-title">Product Form</h2>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" DisplayMode="BulletList" />

            <!-- Category Selection -->
            <div class="form-group">
                <label for="ddlCategory">Category Name:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Category" Value="" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                    InitialValue="" ErrorMessage="Please select a category" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Product Name -->
            <div class="form-group">
                <label for="txtProductName">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name" />
                <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName"
                    ErrorMessage="Product Name is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price" TextMode="Number" />
                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice"
                    ErrorMessage="Price is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="txtPrice"
                    Operator="GreaterThan" ValueToCompare="0" Type="Double" ErrorMessage="Price must be greater than 0" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Stock -->
            <div class="form-group">
                <label for="txtStock">Stock:</label>
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="Enter Stock Quantity" TextMode="Number" />
                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock"
                    ErrorMessage="Stock is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CompareValidator ID="cvStock" runat="server" ControlToValidate="txtStock"
                    Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer" ErrorMessage="Stock must be 0 or more" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter Product Description" />
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label for="fuProductImage">Upload Image:</label>
                <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fuProductImage"
                    ErrorMessage="Please upload an image" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CustomValidator ID="cvFileUpload" runat="server" ControlToValidate="fuProductImage"
                    ErrorMessage="Only .jpg, .jpeg, .png, .gif files are allowed."
                    OnServerValidate="ValidateFileUpload" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>

            <!-- Success/Error Message -->
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="message-label"></asp:Label>
        </div>
    </div>

    <!-- CSS Styling -->
    <style>
        /* Full-page Background */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background: url('../images/imgproduct.jpg') no-repeat center center/cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Form Wrapper */
        .form-wrapper {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* Form Title */
        .form-title {
            text-align: center;
            color: saddlebrown;
            margin-bottom: 20px;
        }

        /* Form Group */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        /* Form Controls */
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: saddlebrown;
            outline: none;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 12px;
            background-color: saddlebrown;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: brown;
        }

        /* Validation Styles */
        .validation-summary {
            color: red;
            margin-bottom: 15px;
        }

        .validation-error {
            color: red;
            font-size: 12px;
            display: block;
            margin-top: 5px;
        }

        /* Message Label */
        .message-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</asp:Content>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product_form.aspx.cs" Inherits="PrimeMart.Admin.Product_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 250px; /* Adjust this value to match the sidebar width */
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Form Wrapper Styles */
        .form-wrapper {
            width: 100%;
            max-width: 500px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Form Title */
        .form-title {
            text-align: center;
            color: saddlebrown;
            margin-bottom: 20px;
        }

        /* Form Group */
        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        /* Form Controls */
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-control:focus {
            border-color: saddlebrown;
            outline: none;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 12px;
            background-color: saddlebrown;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: brown;
        }

        /* Validation Styles */
        .validation-summary {
            color: red;
            margin-bottom: 15px;
        }

        .validation-error {
            color: red;
            font-size: 12px;
            display: block;
            margin-top: 5px;
        }

        /* Message Label */
        .message-label {
            display: block;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>

    <div class="main-content">
        <div class="form-wrapper">
            <h2 class="form-title">Product Form</h2>

            <!-- Validation Summary -->
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation-summary" DisplayMode="BulletList" />

            <!-- Category Selection -->
            <div class="form-group">
                <label for="ddlCategory">Category Name:</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Category" Value="" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvCategory" runat="server" ControlToValidate="ddlCategory"
                    InitialValue="" ErrorMessage="Please select a category" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Product Name -->
            <div class="form-group">
                <label for="txtProductName">Product Name:</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name" />
                <asp:RequiredFieldValidator ID="rfvProductName" runat="server" ControlToValidate="txtProductName"
                    ErrorMessage="Product Name is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="txtPrice">Price:</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price" TextMode="Number" />
                <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ControlToValidate="txtPrice"
                    ErrorMessage="Price is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CompareValidator ID="cvPrice" runat="server" ControlToValidate="txtPrice"
                    Operator="GreaterThan" ValueToCompare="0" Type="Double" ErrorMessage="Price must be greater than 0" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Stock -->
            <div class="form-group">
                <label for="txtStock">Stock:</label>
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="Enter Stock Quantity" TextMode="Number" />
                <asp:RequiredFieldValidator ID="rfvStock" runat="server" ControlToValidate="txtStock"
                    ErrorMessage="Stock is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CompareValidator ID="cvStock" runat="server" ControlToValidate="txtStock"
                    Operator="GreaterThanEqual" ValueToCompare="0" Type="Integer" ErrorMessage="Stock must be 0 or more" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Enter Product Description" />
                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                    ErrorMessage="Description is required" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label for="fuProductImage">Upload Image:</label>
                <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" ControlToValidate="fuProductImage"
                    ErrorMessage="Please upload an image" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
                <asp:CustomValidator ID="cvFileUpload" runat="server" ControlToValidate="fuProductImage"
                    ErrorMessage="Only .jpg, .jpeg, .png, .gif files are allowed."
                    OnServerValidate="ValidateFileUpload" ForeColor="Red" Display="Dynamic" CssClass="validation-error" />
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>

            <!-- Success/Error Message -->
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" CssClass="message-label"></asp:Label>
        </div>
    </div>
</asp:Content>