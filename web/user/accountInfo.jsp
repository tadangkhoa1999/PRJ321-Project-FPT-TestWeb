<%-- 
    Document   : changeInfo
    Created on : Nov 3, 2019, 9:33:14 AM
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
    <script>
        var uid = document.getElementById('uid');
        var pwd = document.getElementById('pwd');
        var repwd = document.getElementById('repwd');
        uid.oninvalid = function (event) {
            event.target.setCustomValidity('Username can not contain special character');
        };
        pwd.oninvalid = function (event) {
            event.target.setCustomValidity('Password contain at least 4 characters and must contain number');
        };
        repwd.oninvalid = function (event) {
            event.target.setCustomValidity('Password contain at least 4 characters and must contain number');
        };

    </script>
    <style>
        .form{
            text-align: center;
            align-items: center;
        }

        .footer{
            position: relative;
        }
        .button3 {
            width: 80px;
            height: 30px;
            font-size: 16px;
            border-radius: 3px;
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <div class="form">
            <div class="container">
                <form action="UserController">
                    <div style="width:300px; margin:0 auto;">
                        <h1>${login.getUsername()}'s Info</h1>
                        <c:if test="${not empty login}">

                            <table>
                                <tr>
                                    <th></th><th></th>
                                </tr>
                                <tr>
                                    <td>User ID </td><td><input type="text" name="userid" value="${login.getUserID()}" readonly="readonly" /></td>
                                </tr>
                                <tr>
                                    <td>Username </td><td><input type="text" name="username"  value="${login.getUsername()}"  readonly="readonly"/></td>
                                </tr>    
                                <tr>    
                                    <td>Password </td><td><input type="password" name="password" value="${login.getPassword()}"  readonly="readonly"/></td>
                                </tr>

                                <tr>
                                    <td>Email</td><td><input type="text" name="email" value="${login.getEmail()}" readonly="readonly"/></td>
                                </tr>
                                <tr>
                                    <td>Type</td><td><input type="text" name="type" value="user" readonly="readonly"/></td>
                                </tr>
                            </table>
                            <div style="text-align: center">
                                <br><input type="submit" class="button3" name="actionInfo" value="Change" onclick="return confirm('Do you want to change?')"/>
                            </div>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
        <br><jsp:include page="footer.jsp"/>
    </body>
</html>
