<%-- 
    Document   : register
    Created on : Oct 19, 2019, 11:35:04 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .form{
            align-items: center
        }
        .button3 {
            width: 313px;
            height: 40px;
            font-size: 16px;
            border-radius: 3px;
        }
        .footer {
            position: relative;
            bottom: -100px;
            width: 100%;
            height: 1rem;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"></jsp:include>

            <form action="RegisterController">
            <c:if test="${not empty errorRegister}">
                <p style="color: red">${errorRegister}</p>
            </c:if>
            <c:if test="${not empty error}">
                <p style="color: red" >${error}</p>
            </c:if>
            <div class="container">
                <div style="width:300px; margin:0 auto;">
                    <h2>Register</h2>
                    <tr><td>Email</td><td><input type="text" name="email"/></td></tr>
                    <tr><td>Username</td><td><input type="text" name="username"/></td></tr>
                    <tr><td>Password</td><td><input type="password" name="password"/></td></tr>
                    <p><input type="submit" class="button3" name="submit" value="Register"/></p>
                </div>
            </div>

        </form>

        <jsp:include page="footer.jsp"/>

    </body>

</html>
