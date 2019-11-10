<%-- 
    Document   : resultSearch
    Created on : Nov 4, 2019, 10:46:05 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            /* Float four columns side by side */
            .column {
                float: left;
                width: 25%;
                padding: 0 10px;
            }

            /* Remove extra left and right margins, due to padding */
            .row {margin: 0 -5px;}

            /* Clear floats after the columns */
            .row:after {
                content: "";
                display: table;
                clear: both;
            }

            /* Responsive columns */
            @media screen and (max-width: 600px) {
                .column {
                    width: 100%;
                    display: block;
                    margin-bottom: 20px;
                }
            }

            /* Style the counter cards */
            .card {
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
                padding: 16px;
                text-align: center;
                background-color: #f1f1f1;
            }
            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 80%;
                background: #f1f1f1;
            }

            form.example button {
                float: left;
                width: 60px;
                height: 42px;
                padding: 10px;
                background: #2196F3;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none;
                cursor: pointer;
            }

            form.example button:hover {
                background: #0b7dda;
            }

            form.example::after {
                content: "";
                clear: both;
                display: table;
            }
            .footer {
                position: absolute;
                right: 0;
                bottom: 0;
                left: 0;
                padding: 1rem;
                background-color: #efefef;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form class="example" action="SearchController" style="margin:auto;max-width:300px">
            <input type="text" placeholder="Search.." name="searchText" value="${param.searchText}">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <p>

        </p>
        <c:if test="${not empty listClass}">
            <h2>
                Class:
            </h2>
            <div class="row">
                <c:forEach var="x" items="${listClass}">
                    <div class="column">
                        <div class="card">
                            <h3>Class</h3>
                            <p><a href="TestController?classID=${x.classID}">${x.className}</a></p>
                            <p>${x.classContent}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${not empty listTest}">
            <h2>
                Test:
            </h2>
            <div class="row">
                <c:forEach var="x" items="${listTest}">
                    <div class="column">
                        <div class="card">
                            <h3>Test</h3>
                            <p><a href="TestController?testID=${x.testID}&action=TestInfo">${x.testName}</a></p>
                            <p>${x.classes.className}</p>
                            <p>${x.classes.classContent}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        <c:if test="${not empty listUser}">
            <h2>
                User:
            </h2>
            <ul style="list-style-type:none;">
                <c:forEach var="x" items="${listUser}">
                    <li><a href="UserController?userID=${x.userID}&action=info">${x.username}</a></li>
                    </c:forEach>
            </ul>
        </c:if>
        <p>

        </p>
        
    </body>
</html>
