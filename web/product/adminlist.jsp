<%-- 
    Document   : adminlist
    Created on : Mar 16, 2022, 11:01:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function doUpdate(ProID)
            {
                window.location.href = "update?ProID=" + ProID;
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "delete?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        Hello: ${sessionScope.user.userName}
        <button><a href="add">Add New Product</a></button><br/><br/>
        <table border="1px"  style="margin-left:auto;margin-right:auto; width: 1500px; text-align: center; border-color: blue#33ccff;
               background-color:#f6f7f8; color: brown; border-collapse: collapse">
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
                <td>Option 1</td>
                <td>Option 2</td>
                <td>Option 3</td>

            </tr>
            <c:forEach items="${requestScope.products}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td> <img src="../${p.img.image}" alt="" style="width: 120px; height: 120px"/></td>
                    <td>${p.name}</td>
                    <td>${p.descrip}</td>
                    <td>${p.oprice}</td>
                    <td>${p.sprice}</td>
                    <td>${p.sellper}</td>
                    <td>${p.cate.name}</td>
                    <td>${p.seller.name}</td>
                    <td>${p.stock}</td>
                    <td>${p.status.name}</td>
                    <td>${p.brand.name}</td>
                    <td>${p.hei}</td>
                    <td>${p.wid}</td>
                    <td>${p.wei}</td>
                    <td><a href="detail?ProID=${p.id}">Detail</a></td>
                    <td>
                        <input type="button" onclick="doUpdate(${p.id});" value="Update"/>
                    </td>
                    <td>
                        <input type="button" onclick="doDelete(${p.id});" value="Delete"/>
                    </td>

                </tr>
            </c:forEach>
        </table>
    </body>
</html>
