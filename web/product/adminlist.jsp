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
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Manage | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
        <script>
            function doUpdate(ProID)
            {
                window.location.href = "adminupdate?ProID=" + ProID;
            }
            function doDelete(id)
            {
                var c = confirm("Are you sure?");
                if (c)
                {
                    window.location.href = "admindelete?id=" + id;
                }
            }
        </script>
    </head>
    <div class="header-middle"><!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="list"><img src="images/home/logo.png" alt="" /></a>
                            </div>
                            <div class="btn-group pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        VN
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canada</a></li>
                                        <li><a href="">UK</a></li>
                                    </ul>
                                </div>

                                <div class="btn-group">
                                    <button type="button" class="btn btn-default dropdown-toggle usa" data-toggle="dropdown">
                                        VND
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="">Canadian Dollar</a></li>
                                        <li><a href="">Pound</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="UserController"><i class="fa fa-user"></i> Account</a></li>
                                    <li><a href="checkout"><i class="fa fa-crosshairs"></i> Checkout</a></li>
                                    <li><a href="cart"><i class="fa fa-shopping-cart"></i> Cart</a></li>
                                    <li><a href="login"><i class="fa fa-lock"></i> Login</a></li>
                                    <li><a href="logout" class=""><i class="fa fa-lock"></i> Logout</a></li>
                                   
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header-middle-->
    <body>
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="admincommand.jsp">Back</a></li>
                    <li class="active">Product Manage</li>
                </ol>
            </div>
        </div>
                          Hello: ${sessionScope.user.userName}
        <button><a href="adminadd">Add New Product</a></button><br/><br/>
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
                    <td> <img src="${p.img.image}" alt="" style="width: 120px; height: 120px"/></td>
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
                    <td><a href="admindetail?ProID=${p.id}">Detail</a></td>
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
