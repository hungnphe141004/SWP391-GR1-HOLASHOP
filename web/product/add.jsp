<%-- 
    Document   : add
    Created on : Mar 18, 2022, 12:24:54 AM
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
        <form action="add" method="POST">
            Product Id: <input type="text" name="id"/><br/>
            Product Image: <input type="text" name="img" placeholder="Image/xxx.jpg"/><br/>
            Product Name: <input type="text" name="name"/> <br/>
            Product Description: <input type="text" name="des"/><br/>
            Original Price: <input type="text" name="orginal"/><br/>
            Sell Price: <input type="text" name="price"/><br/>
            Sale Percent: <input type="text" name="sale"/><br/>
            Sub Category: <select name="cate"> 
                <c:forEach items="${requestScope.cates}" var="c">
                 
                    <option value="${c.id}">${c.name}</option>
                
                </c:forEach>
            </select><br/>
            Seller: <select name="seller"> 
                <c:forEach items="${requestScope.sellers}" var="s">
                 
                    <option value="${s.id}">${s.name}</option>
                
                </c:forEach>
            </select><br/>
            Amount: <input type="text" name="stock"/><br/>
            Status: <select name="status"> 
                <c:forEach items="${requestScope.status}" var="s">
                 
                    <option value="${s.id}">${s.name}</option>
                
                </c:forEach>
            </select><br/>
            Brand:<select name="brand"> 
                <c:forEach items="${requestScope.brands}" var="b">
                 
                    <option value="${b.id}">${b.name}</option>
                
                </c:forEach>
            </select><br/>
            Height: <input type="text" name="height"/><br/>
            Width: <input type="text" name="width"/><br/>
            Weight: <input type="text" name="weight"/><br/>
            
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
