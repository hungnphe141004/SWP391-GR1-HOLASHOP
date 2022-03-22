<%-- 
    Document   : admindetail
    Created on : Mar 20, 2022, 8:16:36 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1px" style="text-align: center">
            <tr>
                <td>Product Id</td>
                <td>Image</td>
                <td>Product Name</td>
                <td>Description</td>
                <td>Original Price</td>
                <td>Sell Price</td>
                <td>Sale Percent</td>
                <td>Sub Category</td>
                <td>Seller</td>
                <td>Amount</td>
                <td>Status</td>
                <td>Brand</td>
                <td>Height</td>
                <td>Width</td>
                <td>Weight</td>
            </tr>
            <tr>
                <td>${requestScope.product.id}</td>
                    <td> <img src="../${requestScope.product.img.image}" alt="" style="width: 120px; height: 120px"/></td>
                    <td>${requestScope.product.name}</td>
                    <td>${requestScope.product.descrip}</td>
                    <td>${requestScope.product.oprice}</td>
                    <td>${requestScope.product.sprice}</td>
                    <td>${requestScope.product.sellper}</td>
                    <td>${requestScope.product.cate.name}</td>
                    <td>${requestScope.product.seller.name}</td>
                    <td>${requestScope.product.stock}</td>
                    <td>${requestScope.product.status.name}</td>
                    <td>${requestScope.product.brand.name}</td>
                    <td>${requestScope.product.hei}</td>
                    <td>${requestScope.product.wid}</td>
                    <td>${requestScope.product.wei}</td>
            </tr>
        </table>
    </body>
</html>
