<%@ Page Title="Categories_form" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Categories_form.aspx.cs" Inherits="PrimeMart.Categories_form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
 
 <!-- Carousel Background -->
 <div id="carouselBackground" class="carousel slide" data-bs-ride="carousel">
     <div class="carousel-inner">
         <div class="carousel-item active">
             <img src="../images/img2.jpg" class="d-block w-100" alt="Image 1">
         </div>
         <div class="carousel-item">
             <img src="../images/img1.png" class="d-block w-100" alt="Image 2">
         </div>
     </div>
 </div>

 <!-- Form Container -->
 <div class="form-container">
     <h2 class="text-center">Categories Form</h2>

     <div class="mb-3">
         <label class="form-label">Category_Name</label>
         <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="Enter Category Name"></asp:TextBox>
     </div>

     <div class="mb-3">
            <label class="form-label">Upload Image</label>
            <asp:FileUpload ID="fuImage" runat="server" CssClass="form-control" />
     </div>

     <div class="mb-3 text-center">
         <img id="imagePreview" src="#" alt="Image Preview" style="max-width:100%; height:150px; display:none;">
     </div>

     <div class="text-center">
         <asp:Button ID="btnAddCategory" runat="server" Text="Add" CssClass="btn btn-custom" OnClick="btnAddCategory_Click"  />
         &nbsp; &nbsp;
         <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-custom"  />
     </div>

     <br />
     <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
 </div>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



 <style>
     /* Background & Styling */
     #carouselBackground {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         height: 100vh;
         z-index: -1;
     }
     #carouselBackground .carousel-inner img {
         object-fit: cover;
         width: 100%;
         height: 100vh;
         filter: brightness(0.6);
     }
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
</asp:Content>
