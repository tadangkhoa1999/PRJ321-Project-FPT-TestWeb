<%-- 
    Document   : changeInfo
    Created on : Nov 5, 2019, 10:09:06 AM
    Author     : BangPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Info</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <style>
        .form{
            align-items: center
        }
        
        .footer{
            margin-top: 100px;
            position: relative;
        }
        .button3 {
            width: 60px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
    <c:if test="${not empty error}">
        <p style="color: red">${error}</p>
    </c:if>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
    <div class="form">
        <div class="container">
            <form action="UserController">
                <div style="width:300px; margin:0 auto;">
                    <h2>Change Account Info</h2>
                    <c:if test="${not empty login}">
                        <table>
                            <tr>
                                <th></th><th></th>
                            </tr>
                            <tr>
                                <td>User ID </td><td><input type="text" name="userid" value="${login.getUserID()}" readonly="readonly" /></td>
                            </tr>
                            <tr>
                                <td>Username </td><td><input type="text" name="username"  value="${login.getUsername()}"/></td>
                            </tr>    
                            <tr>    
                                <td>Password </td><td><input type="password" name="password" value=""/></td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td><td><input type="password" name="repassword" value=""/></td>
                            </tr>
                            <tr>
                                <td>Email</td><td><input type="text" name="email" value="${login.getEmail()}" /></td>
                            </tr>
                            <tr>
                                <td>Type</td><td><input type="text" name="type" value="user" readonly="readonly"/></td>
                            </tr>
                        </table>
                        <div style="text-align: center">
                            <input type="submit" class="button3" name="actionInfo" value="save" onclick="return confirm('Do you want to change?')"/>
                        </div>
                    </c:if>
            </form>
        </div>
    </div>
</div>
    <jsp:include page="footer.jsp"/></div>

</html>
