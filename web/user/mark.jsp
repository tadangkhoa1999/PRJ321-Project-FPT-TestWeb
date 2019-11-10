<%-- 
    Document   : mark
    Created on : Oct 26, 2019, 9:51:49 AM
    Author     : BangPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .footer {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            padding: 1rem;
            text-align: center;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div style="text-align: center">
            <c:if test="${not empty sessionScope.mark}">
                Your mark is
                ${sessionScope.mark}
                <p><a href="TestController?classID=${sessionScope.classID}">Go to class</a></p>
            </div>
        </c:if>
        <div class="footer">
            <jsp:include page="footer.jsp"/>
        </div>

    </body>
</html>
