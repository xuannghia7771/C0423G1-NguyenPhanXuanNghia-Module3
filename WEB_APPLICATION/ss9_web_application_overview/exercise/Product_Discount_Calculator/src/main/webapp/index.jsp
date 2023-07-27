<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Product Discount Calculator</title>
  <style>
    input{
      margin: 10px;
      padding: 5px;
    }

  </style>
</head>
<form action="/calculate" method="post">
  <label for="PD">Product Description:</label><br>
  <input type="text" name="product-description" placeholder="Product Description" id="PD">
  <br>
  <label for="LP">List Price:</label><br>
  <input type="text" name="list-price" placeholder="List Price" id="LP">
  <br>
  <label for="DP">Discount Percent:</label><br>
  <input type="number" name="discount-percent" placeholder="Discount Percent" id="DP">
  <br>
  <input type="submit" value="Calculate">
</form>
</body>
</html>