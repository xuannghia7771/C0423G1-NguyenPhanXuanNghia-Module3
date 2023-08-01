<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 031 31/07/2023
  Time: 09:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/products">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["product"].getProductName()}</td>
    </tr>
    <tr>
        <td>Price: </td>
        <td>${requestScope["product"].getProductPrice()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${requestScope["product"].getProductDescription()}</td>
    </tr>
    <tr>
        <td>Description: </td>
        <td>${requestScope["product"].getProductPublisher()}</td>
    </tr>
</table>
</body>
</html>
