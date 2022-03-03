<%-- 
    Document   : register
    Created on : Feb 16, 2022, 8:29:00 AM
    Author     : ASUS
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
        <form action="register" method="POST">
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>UserName</td>
                        <td><input type="text" name="userName"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="text" name="password"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        
                <td><input type="text" name="email"></td>
                        
                    </tr>
                   
                    <tr>
                       
                        <td><input type="submit" value="Register"</td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
