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
        Hello: ${sessionScope.user.username}<br/>
        <table border="1px" style="text-align: center">
            <tr>
                <td>Order Id</td>
                <td>Customer Name</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Note</td>
                <td>Delivered</td>
                <td>f0</td>
                <td>Shipper</td>


            </tr>
            <c:forEach items="${requestScope.ship}" var="s">
                <tr>

                    <td><a href="shipdetail?id=${s.orderid}">${s.orderid}</a></td>
                    <td>${s.cus_name}</td>
                    <td>${s.address}</td>
                    <td>${s.phone}</td>
                    <td>${s.note}</td>

                    <td>
                        <input type="checkbox"
                               ${(s.deli)?"checked=\"checked\"":""}
                               disabled="disabled"/>
                    </td>
                    <td>
                        <input type="checkbox"
                               ${(s.f0)?"checked=\"checked\"":""}
                               disabled="disabled"/>
                    </td>
                    <td>${s.shipper}</td>




                </tr>
            </c:forEach>
        </table>
        On Going:
        <table border="1px" style="text-align: center">
            <tr>
                <td>Order Id</td>
                <td>Customer Name</td>
                <td>Address</td>
                <td>Phone</td>
                <td>Note</td>
                <td>Delivered</td>
                <td>f0</td>
                <td>Shipper</td>

            </tr>
            <c:forEach items="${requestScope.ship1}" var="s">
                <tr>

                    <td>${s.orderid}</td>
                    <td>${s.cus_name}</td>
                    <td>${s.address}</td>
                    <td>${s.phone}</td>
                    <td>${s.note}</td>

                    <td>
                        <input type="checkbox"
                               ${(s.deli)?"checked=\"checked\"":""}
                               disabled="disabled"/>
                    </td>
                    <td>
                        <input type="checkbox"
                               ${(s.f0)?"checked=\"checked\"":""}
                               disabled="disabled"/>
                    </td>
                    <td>${s.shipper}</td>




                </tr>
            </c:forEach>
        </table>
    </body>
</html>
