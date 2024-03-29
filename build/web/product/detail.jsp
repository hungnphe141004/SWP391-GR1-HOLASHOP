<%-- 
    Document   : detail
    Created on : Feb 10, 2022, 11:57:13 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | E-Shopper</title>
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
        <script src="js/pagger_1_1.js" type="text/javascript"></script>
    </head>
    <body>


        <header id="header"><!--header-->
            <div class="header_top"><!--header_top-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="contactinfo">
                                <ul class="nav nav-pills">
                                    <li><a href=""><i class="fa fa-phone"></i> +2 95 01 88 821</a></li>
                                    <li><a href=""><i class="fa fa-envelope"></i> info@domain.com</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="social-icons pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href=""><i class="fa fa-facebook"></i></a></li>
                                    <li><a href=""><i class="fa fa-twitter"></i></a></li>
                                    <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                                    <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                                    <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!--/header_top-->

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

            <div class="header-bottom"><!--header-bottom-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="mainmenu pull-left">
                                <ul class="nav navbar-nav collapse navbar-collapse">
                                    <li><a href="list">Home</a></li>
                                    <li class="dropdown"><a href="list">Shop<i class="fa fa-angle-down"></i></a>
                                        <ul role="menu" class="sub-menu">
                                            <li><a href="list">Products</a></li>
                                            <li><a href="detail?ProID=${requestScope.product.product_id}" class="active">Product Details</a></li> 
                                            <li><a href="checkout.html">Checkout</a></li> 
                                            <li><a href="cart">Cart</a></li> 
                                            <li><a href="login">Login</a></li> 
                                        </ul>
                                    </li> 
                                    <li><a href="404.html">404</a></li>
                                    <li><a href="contact-us.html">Contact</a></li>
                                </ul>
                            </div>
                        </div>
                        <form action="search">
                            <div class="col-sm-3">
                                <div class="search_box pull-right">
                                    <input type="text" name="ProductName" value="${requestScope.name}" placeholder="Search"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div><!--/header-bottom-->
        </header><!--/header-->
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="list">Home</a></li>
                    <li class="active">Product Detail</li>
                </ol>
            </div>
        </div>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="left-sidebar">
                            <h2>Category</h2>
                            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <c:forEach items="${requestScope.cates}" var="c">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="list1?CateID=${c.id}">

                                                    <p>${c.name}</p>
                                                </a>
                                            </h4>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>

                            <div class="brands_products"><!--brands_products-->
                                <h2>Brands</h2>
                                <div class="brands-name">
                                    <ul class="nav nav-pills nav-stacked">
                                        <c:forEach items="${requestScope.brands}" var="b">
                                            <li><a href="bybrand?BrandID=${b.id}"><p style="font-weight: bold"> ${b.name}</p></a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div><!--/brands_products-->

                            

                            <div class="shipping text-center"><!--shipping-->
                                <img src="images/home/shipping.jpg" alt="" />
                            </div><!--/shipping-->

                        </div>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details"><!--product-details-->
                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="${requestScope.product.img.image}" alt="" />
                                    <h3>ZOOM</h3>
                                </div>
                                <div id="similar-product" class="carousel slide" data-ride="carousel">

                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=3"><img src="Image/N95-Mask.jpg" alt="" style="width:90px;height:90px  "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=4"><img src="Image/Water.png" alt="" style="width:90px;height:90px "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=2"><img src="Image/Medial-Protective-Clothing.jpg" alt="" style="width:90px;height:90px "></a>
                                        </div>
                                        <div class="item">
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=3"><img src="Image/N95-Mask.jpg" alt="" style="width:90px;height:90px  "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=4"><img src="Image/Water.png" alt="" style="width:90px;height:90px "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=2"><img src="Image/Medial-Protective-Clothing.jpg" alt="" style="width:90px;height:90px "></a>
                                        </div>

                                        <div class="item">
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=3"><img src="Image/N95-Mask.jpg" alt="" style="width:90px;height:90px  "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=4"><img src="Image/Water.png" alt="" style="width:90px;height:90px "></a>
                                            <a href="http://localhost:8080/SWP391-GR1-HOLASHOP/detail?ProID=2"><img src="Image/Medial-Protective-Clothing.jpg" alt="" style="width:90px;height:90px "></a>
                                        </div>

                                    </div>

                                    <!-- Controls -->
                                    <a class="left item-control" href="#similar-product" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right item-control" href="#similar-product" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>

                            </div>
                            <div class="col-sm-7">
                                <div class="product-information"><!--/product-information-->
                                    <img src="" class="newarrival" alt="" />
                                    <h2>${requestScope.product.product_name}</h2>
                                    <p>Product ID: ${requestScope.product.product_id}</p>

                                    <span>
                                        <span>Price: ${requestScope.product.price}</span><br/>
                                        <label>Quantity:  <input type="text" value="${requestScope.product.stock}" /></label>
                                        <a href="addtocart?ProID=${requestScope.product.product_id}">
                                            <button type="button" class="btn btn-fefault cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Add to cart
                                            </button>
                                        </a>
                                    </span>
                                    <p><b>Description:</b> ${requestScope.product.description}</p>
                                    <p><b>Condition:</b> New</p>
                                    <p><b>Brand:</b> E-SHOPPER</p>
                                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                </div><!--/product-information-->
                            </div>
                        </div><!--/product-details-->

                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    <li><a href="#details" data-toggle="tab">Recommended Items</a></li>
                                    <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                                    <li><a href="#tag" data-toggle="tab">Tag</a></li>
                                    <li class="active"><a href="#reviews" data-toggle="tab">Reviews (${requestScope.num})</a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade" id="details" >
                                    <c:forEach items="${requestScope.products}" var="s">
                                        <div class="col-sm-3">
                                            <div class="product-image-wrapper">
                                                <div class="single-products">
                                                    <div class="productinfo text-center">
                                                        <img src="${s.img.image}" alt="" style="width:140px; height: 140px" />
                                                        <h2>${s.price}</h2>
                                                        <p><a href="detail?ProID=${s.product_id}">${s.product_name}</a></p>
                                                        <button type="button" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="tab-pane fade" id="companyprofile" >
                                    <p>Thong tin cong ty</p>

                                </div>

                                <div class="tab-pane fade" id="tag" >
                                    <p>Phan cua tag</p>
                                </div>

                                <div class="tab-pane fade active in" id="reviews" >
                                    <div class="col-sm-12">
                                        <ul>
                                            <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                            <li><a href=""><i class="fa fa-calendar-o"></i>31 JAN 2022</a></li>
                                        </ul>
                                        <p>${requestScope.product.description}</p>
                                        <p><b>Write Your Review</b></p>

                                        <form action="detail?ProID=1" method="POST">
                                            <span>
                                                <input type="text" placeholder="Your Name" name="name"/>
                                                <input type="email" placeholder="Email Address" name="email"/>
                                            </span>
                                            <textarea type="text" name="feedback" ></textarea>
                                            <input type="hidden" name="date" value="${requestScope.date}">
                                            <input type="hidden" name="id" value="${requestScope.product.product_id}">

                                            <b>Rating: </b> <img src="images/product-details/rating.png" alt="" />
                                            <input type="submit" class="btn btn-default pull-right" value="Submit"/>

                                        </form>
                                    </div>
                                </div>


                            </div>

                            <div class="col-sm-9">
                                <div class="blog-post-area">
                                    <h2 class="title text-center" style="margin-left: 200px">Latest Feedback from our Website(${requestScope.num})</h2>
                                    <c:forEach items="${requestScope.feeds}" var="s">
                                        <div class="single-blog-post">


                                            <div class="post-meta">
                                                <ul>
                                                    <li><i class="fa fa-user"></i> ${s.name}</li>

                                                    <li><i class="fa fa-calendar"></i> ${s.date}</li>
                                                </ul>

                                            </div>


                                            <p>${s.feedback}</p>
                                            <hr>
                                        </div>
                                    </c:forEach>




                                </div>
                                <!--                                <div class="pagination-area">
                                                                    <ul class="pagination">
                                                                        <li onclick="active"> <div id="paggerBottom" class="pagger"></div></li>
                                
                                
                                                                        <script>
                                                                            // createPagger('paggerTop',${requestScope.pageindex},2,${requestScope.totalpage});
                                                                            createPagger('paggerBottom',${requestScope.pageindex},${requestScope.totalpage}, 4,${requestScope.ProID});
                                                                        </script>
                                                                    </ul>                            </div>-->
                            </div>

                        </div><!--/category-tab-->



                    </div>
                </div>
            </div>
        </section>

        <footer id="footer"><!--Footer-->
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="companyinfo">
                                <h2><span>e</span>-shopper</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe1.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe2.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe3.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>

                            <div class="col-sm-3">
                                <div class="video-gallery text-center">
                                    <a href="#">
                                        <div class="iframe-img">
                                            <img src="images/home/iframe4.png" alt="" />
                                        </div>
                                        <div class="overlay-icon">
                                            <i class="fa fa-play-circle-o"></i>
                                        </div>
                                    </a>
                                    <p>Circle of Hands</p>
                                    <h2>24 DEC 2014</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="address">
                                <img src="images/home/map.png" alt="" />
                                <p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="footer-widget">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Service</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Online Help</a></li>
                                    <li><a href="">Contact Us</a></li>
                                    <li><a href="">Order Status</a></li>
                                    <li><a href="">Change Location</a></li>
                                    <li><a href="">FAQ’s</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Quock Shop</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">T-Shirt</a></li>
                                    <li><a href="">Mens</a></li>
                                    <li><a href="">Womens</a></li>
                                    <li><a href="">Gift Cards</a></li>
                                    <li><a href="">Shoes</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>Policies</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Terms of Use</a></li>
                                    <li><a href="">Privecy Policy</a></li>
                                    <li><a href="">Refund Policy</a></li>
                                    <li><a href="">Billing System</a></li>
                                    <li><a href="">Ticket System</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-2">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="">Company Information</a></li>
                                    <li><a href="">Careers</a></li>
                                    <li><a href="">Store Location</a></li>
                                    <li><a href="">Affillate Program</a></li>
                                    <li><a href="">Copyright</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-sm-offset-1">
                            <div class="single-widget">
                                <h2>About Shopper</h2>
                                <form action="#" class="searchform">
                                    <input type="text" placeholder="Your email address" />
                                    <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                                    <p>Get the most recent updates from <br />our site and be updated your self...</p>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>

        </footer><!--/Footer-->



        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>


    </body>
</html>
