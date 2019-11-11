<%-- 
    Document   : navigationBar
    Created on : Oct 19, 2019, 2:45:16 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                margin: 0;
                font-family: Arial, Helvetica, sans-serif;
            }

            .topnav {
                overflow: hidden;
                background-color: #333;
            }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }

            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }

            .topnav-right {
                float: right;
            }
        </style>
    </head>
    <body>
        <div class="topnav">
            <a class="active" href="home">Home</a>
            <a href="ResponseController">Show Response</a>
            <a href="https://github.com/tadangkhoa1999/FPT_Test">About</a>
            <div class="topnav-right">
                <c:if test="${not empty sessionScope.login}">
                    <a href="UserController?actionInfo=showInfo">Welcome ${sessionScope.login.username}</a>
                    <a href="LogoutController">
                        <img src="media/signout.png"/> Sign out
                    </a> 
                </c:if>
                <c:if test="${empty sessionScope.login}">    
                    <a href="login.jsp" >
                        <img src="media/login.png"/> Login
                    </a>
                    <a href="register.jsp">
                        <img src="media/register.png"/> Register
                    </a>
                </c:if> 
            </div>
        </div>
        <p></p>
    </body>
</html>
