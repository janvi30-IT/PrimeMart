<%@ Page Title="" Language="C#" MasterPageFile="~/PrimeMart.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PrimeMart.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Custom Carousel Styling */
#carouselExampleRide {
    width: 100%; /* Full width */
    max-width: 2000px; /* Maximum width for larger screens */
    margin: 20px auto; /* Center the carousel */
    border: 1px solid #ddd; /* Optional border */
    border-radius: 8px; /* Rounded corners */
    overflow: hidden; /* Hide overflow */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow for depth */
}

/* Carousel Images */
#carouselExampleRide img {
    height: 500px; /* Increased height from 300px to 500px */
    object-fit: cover; /* Ensure images cover the container without distortion */
    width: 100%; /* Full width */
}

/* Updated Controls Styling: Remove "<" and ">" */
.carousel-control-prev-icon,
.carousel-control-next-icon {
    background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black background */
    border-radius: 50%; /* Circular button */
    width: 50px; /* Increase button size */
    height: 50px;
}



.carousel-control-prev,
.carousel-control-next {
    top: 50%; /* Center vertically */
    transform: translateY(-50%);
}

/* Hide visually-hidden labels */
.carousel .visually-hidden {
    display: none; /* Fully hide visually-hidden labels */
}

/* On Hover: Darker navigation buttons */
.carousel-control-prev-icon,
.carousel-control-next-icon {
    display: none !important;
}




/* Popular Categories Section */
.popular-categories {
    text-align: center;
    margin: 20px 0;

}

    .popular-categories h2 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

.categories-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px; /* Space between items */
}

.category-item {
    width: 120px;
    text-align: center;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
}


  .category-item img {
        width: 80px; /* Adjust image size */
        height: 80px;
        object-fit: contain; /* Keep aspect ratio */
        margin-bottom: 10px;
    }

    .category-item p {
        font-size: 14px;
        font-weight: 500;
        margin: 0;
    }

    .category-item:hover {
        transform: translateY(-5px); /* Slight hover effect */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }


    .custom-image-container {
    width: 100%;
    margin: 40px auto; /* Add some vertical spacing */
    text-align: center; /* Center the image */
    padding: 10px;
    background-color: #f8f9fa; /* Optional background color */
}

.custom-image-container img {
    max-width: 100%;
    height: auto;
    border-radius: 8px; /* Optional: rounds the image corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional: adds a subtle shadow */
}


.custom-two-images-container {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 20px;           /* Space between images */
    margin: 40px auto;   /* Vertical spacing */
    flex-wrap: wrap;     /* Wrap on smaller screens */
}

.custom-two-images-container img {
    max-width: 48%;      /* Each image takes about half the container width */
    width: 100%;
    height: auto;
    border-radius: 8px;  /* Optional: rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional: subtle shadow */
}

.three-images-container {
    display: flex;
    justify-content: center;
    gap: 10px; /* Adjust spacing between images */
    margin: 20px auto;
    flex-wrap: wrap; /* Responsive behavior */
}

.three-images-container img {
    width: 32%; /* 3 images in one row */
    height: 250px; /* Adjust height */
    object-fit: contain; /* Prevents cropping */
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #fff; /* Adds a background if images have transparency */
}

    .custom-image-container {
    width: 100%;
    margin: 40px auto; /* Add some vertical spacing */
    text-align: center; /* Center the image */
    padding: 10px;
    background-color: #f8f9fa; /* Optional background color */
}

.custom-image-container img {
    max-width: 100%;
    height: auto;
    border-radius: 8px; /* Optional: rounds the image corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional: adds a subtle shadow */
}

 footer {
        background-color: #3a1f1f;
        color: #ffffff;
    }

    footer a {
        text-decoration: none;
    }

    footer a:hover {
        color: #ff5722;
    }

    footer p {
        font-size: 14px;
        margin-top: 10px;
    }


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div id="carouselExampleRide" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Images/b2.png" class="d-block w-100" alt="PrimeMart Grocessry">
            </div>
            <div class="carousel-item">
                <img src="Images/b22.png" class="d-block w-100" alt="Dairy Products">
            </div>
            
                <div class="carousel-item">
         <img src='<%= ResolveUrl("~/Images/summer.png") %>' class="d-block w-100" alt="Summer">
    </div>
             
                <div class="carousel-item">
         <img src='<%= ResolveUrl("~/Images/Kitchen.png") %>' class="d-block w-100" alt="Kitchen">
    </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleRide" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    
    <div class="popular-categories">
        <h2>Popular Categories</h2>
        <div class="categories-container">
            <div class="category-item">
                <img src="Images/popularCategories/dairy.png" alt="Dairy">
                <p>Dairy</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/tea.png" alt="Tea">
                <p>Tea</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/softdrinks.png" alt="Soft Drinks">
                <p>Soft Drinks</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/cleaners.png" alt="Cleaners">
                <p>Cleaners</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/soaps.png" alt="Bath Soaps">
                <p>Bath Soaps</p>
            </div>

             <div class="category-item">
                <img src="Images/popularCategories/toothpaste.png" alt="Toothpaste">
                <p>Toothpaste</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/shampoos.png" alt="Shampoos">
                <p>Shampoos</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/poojaneeds.png" alt="Pooja Needs">
                <p>Pooja Needs</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/towels.png" alt="Towels">
                <p>Towels</p>
            </div>
            <div class="category-item">
                <img src="Images/popularCategories/bath-unity.png" alt="Bath Utility">
                <p>Bath Utility</p>
            </div>
        </div>

        <div class="custom-image-container">
    <!-- Using encoded filename -->
    <img src='<%= ResolveUrl("~/Images/50%25off.png") %>' class="d-block w-100" alt="50%off">
</div>

    </div>
<div class="custom-two-images-container">
    <img src='<%= ResolveUrl("~/Images/icecreams.jpg") %>' alt="Ice Creams" class="img-fluid">
     <img src='<%= ResolveUrl("~/Images/breakfast.jpg") %>' alt="Breakfast" class="img-fluid">
</div>


   <div class="three-images-container">
    <img src='<%= ResolveUrl("~/Images/3cw_breakfast.jpg") %>' alt="Breakfast" class="img-fluid">
    <img src='<%= ResolveUrl("~/Images/3cw_homedecor.jpg") %>' alt="Home Decor" class="img-fluid">
    <img src='<%= ResolveUrl("~/Images/3cw_stationery.jpg") %>' alt="Stationery" class="img-fluid">
</div>

            <div class="custom-image-container">
                <!-- Using encoded filename -->
                 <img src='<%= ResolveUrl("~/Images/chinese_cornor.jpg") %>' class="d-block w-100" alt="50%off">
            </div>



   <div class="custom-image-container">
     <img src='<%= ResolveUrl("~/Images/vegetables.jpg") %>' alt="Breakfast" class="img-fluid">
   </div>


    <div class="custom-two-images-container">
    <img src='<%= ResolveUrl("~/Images/applience.jpg") %>' alt="Ice Creams" class="img-fluid">
     <img src='<%= ResolveUrl("~/Images/cooker.jpg") %>' alt="Breakfast" class="img-fluid">
</div>


    
    <div class="custom-image-container">
  <img src='<%= ResolveUrl("~/Images/dog_cat.jpg") %>' alt="dog_cat" class="img-fluid">
</div>


<div class="custom-image-container">
  <img src='<%= ResolveUrl("~/Images/baby_care.jpg") %>' alt="baby_care" class="img-fluid">
</div>




<!-- Footer Section -->
<footer class="bg-custom text-white py-4">
    <div class="container text-center">
        <div class="row">
            <div class="col-12 col-md-4">
                <h5>About Us</h5>
                <p>We are a leading e-commerce platform providing top-quality products to our customers worldwide. Our mission is to deliver excellent service and affordable prices.</p>
            </div>
            <div class="col-12 col-md-4">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">Home</a></li>
                    <li><a href="#" class="text-white">Shop</a></li>
                    <li><a href="#" class="text-white">Categories</a></li>
                    <li><a href="#" class="text-white">Contact Us</a></li>
                    <li><a href="#" class="text-white">Privacy Policy</a></li>
                </ul>
            </div>
            <div class="col-12 col-md-4">
                <h5>Contact Us</h5>
                <p>Email: support@primemart.com</p>
                <p>Phone: +123 456 7890</p>
                <p>Address: 123 PrimeMart Street, City, Country</p>
            </div>
        </div>
        <div class="mt-4">
            <p>&copy; 2025 PrimeMart. All rights reserved.</p>
        </div>
    </div>
</footer>
</div>
</asp:Content>




