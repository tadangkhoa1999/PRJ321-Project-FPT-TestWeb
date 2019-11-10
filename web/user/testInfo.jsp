<%-- 
    Document   : testInfo
    Created on : Oct 27, 2019, 3:07:24 PM
    Author     : BangPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test Info</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .form{
            text-align:center
        }
        .footer{
            position: absolute
        }
        .body{
            align-content: center
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div class="form">
            <div class="container">
                <form action="QuestionController">
                    <c:if test="${not empty TestInfo}">

                        <h1>${TestInfo.testName}</h1>
                        <p>${TestInfo.testContent}

                        <p><input type="submit" value="Show Question" name="action" />

                        </c:if>
                </form>
            </div>
        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
