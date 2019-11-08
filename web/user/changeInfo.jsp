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
        <title>JSP Page</title>
    </head>
    <body>
        <form action="changeInfoController">
            <h1>Change Account Info</h1>
            <c:if test="${not empty error}">
                <p style="color: red">${error}</p>
            </c:if>
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
            <c:if test="${not empty login}">

                <table>
                    <tr>
                        <th></th><th></th>
                    </tr>
                    <tr>
                        <td>User ID </td><td><input type="text" name="userid" value="${login.getUserID()}" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Username </td><td><input type="text" name="username"  value="${login.getUsername()}"  pattern="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" title="Username can't contain special characters"/></td>
                    </tr>    
                    <tr>    
                        <td>Password </td><td><input type="password" name="password" value=""  pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" title="Password must have at least 4 character and contain number"/></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td><td><input type="password" name="repassword" value="" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,}$" title="Password must have at least 4 character and contain number" /></td>
                    </tr>
                    <tr>
                        <td>Email</td><td><input type="text" name="email" value="${login.getEmail()}" /></td>
                    </tr>
                    <tr>
                        <td>Type</td><td><input type="text" name="type" value="user" /></td>
                    </tr>
                </table>
                    <input type="submit" name="save" value="Save" onclick="return confirm('Do you want to change?')"/>
            </c:if>
        </form>
    </body>
</html>
