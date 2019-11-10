<%-- 
    Document   : subject
    Created on : Oct 19, 2019, 1:22:53 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Class</title>
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
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <h1 style="text-align: center">List Classes</h1>
        <div class="row">
            <c:forEach var="x" items="${classList}">
                <div class="column">
                    <div class="card">
                        <h3>Class</h3>
                        <p><a href="TestController?classID=${x.classID}">${x.className}</a></p>
                        <p>${x.classContent}</p>
                        <c:url var="delete" value="ClassController">
                            <c:param name="subjectID" value="${param.subjectID}"/>
                            <c:param name="classID" value="${x.classID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <p>
                            <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                                <img src="media/delete.png"/> Delete
                            </a>
                        </p>
                    </div>
                </div>
            </c:forEach>
            <div class="column">
                <div class="card">
                    <c:url var="add" value="ClassController">
                        <c:param name="subjectID" value="${param.subjectID}"/>
                        <c:param name="action" value="add"/>
                    </c:url>
                    <h3>Class</h3>
                    <p>
                        <a href="${add}" onclick="return confirm('Ban co muon them?')">
                            <img src="media/add.png"/>
                        </a>
                    </p>
                    <p>
                        Add Class
                    </p>
                </div>
            </div>
        </div>
        
    </body>
</html>
