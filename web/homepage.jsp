<%-- 
    Document   : homepage
    Created on : Mar 4, 2022, 1:32:18 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>User Profile</title>
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
    </head><!--/head-->
    <body>
        <div id="main">
            <div id="header">
                <ul id=nav>
                    <li><a href="#">Happy Programming</a></li>
                    <c:if test="${sessionScope.user==null}">
                        <li><a href="login.jsp">Login</a></li>                                           
                    </c:if>

                    <c:if test="${sessionScope.user!=null}">
                        <li><a href="#" style="padding-right:0">Hello: ${sessionScope.user.userName}                              
                            </a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="UserProfile.jsp"
                           style="padding: 0 8px">Profile</a></li>
                      
                    </c:if>

                </ul>
            </div>
        </div>
    </body>
</html>
