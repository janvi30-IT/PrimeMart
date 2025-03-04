<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product_form.aspx.cs" Inherits="PrimeMart.Admin.Product_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="form-wrapper">
        <div class="form-container">
            <h2>Product Form</h2>

            <!-- Category Selection -->
            <div class="form-group">
                <label for="ddlCategory">Category Name:</label>
               <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" AppendDataBoundItems="true">
    <asp:ListItem Text="" Value="" />
</asp:DropDownList>
            </div>

            <!-- Product Name -->
            <div class="form-group">
                <label for="txtProductName">Product Name</label>
                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" placeholder="Enter Product Name" />
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="txtPrice">Price</label>
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter Price" TextMode="Number" />
            </div>

            <!-- Stock -->
            <div class="form-group">
                <label for="txtStock">Stock</label>
                <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" placeholder="Enter Stock Quantity" TextMode="Number" />
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="txtDescription">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Enter Product Description" />
            </div>

            <!-- Image URL -->
          <div class="form-group">
    <label for="fuProductImage">Upload Image</label>
    <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control" />
</div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <br>
                 <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

        </div>
    </div>


    <!-- CSS Styling -->
    <style>
    /* Full-page Background */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: url('../images/imgproduct.jpg') no-repeat center center/cover;
    min-height: 100vh;
}

/* Main Content Wrapper */
.form-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: calc(100vh - 60px); /* Adjust based on header height */
    padding: 20px;
}

/* Form container */
.form-container {
    background: rgba(255, 255, 255, 0.9);
    max-width: 450px;
    width: 100%;
    padding: 40px 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

/* Adjust input fields */
.form-container input, 
.form-container select, 
.form-container textarea {
    width: 100%;
    padding: 12px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    box-sizing: border-box;
}

/* Button */
.form-container .btn {
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

.form-container .btn:hover {
    background-color: brown;
}
</style>
</asp:Content>
