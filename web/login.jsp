<%-- 
    Document   : login
    Created on : Oct 19, 2019, 11:12:15 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!-- Include CSS File Here -->
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <style>
            .footer{
                position: relative
            }
            .form{
                align-items: center
            }
            .button3 {
            width: 313px;
            height: 40px;
            font-size: 16px;
            border-radius: 3px;
            

        }
        </style>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <c:if test="${not empty error}">
            ${error}
        </c:if>
        <div class="form">
        <div class="container">
            <div style="width:300px; margin:0 auto;">
                <h2>FPT Test Website</h2>
                <form id="form_id" method="post" name="myform" action="LoginController">
                    <p><label>User Name :</label>
                    <input type="text" name="username"/>
                    <label>Password :</label>
                    <input type="password" name="password"/>
                    <p><input type="submit" class="button3" value="Login" name="submit"/>
                </form>
                
            </div>
        </div>
        </div>             
        <div class="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>
