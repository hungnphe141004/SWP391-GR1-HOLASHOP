<%-- 
    Document   : userorderhistory
    Created on : Mar 29, 2022, 12:36:20 PM
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
        Hello <c:forEach items="${requestScope.order}" var="o">

        <td>${o.id}</td>

s
    </c:forEach>
    <table border="1px">
        <tr>
            <td>Order ID</td>    
            <td>Total Price</td> 
        </tr>
        <c:forEach items="${requestScope.order}" var="o">
            <tr>
                <td>${o.id}</td>
                <td>${o.totalPrice}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
