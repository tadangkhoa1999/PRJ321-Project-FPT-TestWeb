<%-- 
    Document   : index
    Created on : Oct 19, 2019, 10:35:07 AM
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
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <style>
            body {
                font-family: Arial;
            }

            * {
                box-sizing: border-box;
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
                height: 47px;
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
            table.center {
                margin-left:auto; 
                margin-right:auto;
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
            <input type="text" placeholder="Search.." name="searchText">
            <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <table class="center">
            <c:forEach var="x" items="${listSubject}">
                <tr>
                    <td>
                        <br><a href="ClassController?subjectID=${x.getSubjectID()}">${x.getSubjectName()}</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div class="footer">
        <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
