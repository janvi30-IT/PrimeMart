
<%--
<%@ Page Title="Product Form" Language="C#" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="true" CodeBehind="Product_Form.aspx.cs" Inherits="PrimeMart.Product_Form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Bootstrap CSS (Include in Master Page if not already included) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <!-- Carousel Background (Copied from Categories Form) -->
    <div id="carouselBackground" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../images/bg1.jpg" class="d-block w-100" alt="Image 1">
            </div>
            <div class="carousel-item">
                <img src="../images/bg2.jpg" class="d-block w-100" alt="Image 2">
            </div>
            <div class="carousel-item">
                <img src="../images/bg3.jpg" class="d-block w-100" alt="Image 3">
            </div>
        </div>
    </div>

    <!-- Product Form -->
    <div class="form-container">
        <h2 class="text-center">Product Form</h2>
        
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" placeholder="Enter Product Name">
        </div>

        <div class="mb-3">
            <label for="category" class="form-label">Category</label>
            <select class="form-control" id="category">
                <option>Select Category</option>
                <option>Electronics</option>
                <option>Clothing</option>
                <option>Home Appliances</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="number" class="form-control" id="price" placeholder="Enter Price">
        </div>

        <div class="mb-3">
            <label for="stock" class="form-label">Stock Quantity</label>
            <input type="number" class="form-control" id="stock" placeholder="Enter Stock Quantity">
        </div>

        <div class="mb-3">
            <label for="productImageUrl" class="form-label">Product Image URL</label>
            <input type="text" class="form-control" id="productImageUrl" placeholder="Enter Image URL" oninput="previewImage()">
        </div>

        <div class="mb-3 text-center">
            <img id="imagePreview" src="#" alt="Image Preview" style="max-width:100%; height:150px; display:none;">
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-custom">Add Product</button>
            <button type="reset" class="btn btn-custom">Reset</button>
        </div>
    </div>

    <!-- Bootstrap JS (Include in Master Page if not already included) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom CSS -->
    <style>
        /* Carousel Full Page Background */
        #carouselBackground {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            z-index: -1; /* Sends it to the background */
        }
        #carouselBackground .carousel-inner img {
            object-fit: cover;
            width: 100%;
            height: 100vh;
            filter: brightness(0.6); /* Darken the background slightly */
        }
        /* Form Styling */
        .form-container {
            background: rgba(255, 255, 255, 0.85);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 1;
        }
        .btn-custom {
            border-radius: 20px;
            background-color: brown;
            color: azure;
            border: none;
        }
        .btn-custom:hover {
            background-color: darkred;
        }
    </style>

    <!-- Image Preview Script -->
    <script>
        function previewImage() {
            var url = document.getElementById("productImageUrl").value;
            var img = document.getElementById("imagePreview");
            if (url) {
                img.src = url;
                img.style.display = "block";
            } else {
                img.style.display = "none";
            }
        }
    </script>
</asp:Content>--%>
<%@ Page Title="Product Form" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Product_Form.aspx.cs" Inherits="PrimeMart.Product_Form" %>

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
