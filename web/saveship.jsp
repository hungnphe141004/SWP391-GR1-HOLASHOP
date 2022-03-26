<%-- 
    Document   : shiplist
    Created on : Mar 25, 2022, 8:11:17 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form method="POST" action="shipdetail">
            Order Id: ${requestScope.ship.orderid} <input type="hidden" name="id" value="${requestScope.ship.orderid}"/> <br/>
            Delivered:
            <input type="radio" 
                   ${(requestScope.ship.deli) ? "checked=\"checked\"" : ""}
                   name="deli" value="take" /> Take
            <input type="radio" 
                   ${(!requestScope.ship.deli) ? "checked=\"checked\"" : ""}
                   name="deli" value="ignore" /> Ignore<br/>
            <input type="submit" value="Save"/>

        </form> 
                   <hr>

        <table border="1px" style="text-align: center">
            <tr>
                <td>Product Id</td>
                <td>Product Name</td>
                <td>Product Image</td>
                <td>Product Amount</td>
                <td>Product Price</td>
            </tr>

            <c:forEach items="${requestScope.carts}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td>${c.name}</td>
                    <td><img src="${c.img}" alt="" style="width: 90px; height: 90px"></td>
                    <td>${c.amount}</td>
                    <td>${c.price}</td>
                </tr>
            </c:forEach>
        </tr
    </table>



</body>
</html>
