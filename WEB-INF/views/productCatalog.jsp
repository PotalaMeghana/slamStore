<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ page import="eStoreProduct.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container mt-5">
        <h2>Product Catalog</h2>
        <div class="row mt-4">
            Iterate over the products and render the HTML content
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");

                for (Product product : products) { session.setAttribute("product",product);
            %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="prodDescription"><img class="card-img-top" src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>"></a>
                    <div class="card-body">
                        <h5 class="card-title"><%= product.getName() %></h5>
                        <p class="card-text"><%= product.getDescription() %></p>
                        <p class="card-text"><%= product.getPrice() %></p>
                        <button class="btn btn-primary addToCartButton" data-product-id="<%= product.getId() %>">Add To Cart</button>
                        <button class="btn btn-secondary addToWishlistButton" data-product-id="<%= product.getId() %>">Add to Wishlist</button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html> --%>



<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.*" %>
<%@ page import="eStoreProduct.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Catalog</title>
</head>
<body>
<div class="container mt-5">
        <h2>Product Catalog</h2>
        <div class="row mt-4">
            Iterate over the products and render the HTML content
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");

                for (Product product : products) {
                    session.setAttribute("productClick", product);
            %>
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="card h-100">
                    <a href="prodDescription"><img class="card-img-top" src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>"></a>
                    <div class="card-body">
                        <h5 class="card-title"><%= product.getName() %></h5>
                        <p class="card-text"><%= product.getDescription() %></p>
                        <p class="card-text"><%= product.getPrice() %></p>
                        <button class="btn btn-primary addToCartButton" data-product-id="<%= product.getId() %>">Add To Cart</button>
                        <button class="btn btn-secondary addToWishlistButton" data-product-id="<%= product.getId() %>">Add to Wishlist</button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
 --%>
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.*" %>
<%@ page import="eStoreProduct.model.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Catalog</title>
<script>
    function showProductDetails(productId) {
        window.location.href = "prodDescription?productId=" + productId;
    }
</script>
</head>
<body>
<div class="container mt-5">
    <h2>Product Catalog</h2>
    <div class="row mt-4">
        <%-- Iterate over the products and render the HTML content --%>
        <%
            List<Product> products = (List<Product>) request.getAttribute("products");

            for (Product product : products) {
        %>
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <a href="javascript:void(0)" onclick="showProductDetails('<%= product.getId() %>')">
                    <img class="card-img-top" src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                </a>
                <div class="card-body">
                    <h5 class="card-title"><%= product.getName() %></h5>
                    <p class="card-text"><%= product.getDescription() %></p>
                    <p class="card-text"><%= product.getPrice() %></p>
                    <button class="btn btn-primary addToCartButton" data-product-id="<%= product.getId() %>">Add To Cart</button>
                    <button class="btn btn-secondary addToWishlistButton" data-product-id="<%= product.getId() %>">Add to Wishlist</button>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
 