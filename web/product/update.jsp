<%-- 
    Document   : update
    Created on : Mar 18, 2022, 11:04:25 AM
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
        <form action="update" method="POST">
            Product Id: ${requestScope.product.id} <input type="hidden" name="ProID" value="${requestScope.product.id}"/><br/>
            Product Image: <input type="text" name="img" placeholder="Image/xxx.jpg" value="${requestScope.product.img.image}"/><br/>
            Product Name: <input type="text" name="name" value="${requestScope.product.name}"/> <br/>
            Product Description: <input type="text" name="des" style="" value="${requestScope.product.descrip}"/><br/>
            Original Price: <input type="text" name="orginal" value="${requestScope.product.oprice}"/><br/>
            Sell Price: <input type="text" name="price" value="${requestScope.product.sprice}"/><br/>
            Sale Percent: <input type="text" name="sale" value="${requestScope.product.sellper}"/><br/>
            Sub Category: <select name="cate"> 
                <c:forEach items="${requestScope.cates}" var="c">

                    <option ${(c.id ==  requestScope.product.cate.id) ? "selected=\"selected\"" : ""}
                        value="${c.id}">${c.name}</option>

                </c:forEach>
            </select><br/>
            
            Seller: <select name="seller"> 
                <c:forEach items="${requestScope.sellers}" var="x">

                    <option ${(x.id == requestScope.product.seller.id) ? "selected=\"selected\"" : ""}
                        value="${x.id}">${x.name}</option>

                </c:forEach>
            </select><br/>
            Amount: <input type="text" name="stock" value="${requestScope.product.stock}"/><br/>
            Status: <select name="status"> 
                <c:forEach items="${requestScope.status}" var="s">

                    <option ${(s.id == requestScope.product.status.id) ? "selected=\"selected\"" : ""}
                        value="${s.id}">${s.name}</option>

                </c:forEach>
            </select><br/>
            Brand:<select name="brand"> 
                <c:forEach items="${requestScope.brands}" var="b">

                    <option ${(b.id == requestScope.product.brand.id) ? "selected=\"selected\"" : ""}
                        value="${b.id}">${b.name}</option>

                </c:forEach>
            </select><br/>
            Height: <input type="text" name="height" value="${requestScope.product.hei}"/><br/>
            Width: <input type="text" name="width" value="${requestScope.product.wid}"/><br/>
            Weight: <input type="text" name="weight" value="${requestScope.product.wei}"/><br/>

            <input type="submit" value="Save"/>
        </form>
        
        
    </body>
</html>
