<%@ Page Title="" Language="C#" MasterPageFile="~/PrimeMart.Master" AutoEventWireup="true" CodeBehind="PersonalCareAppliances.aspx.cs" Inherits="PrimeMart.PersonalCareAppliances" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
/* Product Grid */
.product-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 40px;
    padding: 20px;
    margin: 0 auto;
    max-width: 1200px;
}

/* Product Card */
.product-card {
    width: 250px;
    padding: 15px;
    margin: 15px;
    border: 1px solid #ccc;
    text-align: center;
    border-radius: 8px;
    background-color: #f9f9f9;
    box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.15);
}

/* Product Image */
.product-image {
    width: 120px;
    height: 120px;
    object-fit: contain;
    border-radius: 5px;
}

/* Product Name */
.product-name {
    font-size: 18px;
    font-weight: bold;
}

/* Product Price */
.product-price {
    font-size: 16px;
    color: gray;
}

/* Quantity Container (Inline) */
.quantity-container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px; /* Quantity और Textbox के बीच स्पेस */
    margin-bottom: 10px;
}

/* Quantity Input */
.quantity-input {
    padding: 5px;
    width: 50px;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Add to Cart Button (Dark Brown, छोटा) */
.btn-add-to-cart {
    background-color: #5A3E1B; /* Dark Brown */
    color: white;
    padding: 5px 8px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 12px;
    font-weight: bold;
}

.btn-add-to-cart:hover {
    background-color: #4A2F15; /* Hover Effect */
}

/* Grid View Styling */
.gridview-style {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    padding: 40px;
    text-align: center;
    max-width: 1400px;
    margin: 0 auto;
}

/* Product Container */
.product-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 30px;
}
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="10" CssClass="product-container">
    <ItemTemplate>
        <div class="product-card">
            <img src='<%# Eval("ImagePath") %>' class="product-image" onerror="this.src='default.jpg';" />
            <h3 class="product-name"><%# Eval("Product_Name") %></h3>
            <p class="product-price">Price: ₹<%# Eval("Price") %></p>

            <div class="quantity-container">
                <label>Quantity:</label>
                <asp:TextBox ID="txtQuantity" runat="server" CssClass="quantity-input" Placeholder="Qty"></asp:TextBox>
            </div>

            <asp:Button ID="btnAddToCart" runat="server" Text="ADD TO CART" CssClass="btn-add-to-cart" />
        </div>
    </ItemTemplate>
</asp:DataList>

</asp:Content>
