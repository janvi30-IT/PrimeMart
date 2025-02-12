<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(0, 0, 0, 0.6);
            overflow: hidden;
        }
        .carousel {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            z-index: -1;
        }
        .carousel img {
            height: 100vh;
            width: 100%;
            object-fit: cover;
            opacity: 0.4;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 100%;
            position: relative;
            z-index: 1;
        }
        .btn-custom {
            border-radius: 20px;
            width: 48%;
            background-color:brown ;
            color:azure;
            border: none;
        }
        .btn-custom:hover {
            background-color:brown ;
        }
    </style>
</head>
<body>
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/img1.png" class="d-block w-100" alt="Category 1">
            </div>
            <div class="carousel-item">
                <img src="images/img2.jpg" class="d-block w-100" alt="Category 2">
            </div>
            <div class="carousel-item">
                <img src="images/img3.png" class="d-block w-100" alt="Category 3">
            </div>
        </div>
    </div>
    
    <div class="form-container">
        <h2 class="text-center">Categories Form</h2>
        <form>
            <div class="mb-3">
                <label for="categoryId" class="form-label">Category ID</label>
                <input type="text" class="form-control" id="categoryId" placeholder="Enter Category ID">
            </div>
            <div class="mb-3">
                <label for="categoryName" class="form-label">Category Name</label>
                <input type="text" class="form-control" id="categoryName" placeholder="Enter Category Name">
            </div>
            <div class="mb-3">
                <label for="imageUrl" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="imageUrl" placeholder="Enter Image URL" oninput="previewImage()">
            </div>
            <div class="mb-3 text-center">
                <img id="imagePreview" src="#" alt="Image Preview" style="max-width:100%; height:150px; display:none;">
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-custom">Add</button>
                <button type="reset" class="btn btn-custom">Reset</button>
            </div>
        </form>
    </div>

    <script>
        function previewImage() {
            var url = document.getElementById("imageUrl").value;
            var img = document.getElementById("imagePreview");
            if (url) {
                img.src = url;
                img.style.display = "block";
            } else {
                img.style.display = "none";
            }
        }
    </script>
</body>
</html>